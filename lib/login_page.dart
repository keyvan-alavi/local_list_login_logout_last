import 'package:flutter/material.dart';
import 'package:mylistloginlogout/register_page.dart';
import 'package:mylistloginlogout/user_list.dart';
import 'package:mylistloginlogout/widgets/colors.dart';
import 'package:mylistloginlogout/widgets/textfields.dart';
import 'package:mylistloginlogout/widgets/widgets.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final DatabaseManagment _userManager = DatabaseManagment();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'nika'),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: appUi(context),
      ),
    );
  }

  Widget appUi(BuildContext context) {
    return Container(
      decoration: PageColors(context),
      child: Column(
        children: [
          headerUi(context),
          mainUi(context),
          footerUi(context),
        ],
      ),
    );
  }

  Widget headerUi(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.32,
    );
  }

  Widget mainUi(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.53,
      child: Column(
        children: [
          const Text(
            "خوش آمدید",
            style: TextStyle(
                color: Colors.white,
                fontSize: 45,
                fontFamily: 'samim',
                fontWeight: FontWeight.bold),
          ),
          const Text(
            'به اکانت خود وارد شوید',
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormFields(
            suffixIcon: Icons.person,
            hintText: 'نام کاربری',
            controller: _usernameController,
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormFields(
            suffixIcon: Icons.lock,
            hintText: 'رمز عبور',
            passwordcheck: true,
            controller: _passwordController,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 20, 0),
            child: Row(
              children: [
                const Text(
                  "فراموشی رمز عبور",
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                const Text(
                  "ذخیره مشخصات",
                  style: TextStyle(color: Colors.white),
                ),
                Checkbox(value: true, onChanged: (value) {}),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget footerUi(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        child: Column(
          children: [
            GradientButton(context, () {
              final username = _usernameController.text;
              final password = _passwordController.text;
              final user = _userManager.userAuth(username, password);
              if (user != null || username.isNotEmpty || password.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage(user!)),
                );
              } else if (user == null || username.isEmpty || password.isEmpty)  {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Invalid username or password')),
                );
              }
            }, "ورود"),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignupPage(_userManager);
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "عضو شوید",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const Text(
                  'هنوز عضو نشدید؟',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.end,
                ),
              ],
            )
          ],
        ));
  }
}
