import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/book_model.dart';

part 'search_book_state.dart';

class SearchBookCubit extends Cubit<SearchBookState> {
  SearchBookCubit(this.searchRepo) : super(SearchBookInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchedBooks({ String searchText =""})async{
    emit(SearchBookLoading());
    var result= await searchRepo.fetchResultBooks(searchText: searchText);
    result.fold((failure) {
      emit(SearchBookFailure(failure.errorMessage));

    }, (books) {
      emit(SearchBookSuccess(books));
    });

  }
}

