import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smartcart/App/app.dart';

import 'package:smartcart/Ui/Login/Login.dart';
import 'package:smartcart/Widgets/Nav.dart';
import 'package:smartcart/Widgets/Text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatefulWidget {
  Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer timer = Timer(Duration(seconds: 3), () {
      navWithReplaceAll(context, Login());
    });
    timer.isActive;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: h(812),
        width: w(375),
        child: Center(
          child: Stack(
            children: [
              Center(
                child: Container(
                  height: h(170),
                  width: w(370),
                  child: Center(
                    child: Image.asset(
                      "assets/images/logo.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 260,
                  child: Container(
                    width: w(370),
                    child: Center(
                      child: text(
                          text: "3AQAR",
                          color: Colors.blue[800],
                          fontsize: 26.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
