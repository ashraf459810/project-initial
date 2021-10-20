import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smartcart/App/app.dart';
import 'package:smartcart/Ui/HomePage/HomePage.dart';
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
      navWithReplaceAll(context, HomePage());
    });
    timer.isActive;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: h(800),
        width: w(380),
        child: Stack(
          children: [
            Center(
              child: Container(
                height: h(170),
                width: w(370),
                child: Center(
                  child: Image.asset(
                    "assets/images/baytona.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 260,
                left: 150,
                child: Opacity(
                  opacity: 0.9,
                  child: Container(
                    child: text(
                        text: "Baytona",
                        color: Colors.orange,
                        fontsize: 26.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
