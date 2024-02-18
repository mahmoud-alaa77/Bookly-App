import 'package:bookly_app/features/home/data/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.image, required this.bookModel, this.onTap});
final String image;
final BookModel bookModel;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(16),
          child: AspectRatio(
            aspectRatio: 2.8/4,
            child:CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.fill,
              errorWidget: (context, url, error) => const Icon(Icons.error_outline),
            )
          ),
        ),
      ),
    );
  }
}

