import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'new_books_list_view.dart';
import 'custom_app_bar.dart';
import 'horizontal_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 30,vertical: 16),
                  child: CustomAppBar(),
                ),
                HorizontalBooksListView(),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Most Popular",
                    style: Styles.textStyle18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 30),
              child: NewestListView(),
            ),
          ),
        ],






    );
  }
}

