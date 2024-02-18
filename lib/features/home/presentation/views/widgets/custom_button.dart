import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.previewLink});
final String previewLink;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 6),
      child: Row(
        children: [
          SizedBox(
            width: screenWidth / 2.5,
            height: 48,
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(16),
                            bottomStart: Radius.circular(16)))),
                child: Text(
                  "Free",
                  style: Styles.textStyle18.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            width: screenWidth / 2.5,
            height: 48,
            child: TextButton(
                onPressed: () async{
                  Uri url =Uri.parse(previewLink);
                  if (!await launchUrl(url)) {
                  throw Exception('Could not launch $url');
                  }
                },
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffEF8262),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.only(
                            topEnd: Radius.circular(16),
                            bottomEnd: Radius.circular(16)))),
                child: Text(
                  "Free preview",
                  style: Styles.textStyle18.copyWith(color: Colors.white),
                )),
          ),
        ],
      ),
    );
  }
}
