import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/book_model.dart';
import '../../../data/repos/home_repo.dart';

part 'newset_books_state.dart';

class NewBooksCubit extends Cubit<NewBookState> {
  NewBooksCubit(this.homeRepo) : super(NewBookInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks()async{
    emit(NewestBooksLoading());
    var result= await homeRepo.fetchNewsetBooks();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errorMessage));

    }, (books) {
      emit(NewestBooksSuccess(books));
    });

  }

}
