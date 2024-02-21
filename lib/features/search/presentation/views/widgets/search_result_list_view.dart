import 'package:bookly_app/core/widgets/custom_book_item.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_widget.dart';

import 'package:bookly_app/features/search/presentation/manger/search_books_cubit/search_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key,});

  @override


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBookCubit, SearchBookState>(
        builder: (context, state) {
          if (state is SearchBookSuccess) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomBookItem(bookModel: state.books[index]),
                );
              },
              itemCount: state.books.length,
              physics: const BouncingScrollPhysics(),
            );
          } else if (state is SearchBookFailure) {
            return const CustomErrorWidget(errorMessage: "Not found a book with that name");
          } else {
            return const CustomLoadingWidget();
          }
        });
  }
}
