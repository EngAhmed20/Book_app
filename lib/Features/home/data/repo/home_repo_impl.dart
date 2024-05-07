import 'package:bookly_app/Features/home/data/models/book_model/Book_model.dart';
import 'package:bookly_app/Features/home/data/repo/home_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';


class HomeRepoImpl implements HomeRepo{
  final ApiService apiService;
  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async{
   try{
     var data=await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=computer science&sorting=newest');
     List<BookModel>Books=[];
     for (var item in data['items'])
       {
         try{
           Books.add(BookModel.fromJson(item));
         }catch(e){
           Books.add(BookModel.fromJson(item));

         }
       }
     return Right(Books);
   }catch(e){
     if(e is DioException){
       return Left(ServerFailure(e.error.toString()));

     }
     return Left(ServerFailure(e.toString()));
     
   }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks({required String type}) async{
    try{
      var data=await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&q=subject:$type');
      List<BookModel>Books=[];
      for(var item in data['items'])
        {
          Books.add(BookModel.fromJson(item));
        }
      return Right(Books);
    }catch(e){
      if(e is DioException){
        return Left(ServerFailure(e.error.toString()));

      }
      return Left(ServerFailure(e.toString()));


    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> featchSimilarBooks({required String category})async {
    try{
      var data=await apiService.get(endPoint: 'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:Programming');
      List<BookModel>books=[];
      for(var item in data['items'])
        {
          books.add(BookModel.fromJson(item));
        }
      return Right(books);
    }catch(e){
      if(e is DioException){
        return Left(ServerFailure(e.error.toString()));

      }
      return Left(ServerFailure(e.toString()));
      
    }
  }

}