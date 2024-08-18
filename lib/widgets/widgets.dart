import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Container GradientButton(BuildContext context, Function onTap, final String text) {
  return Container(
    height: 50,
    width: MediaQuery.of(context).size.width*0.75,
    decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(55, 110, 155, 1),
          Color.fromRGBO(45, 90, 135, 1),
          Color.fromRGBO(35, 80, 145, 1),
          Color.fromRGBO(45, 55, 145, 1),
        ], begin: Alignment.centerLeft, end: Alignment.topRight),
        borderRadius: BorderRadius.all(Radius.circular(80.0))),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent),
      child: Text(text,
        style: TextStyle(color: Colors.white, fontSize: 19),
      ),
    ),
  );
}

Container TextBTN(BuildContext context, Function onTap, final String text){
  return   Container(
    height: 50,
    width: MediaQuery.of(context).size.width * 0.75,
    child: TextButton(
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(80)),
          side: BorderSide(
            color: Colors.white,
            width: 2,
          ),
        ),
      ),
      onPressed: () {
        onTap();
      },
      child:  Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 17),
      ),
    ),
  );
}

AlertDialog MyAlrtDialog (BuildContext context, final String toptext, final String maintext){
  return AlertDialog (
    backgroundColor: const Color.fromRGBO(255, 255, 255, 0.95),
    elevation: 1,

    title: Text(toptext, style: const TextStyle(
      fontSize: 24,
      color: Colors.redAccent
    ),textAlign: TextAlign.center,),
    content: Text(maintext,  style: const TextStyle(
        fontSize: 16,
        color: Colors.black45
    ),textAlign: TextAlign.center,),
    actions: <Widget>[
      Center(
        child: TextButton(
          child: const Text('تایید'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    ],
  );
}