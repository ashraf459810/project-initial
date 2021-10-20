import 'package:flutter/material.dart';
import 'package:smartcart/App/app.dart';
import 'package:smartcart/Widgets/Container.dart';
import 'package:smartcart/Widgets/Dropdown.dart';
import 'package:smartcart/Widgets/Text.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Bedrooms> bedrooms = [
    Bedrooms(Colors.white, 1),
    Bedrooms(Colors.white, 2),
    Bedrooms(Colors.white, 3),
    Bedrooms(Colors.white, 4),
    Bedrooms(Colors.white, 5),
    Bedrooms(Colors.white, 6),
  ];
  String furnishe;
  bool isbuy = true;
  bool isoffice = false;
  String city;
  String probertyType;
  String hood;
  RangeValues currentRangeValuesforbuy = const RangeValues(100, 500);
  RangeValues currentRangeValuesforrent = RangeValues(100, 500);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.orangeAccent[400],
          actions: [
            container(
              color: Colors.transparent,
              width: w(300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  text(
                      text: "Select Filters",
                      color: Colors.white,
                      fontsize: 22,
                      fontWeight: FontWeight.bold),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: h(20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      isbuy = true;
                      setState(() {});
                    },
                    child: container(
                        hight: h(50),
                        width: w(70),
                        color: Colors.white,
                        bordercolor: isbuy ? Colors.orange : Colors.transparent,
                        borderRadius: 6,
                        child: text(text: "Buy")),
                  ),
                  GestureDetector(
                    onTap: () {
                      isbuy = false;
                      setState(() {});
                    },
                    child: container(
                        hight: h(50),
                        width: w(70),
                        color: Colors.white,
                        bordercolor:
                            !isbuy ? Colors.orange : Colors.transparent,
                        borderRadius: 6,
                        child: text(text: "Rent")),
                  )
                ],
              ),
              SizedBox(
                height: h(50),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    text: "  City",
                    fontsize: 18,
                  ),
                  DropDown(
                    list: ["Lattakia", "Tartus"],
                    hint: "select city",
                    onchanged: (val) {
                      city = val;
                    },
                    getindex: (val) {},
                  ),
                ],
              ),
              SizedBox(
                height: h(50),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    text: "  Neighbourhood",
                    fontsize: 18,
                  ),
                  DropDown(
                    list: [
                      "Algamgouria street",
                      "al zera3a",
                      "almashro3 alsabe3"
                    ],
                    hint: "select hood",
                    onchanged: (val) {
                      hood = val;
                    },
                    getindex: (val) {},
                  ),
                ],
              ),
              SizedBox(
                height: h(50),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    text: "  proberty type",
                    fontsize: 18,
                  ),
                  DropDown(
                    list: ["office", "house", "shop"],
                    hint: "select proberty type",
                    onchanged: (val) {
                      val == "office" ? isoffice = true : isoffice = false;
                      probertyType = val;
                      setState(() {});
                    },
                    getindex: (val) {},
                  ),
                ],
              ),
              SizedBox(
                height: h(50),
              ),
              !isoffice
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        text(
                          text: "  Bedrooms",
                          fontsize: 18,
                        ),
                        SizedBox(
                          height: h(20),
                        ),
                        container(
                            color: Colors.grey[50],
                            hight: h(50),
                            child: ListView.builder(
                              itemCount: bedrooms.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: GestureDetector(
                                    onTap: () {
                                      if (bedrooms[index].color ==
                                          Colors.transparent)
                                        bedrooms[index].color = Colors.orange;
                                      else
                                        bedrooms[index].color =
                                            Colors.transparent;
                                      setState(() {});
                                    },
                                    child: container(
                                        color: Colors.white,
                                        borderRadius: 6,
                                        hight: h(50),
                                        width: w(70),
                                        bordercolor: bedrooms[index].color,
                                        child: Center(
                                            child: text(
                                                text:
                                                    "${bedrooms[index].number}"))),
                                  ),
                                );
                              },
                            ))
                      ],
                    )
                  : Container(),
              SizedBox(
                height: h(40),
              ),
              Row(
                children: [
                  text(
                    text: isbuy
                        ? "  price range in million SP"
                        : "  price range in thousand SP",
                    fontsize: 18,
                  ),
                ],
              ),
              Container(
                height: h(60),
                child: RangeSlider(
                  activeColor: Colors.orange,
                  values: isbuy
                      ? currentRangeValuesforbuy
                      : currentRangeValuesforrent,
                  min: 100,
                  max: 500,
                  divisions: isbuy ? 140 : 140,
                  labels: isbuy
                      ? RangeLabels(
                          currentRangeValuesforbuy.start.round().toString(),
                          currentRangeValuesforbuy.end.round().toString(),
                        )
                      : RangeLabels(
                          currentRangeValuesforrent.start.round().toString(),
                          currentRangeValuesforrent.end.round().toString()),
                  onChanged: (RangeValues values) {
                    setState(() {
                      isbuy == true
                          ? currentRangeValuesforbuy = values
                          : currentRangeValuesforrent = values;
                    });
                  },
                ),
              ),
              SizedBox(
                height: h(40),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    text: "  Furnishe",
                    fontsize: 18,
                  ),
                  DropDown(
                    list: [
                      "totaly Furnished",
                      "partly Furnishe ",
                      "not Furnished   "
                    ],
                    hint: "select Furnishe type",
                    onchanged: (val) {
                      val == "office" ? isoffice = true : isoffice = false;
                      furnishe = val;
                      setState(() {});
                    },
                    getindex: (val) {},
                  ),
                ],
              ),
              SizedBox(
                height: h(40),
              ),
              container(
                  color: Colors.orangeAccent[400],
                  borderRadius: 10,
                  hight: h(60),
                  width: w(400),
                  child: Center(
                      child: text(
                          text: "Search", color: Colors.white, fontsize: 25)))
            ],
          ),
        ),
      ),
    );
  }
}

class Bedrooms {
  Color color;
  int number;

  Bedrooms(this.color, this.number);
}
