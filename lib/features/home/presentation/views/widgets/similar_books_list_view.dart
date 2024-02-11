
import 'package:flutter/material.dart';

import 'custom_book_item.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return  Padding(
          padding: const EdgeInsetsDirectional.only(top: 16,bottom: 42,end: 16),
          child: SizedBox(
              width: MediaQuery.of(context).size.width/4.5,
              child: const CustomBookItem()),
        );
      },
    );
  }
}
