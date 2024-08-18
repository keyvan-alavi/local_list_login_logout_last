import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFormFields extends StatelessWidget {
  final IconData suffixIcon;
  final String hintText;
  final bool passwordcheck;
  final controller;

  const TextFormFields(
      {super.key,
      required this.suffixIcon,
      required this.hintText,
      required this.controller,
      this.passwordcheck = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width*0.85,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.5),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
        textAlign: TextAlign.end,
        obscureText: passwordcheck,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: Icon(
              suffixIcon,
              color: Colors.indigoAccent,
            ),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white70, fontSize: 19),
        ),
      ),
    );
  }
}
