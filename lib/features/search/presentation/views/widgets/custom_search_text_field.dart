
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
          hintText: "Search",
          suffixIcon:  Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 20,color: Colors.white.withOpacity(.7),
          ),
          enabledBorder: buildOutlineInputBorder( color: Colors.grey),
          focusedBorder: buildOutlineInputBorder(color: Colors.white)
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({required Color color}) {
    return  OutlineInputBorder(
      borderRadius:const BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: color),
    );
  }
}
