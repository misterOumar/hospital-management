import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key, required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(
          color: secondaryColor, borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: null //context.read<MenuController>().controlMenu,
            ),
          if (!Responsive.isMobile(context))
            Expanded(
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: SearchField(controller: widget.controller,)),
            ),
          Spacer(),
          ProfileCard()
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: defaultPadding),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset(
              "assets/icons/bell.svg",
              color: primaryColor,
              height: !Responsive.isMobile(context) ? 22 : 18,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset(
              "assets/icons/msg.svg",
              color: primaryColor,
              height: !Responsive.isMobile(context) ? 22 : 18,
            ),
          ),
          Image.asset(
            "assets/images/client_img.png",
            height: !Responsive.isMobile(context) ? 44 : 40,
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatefulWidget {
  const SearchField({
    Key? key, required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(25.0)),
      child: Center(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Icon(Icons.search, color: hintColor),
            ),
            Expanded(
              child: TextField(
                controller: widget.controller,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration.collapsed(
                  hintText: "Search here...",
                  hintStyle: TextStyle(color: hintColor),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
