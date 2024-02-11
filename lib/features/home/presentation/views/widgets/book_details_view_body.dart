import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/rating_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_button.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: screenWidth * .15),
            child: const CustomBookItem(),
          ),
          const SizedBox(
            height: 43,
          ),
          const Text(
            "Harry potter",
            style: Styles.textStyle30,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 6,
          ),
          Opacity(
            opacity: .7,
            child: Text(
              "J.K Rowlling",
              style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const CustomRatingWidget(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          const SizedBox(
            height: 36,
          ),
          const CustomButton(),
          const SizedBox(
            height: 48,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "you can also like",
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const Expanded(child: SimilarBookListView()),
        ],
      ),
    );
  }
}
