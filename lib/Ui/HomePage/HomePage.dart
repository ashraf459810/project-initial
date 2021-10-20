import 'package:flutter/material.dart';

import 'package:smartcart/App/app.dart';
import 'package:smartcart/Ui/Search.dart';
import 'package:smartcart/Widgets/Container.dart';
import 'package:smartcart/Widgets/Dropdown.dart';
import 'package:smartcart/Widgets/Nav.dart';
import 'package:smartcart/Widgets/Text.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.orangeAccent[400],
          automaticallyImplyLeading: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      nav(context, Search());
                    },
                    child: container(
                        hight: h(40),
                        width: w(300),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text(text: "   Search", color: Colors.black),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        )),
                  ),
                  SizedBox(
                    width: w(7),
                  ),
                  GestureDetector(
                    onTap: () {
                      sortDialog();
                    },
                    child: Image.asset(
                      "assets/images/updownarrows.png",
                      height: h(30),
                      width: w(30),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: h(10),
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  container(
                    hight: h(30),
                    width: w(100),
                    child: DropDown(
                      list: ["Buy", "Rent"],
                      onchanged: (va) {},
                      getindex: (val) {},
                      hint: "Buy",
                    ),
                  )
                ],
              ),
            ),
            container(
                hight: h(600),
                child: ListView.builder(
                  controller: controller,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Card(
                        child: container(
                            hight: h(350),
                            child: Center(
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/images/house.jpeg",
                                    height: h(200),
                                    width: w(400),
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    height: h(7),
                                  ),
                                  attributesIcons(),
                                  SizedBox(
                                    height: h(3),
                                  ),
                                  attributesvalues(),
                                  SizedBox(
                                    height: h(10),
                                  ),
                                  attributesdescription()
                                ],
                              ),
                            )),
                      ),
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }

  Widget attributesIcons() {
    return Container(
      color: Colors.grey[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: w(50),
              child: text(
                  text: "1.4 M",
                  fontsize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold)),
          Icon(
            Icons.house,
            color: Colors.grey,
            size: 35,
          ),
          Image.asset(
            "assets/images/size.png",
            height: h(35),
            width: w(35),
            color: Colors.grey,
          ),
          Image.asset(
            "assets/images/bed.png",
            height: h(35),
            width: w(35),
            color: Colors.grey,
          ),
          Image.asset(
            "assets/images/bath.png",
            height: h(35),
            width: w(35),
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget attributesvalues() {
    return Container(
      color: Colors.grey[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: w(70),
              child: text(
                  text: "(negotiable)",
                  fontsize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold)),
          Container(
              width: w(50),
              child: text(
                  text: "house",
                  fontsize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold)),
          Container(
              width: w(50),
              child: text(
                  text: "100m2",
                  fontsize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold)),
          Container(
              width: w(50),
              child: text(
                  text: "3 bed",
                  fontsize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold)),
          Container(
              width: w(50),
              child: text(
                  text: "3 bath",
                  fontsize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget attributesdescription() {
    return Column(
      children: [
        Row(
          children: [
            Flexible(
                child: text(
                    text: "furnished house |sale| 100m2 | altadamon",
                    fontsize: 20)),
          ],
        ),
        SizedBox(
          height: h(20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.pin_drop),
                text(text: "al zera3a"),
              ],
            ),
            text(text: "posted on 6-10-2021 ")
          ],
        )
      ],
    );
  }

  Future<void> sortDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: const Text('select Sort By')),
          content: SingleChildScrollView(
            child: Container(
              height: h(150),
              width: w(200),
              child: ListView(
                padding: EdgeInsets.all(10),
                children: <Widget>[
                  container(
                    hight: h(30),
                    borderRadius: 10,
                    color: Colors.grey,
                    child: Text(
                      'Price hight to low',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  SizedBox(height: h(7)),
                  container(
                    hight: h(30),
                    borderRadius: 10,
                    color: Colors.grey,
                    child: Text('Price low to hight',
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  SizedBox(height: h(7)),
                  container(
                    hight: h(30),
                    borderRadius: 10,
                    color: Colors.grey,
                    child: Text("newest listing",
                        style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                  SizedBox(height: h(7)),
                ],
              ),
            ),
          ),
          // actions: <Widget>[
          //   TextButton(
          //     child: const Text('Approve'),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );
  }
}
