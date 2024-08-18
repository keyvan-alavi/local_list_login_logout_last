import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mylistloginlogout/user_list.dart';

class HomePage extends StatelessWidget {
  final UserList user;

  HomePage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text('صفحه ورود'),
      ),
      body: Center(

        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
        const Text(
          'Welcome',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Hello, ${user.username}! \n Your ID is ${user.id}.',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
                ],
              ),
      ),
    );
  }
}
