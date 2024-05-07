part of 'search_cubit.dart';

@immutable
abstract class SearchState {
  const SearchState();
}
class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchSucess extends SearchState {
  final List<BookModel>books;

 const SearchSucess(this.books);

}
class SearchFailure extends SearchState {
  final String ErrMsg;

  const SearchFailure(this.ErrMsg);
}

