import 'package:bookly_app/Features/home/data/models/book_model/Book_model.dart';
import 'package:bookly_app/Features/search/data/repo/search_repo.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';


class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> featchSearchBooks({required String title}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=intitle:$title');
      List<BookModel>books = [];
      for (var item in data['items']) {
        try{
          books.add(BookModel.fromJson(item));
        }catch(e){
          books.add(BookModel.fromJson(item));

        }
      }
      return Right(books);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
