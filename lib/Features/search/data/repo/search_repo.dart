import 'package:bookly_app/Features/home/data/models/book_model/Book_model.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';


abstract class SearchRepo{
  Future<Either<Failure,List<BookModel>>>featchSearchBooks({required String title});

}