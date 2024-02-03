

import 'package:flutter/material.dart';

import 'custom_book_item.dart';

class HorizontalBooksListView extends StatelessWidget {
  const HorizontalBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .23,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 8),
            child: CustomBookItem(),
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: 12,
      ),
    );
  }
}
