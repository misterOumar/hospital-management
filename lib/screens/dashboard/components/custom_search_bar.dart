import 'package:flutter/material.dart';

Widget customDefaultSearchBar(Widget header) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        flexibleSpace: header,
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
      ),
    );
  }

Widget customPatientSearchBar(Widget header) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        flexibleSpace: header,
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
        ),
      ),
    );
  }