import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'horizontal_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding:
            EdgeInsetsDirectional.only(bottom: 8, top: 30, start: 16, end: 16),
        child: Column(
          children: [
            CustomAppBar(),
            HorizontalBooksListView(),
          ],
        ),
      ),
    );
  }
}
