part of 'similar_books_cubit.dart';

@immutable
abstract class SimilarBooksState {
  const SimilarBooksState();
}
class SimilarBooksInitial extends SimilarBooksState {}
class SimilarBooksLoading extends SimilarBooksState {}
class SimilarBooksSucess extends SimilarBooksState {
  final List<BookModel> books;
  const SimilarBooksSucess( this.books);

}
class SimilarBooksFailure extends SimilarBooksState {
  final String errMsg;
  const SimilarBooksFailure(this.errMsg);
}

