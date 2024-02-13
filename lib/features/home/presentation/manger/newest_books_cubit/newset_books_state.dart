part of 'newset_books_cubit.dart';

@immutable
abstract class NewBookState {}

class NewBookInitial extends NewBookState {}


class NewestBooksSuccess extends NewBookState {
  final List<BookModel> books;

  NewestBooksSuccess(this.books);

}
class  NewestBooksFailure extends NewBookState {
  final String errorMessage;

  NewestBooksFailure(this.errorMessage);

}
class NewestBooksLoading extends NewBookState {}