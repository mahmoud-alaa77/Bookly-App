import 'package:bookly_app/features/search/presentation/manger/search_books_cubit/search_book_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatefulWidget {
   SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
String text='';

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(
onChanged: (val){
  text=val;
  setState(() {
    BlocProvider.of<SearchBookCubit>(context)
        .fetchSearchedBooks(searchText: text);

  });
},
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Search result",
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 8,
          ),
           Expanded(child: SearchResultListView()
           ),
        ],
      ),
    );
  }
}
