import 'package:flutter/material.dart';

class CustomAppbar extends AppBar {

  final Color? bgColor;
  final Color? fgColor;
  final String? titleText;
  CustomAppbar({
    this.bgColor,
    this.fgColor,
    this.titleText,
    super.key,
    super.actions,
    super.centerTitle,
    super.automaticallyImplyLeading,
  }) : super(
          backgroundColor: bgColor ?? Colors.green[200],
          title: Text(titleText??'',style: TextStyle(color: fgColor ?? Colors.green[900], fontWeight: FontWeight.bold, fontSize: 24 ),)
        );
}
