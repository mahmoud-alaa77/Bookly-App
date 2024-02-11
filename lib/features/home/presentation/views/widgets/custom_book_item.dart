import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      child: AspectRatio(
        aspectRatio: 2.8/4,
        child: Container(
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/cover2.jpg"),
              )
          ),
        ),
      ),
    );
  }
}

