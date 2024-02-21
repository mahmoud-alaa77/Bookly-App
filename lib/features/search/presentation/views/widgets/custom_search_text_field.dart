
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/models/book_model.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({super.key, this.onChanged,});
final void Function(String)? onChanged;
  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
final mySearchController =TextEditingController();
String searchedText='';

  @override
  Widget build(BuildContext context) {
    return  TextField(
      controller: mySearchController,
      decoration: InputDecoration(
          hintText: "Search",
          suffixIcon:  Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 20,color: Colors.white.withOpacity(.7),
          ),
          enabledBorder: buildOutlineInputBorder( color: Colors.grey),
          focusedBorder: buildOutlineInputBorder(color: Colors.white)
      ),
      onChanged:widget.onChanged
    );
  }

  OutlineInputBorder buildOutlineInputBorder({required Color color}) {
    return  OutlineInputBorder(
      borderRadius:const BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(color: color),
    );
  }


}
