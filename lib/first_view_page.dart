import 'package:flutter/material.dart';
import 'package:mylistloginlogout/register_page.dart';
import 'package:mylistloginlogout/user_list.dart';
import 'package:mylistloginlogout/widgets/colors.dart';
import 'package:mylistloginlogout/widgets/widgets.dart';

import 'login_page.dart';


class FirstViewPage extends StatelessWidget {
  final DatabaseManagment _userManager;
  const FirstViewPage(this._userManager, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: appUi(context),
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
      height: MediaQuery.of(context).size.height * 0.38,
    );
  }

  Widget mainUi(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.52,
      child: Column(
        children: <Widget>[
          logoWidget("assets/images/logo.png"),
          const SizedBox(
            height: 50,
          ),
          GradientButton(context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              ),
            );
          }, 'ورود'),
          const SizedBox(
            height: 20,
          ),
          TextBTN(context, () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignupPage(_userManager);
                },
              ),
            );
          }, 'عضویت')
        ],
      ),
    );
  }

  Widget footerUi(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        child: TextButton(
            onPressed: () {},
            child: const Text(
              'به عنوان مهمان ادامه میدهم',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                decoration: TextDecoration.underline,
                decorationColor: Colors.white,
              ),
            )));
  }

  logoWidget(String imageName) {
    return Image.asset(
      imageName,
      fit: BoxFit.fitWidth,
      width: 120,
      height: 120,
      color: Colors.white,
    );
  }
}
