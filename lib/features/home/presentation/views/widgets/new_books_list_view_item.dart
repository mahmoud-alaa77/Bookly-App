import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/rating_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/styles.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key,  required this.bookModel});
final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
       GoRouter.of(context).push(AppRouter.kBookDetailsView , extra: bookModel);

      },
      child: SizedBox(
          height: MediaQuery.of(context).size.height / 6.2,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 2.7 / 4,
                child: ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: bookModel.imageUrl,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => const Icon(Icons.error_outline),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .5,
                      child:  Text(
                        bookModel.title,
                        style: Styles.textStyle20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                     Text(
                      bookModel.author,
                      style: Styles.textStyle14,
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Free",
                          style: Styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold),
                        ),

                         CustomRatingWidget(
                           aveRating: bookModel.averageRating ?? 0,
                           ratingsCount: bookModel.ratingsCount ?? 0
                         ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}


