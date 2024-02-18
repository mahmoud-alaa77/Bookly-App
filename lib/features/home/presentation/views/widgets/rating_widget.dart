import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class CustomRatingWidget extends StatelessWidget {
  const CustomRatingWidget({super.key,  this.mainAxisAlignment= MainAxisAlignment.start, required this.ratingsCount, required this.aveRating});
final MainAxisAlignment mainAxisAlignment ;
final int ratingsCount;
final int aveRating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:mainAxisAlignment ,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.yellow,
        ),
        const SizedBox(
          width: 8,
        ),
         Text(
          aveRating.toString(),
          style: Styles.textStyle18,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          "($ratingsCount)",
          style: Styles.textStyle14.copyWith(color: Colors.grey),
        )
      ],
    );
  }
}