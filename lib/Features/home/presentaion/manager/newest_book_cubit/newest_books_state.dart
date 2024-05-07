part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksState {
  const NewestBooksState();
}

class NewestBooksInitial extends NewestBooksState {}
class NewestBooksLoading extends NewestBooksState {}
class NewestBooksFailure extends NewestBooksState {
  final String message;
  const NewestBooksFailure(this.message);
}
class NewestBooksSucess extends NewestBooksState {
  final List<BookModel> books;
  const NewestBooksSucess(this.books);
}



