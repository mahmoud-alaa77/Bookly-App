

import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/new_books_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return  const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text("data"),

        );
      },
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
    );
  }
}