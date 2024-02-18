import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:flutter/material.dart';

import '../../../data/models/book_model.dart';


part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

 fetchFeaturedBooks()async{
    emit(FeaturedBooksLoading());
  var result= await homeRepo.fetchFeaturedBooks();
  result.fold((failure) {
    emit(FeaturedBooksFailure(failure.errorMessage));

  }, (books) {
    emit(FeaturedBooksSuccess(books));
  });

  }

}
