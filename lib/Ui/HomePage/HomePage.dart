import 'package:flutter/material.dart';

import 'package:smartcart/App/app.dart';
import 'package:smartcart/Ui/EstateDetails/EstateDetails.dart';
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
  List<String> sortOptions = [
    "Newest",
    "pricing hight to low",
    "pricing low to hight"
  ];
  int iscolored = 0;
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h(70)),
        child: AppBar(
          backgroundColor: Colors.blue[800],
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
                            text(
                                text: "   Search",
                                color: Colors.black,
                                fontsize: 16),
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
        // color: Colors.red,
        height: h(812),
        child: Column(
          children: [
            SizedBox(
              height: h(10),
            ),
            Row(
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
                ),
              ],
            ),
            container(
                hight: h(637),
                child: ListView.builder(
                  controller: controller,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        nav(context, EstateDetails());
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
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
                                    attributesdescription(),
                                  ],
                                ),
                              )),
                        ),
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
              child: Center(
                child: text(
                    text: "(negotiable)",
                    fontsize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              )),
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
          contentPadding: EdgeInsets.all(1),
          title: Center(child: const Text('Sort By')),
          content: Container(
              height: h(150),
              width: w(100),
              child: Center(
                child: ListView.builder(
                  // padding: EdgeInsets.all(20),
                  itemCount: sortOptions.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          iscolored = index;
                        });
                        Navigator.of(context).pop();
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              container(
                                hight: h(30),
                                borderRadius: 10,
                                child: Text(
                                  '${sortOptions[index]}',
                                  style: TextStyle(
                                      color: iscolored != index
                                          ? Colors.black87
                                          : Colors.orangeAccent,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          container(
                              hight: h(1),
                              width: w(280),
                              color: Colors.grey[300])
                        ],
                      ),
                    );
                  },
                ),
              )),
        );
      },
    );
  }
}
