import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/Book_model.dart';
import 'package:bookly_app/Features/home/data/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this._homeRepo) : super(NewestBooksInitial());
  final HomeRepo _homeRepo;
  Future<void> fetchNewestBooks()async{
    emit(NewestBooksLoading());
    var result =await _homeRepo.fetchNewestBooks();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errMessage));
    }, (book){
      emit(NewestBooksSucess(book));
    });
  }

}
