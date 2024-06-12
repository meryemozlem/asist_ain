import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class SearchBar extends StatelessWidget {
  String description;
  SearchBar(this.description);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
        color: Color(0x80FE7C7C),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: description,
          icon: Icon(LineAwesomeIcons.search_solid),
          border: InputBorder.none,
        ),
      ),
    );
  }
}