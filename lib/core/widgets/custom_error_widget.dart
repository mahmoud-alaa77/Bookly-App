

import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});
final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline_sharp),
          const SizedBox(
            height: 6,
          ),
          Text(errorMessage ,style: Styles.textStyle18.copyWith(
            fontWeight: FontWeight.bold
          ),textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
