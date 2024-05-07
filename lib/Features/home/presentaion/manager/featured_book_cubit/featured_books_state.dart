part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {
  const FeaturedBooksState();
}
class FeaturedBooksInitial extends FeaturedBooksState {}
class FeaturedBooksLoading extends FeaturedBooksState {}
class FeaturedBooksFailure extends FeaturedBooksState {
  final String message;

   const FeaturedBooksFailure(this.message);
}
class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookModel>books;
  const FeaturedBooksSuccess(this.books);
}
