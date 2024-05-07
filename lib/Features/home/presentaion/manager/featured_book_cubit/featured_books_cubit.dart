import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book_model/Book_model.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.home_repo) : super(FeaturedBooksInitial());
  final HomeRepo home_repo;
  Future<void> fetchFuturedBooks({required String type})async{
    emit(FeaturedBooksLoading());
    var result =await home_repo.fetchFeaturedBooks(type: type);
    result.fold((failure){
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books){
     emit(FeaturedBooksSuccess(books));
    });

  }
}
