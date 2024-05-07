import 'package:bookly_app/Features/home/data/models/book_model/Book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
abstract class HomeRepo{
  Future<Either<Failure,List<BookModel>>>fetchNewestBooks();
  Future<Either<Failure,List<BookModel>>>fetchFeaturedBooks(
  {required String type}
      );
  Future<Either<Failure,List<BookModel>>>featchSimilarBooks({required String category});


}