import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/repo/home_repo.dart';
import 'package:bookly_app/Features/home/data/repo/home_repo_impl.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book_model/Book_model.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this._homeRepo) : super(SimilarBooksInitial());
  final HomeRepo _homeRepo;
  Future<void> getSimilarBooks({required String category})async{
   emit(SimilarBooksLoading());
   var result =await _homeRepo.featchSimilarBooks(category: category);
   result.fold((failure){
     emit(SimilarBooksFailure(failure.errMessage));
   }, (book){
     emit(SimilarBooksSucess(book));
   } );

  }
}
