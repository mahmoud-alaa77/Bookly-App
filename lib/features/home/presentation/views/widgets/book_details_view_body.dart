import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/rating_widget.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_button.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
final BookModel book;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomBookDetailsAppBar(),
            Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: screenWidth * .15),
              child:  CustomBookItem(
image: book.imageUrl,
                bookModel: book,
                onTap: (){

                },
              ),
            ),
            const SizedBox(
              height: 43,
            ),
             Text(
             book.title,
              style: Styles.textStyle30,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
               textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 6,
            ),
            Opacity(
              opacity: .7,
              child: Text(
                book.author,
                style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
             CustomRatingWidget(
              mainAxisAlignment: MainAxisAlignment.center,
              aveRating:book.averageRating ?? 0,
                ratingsCount: book.ratingsCount ?? 0,
            ),
            const SizedBox(
              height: 36,
            ),
             CustomButton(
               previewLink: book.previewLink,
             ),
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
            const SimilarBookListView(),
          ],
        ),
      ),
    );
  }
}
