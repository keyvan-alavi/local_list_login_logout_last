import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mylistloginlogout/user_list.dart';
import 'package:mylistloginlogout/widgets/colors.dart';
import 'package:mylistloginlogout/widgets/textfields.dart';
import 'package:mylistloginlogout/widgets/widgets.dart';
import 'login_page.dart';

class SignupPage extends StatelessWidget {
  final DatabaseManagment _userManager;
  SignupPage(this._userManager, {super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();


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
      height: MediaQuery.of(context).size.height * 0.28,
    );
  }

  Widget mainUi(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.56,
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
            'در صورتی که هنوز عضو نشدید، ثبت نام کنید',
            style: TextStyle(color: Colors.white70, fontSize: 18),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 8),
            child: TextFormFields(
              suffixIcon: Icons.person,
              hintText: 'نام کاربری (اجباری)',
              controller: _usernameController,
            ),
          ),
          /*Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: TextFormFields(
              suffixIcon: Icons.mail,
              hintText: 'ایمیل',
              controller: emailController,
            ),
          ),*/
          TextFormFields(
            suffixIcon: Icons.lock,
            hintText: 'رمز عبور(اجباری)',
            controller: _passwordController,
            passwordcheck: true,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 10),
            child: TextFormFields(
              suffixIcon: Icons.lock,
              hintText: 'تکرار رمز عبور(اجباری)',
              controller: _repasswordController,
              passwordcheck: true,
            ),
          ),
          const Text(
            "با عضویت در این برنامه قوانین ما\n"
            "را پذیرفته اید",
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget footerUi(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.14,
        child: Column(
          children: [
            GradientButton(context, () {
              final username = _usernameController.text;
              final password = _passwordController.text;
              _userManager.addUser(username, password);
              Navigator.pop(context);
            }, "عضویت"),
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
                            return LoginPage();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "وارد شوید",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                const Text(
                  'در صورتی که قبلا عضو شدید',
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
