import 'package:flutter/cupertino.dart';

BoxDecoration PageColors (BuildContext context){
  return const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(105, 100, 195, 1.0),
            Color.fromRGBO(95, 92, 181, 1.0),
            Color.fromRGBO(84, 86, 149, 1.0),
            Color.fromRGBO(51, 70, 129, 1.0),
            Color.fromRGBO(42, 53, 124, 1.0),
            Color.fromRGBO(40, 51, 119, 1.0),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
  );
}