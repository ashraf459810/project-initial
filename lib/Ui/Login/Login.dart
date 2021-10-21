import 'package:flutter/material.dart';
import 'package:smartcart/App/app.dart';
import 'package:smartcart/Ui/HomePage/HomePage.dart';
import 'package:smartcart/Ui/Register/Register.dart';
import 'package:smartcart/Widgets/Container.dart';
import 'package:smartcart/Widgets/Nav.dart';
import 'package:smartcart/Widgets/Text.dart';
import 'package:smartcart/Widgets/TextForm.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController mobilec = TextEditingController();
  TextEditingController namec = TextEditingController();
  TextEditingController passwordc = TextEditingController();
  String mobile;
  String name;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h(120),
                ),
                Container(
                    height: h(200),
                    width: w(150),
                    child: Center(
                      child: Image.asset(
                        "assets/images/logo.jpeg",
                        fit: BoxFit.cover,
                      ),
                    )),
                text(
                    text: "3AQAR",
                    color: Colors.blue[800],
                    fontsize: 25,
                    fontWeight: FontWeight.bold),
                SizedBox(
                  height: h(50),
                ),
                logintap(mobilec, "099926413", mobile, "Enter your Number",
                    "number"),
                SizedBox(
                  height: h(20),
                ),
                logintap(passwordc, "*****", password, "   Enter your Password",
                    "password"),
                SizedBox(
                  height: h(50),
                ),
                InkWell(
                  onTap: () {
                    nav(context, HomePage());
                  },
                  child: container(
                      hight: h(50),
                      width: w(200),
                      borderRadius: 20,
                      child: text(
                          text: "Login", fontsize: 18, color: Colors.white),
                      color: Colors.blue[800]),
                ),
                SizedBox(
                  height: h(50),
                ),
                InkWell(
                  onTap: () {
                    nav(context, Register());
                  },
                  child: Text("don't have account register here",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.grey[700],
                          fontSize: 16)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logintap(TextEditingController controller, String hint, String value,
      String title, String validation) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 190.0),
          child: text(text: title, color: Colors.grey[700]),
        ),
        SizedBox(
          height: h(5),
        ),
        container(
          width: w(300),
          borderRadius: 20,
          color: Colors.blue[400],
          child: textform(
              controller: controller,
              hint: hint,
              hintsize: 18,
              hintColor: Colors.white,
              validation: validation,
              function: (val) {
                value = val;
              }),
        ),
      ],
    );
  }
}
