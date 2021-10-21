import 'package:flutter/material.dart';
import 'package:smartcart/App/app.dart';
import 'package:smartcart/Widgets/Container.dart';
import 'package:smartcart/Widgets/Text.dart';
import 'package:smartcart/Widgets/carousel_pro.dart';

class EstateDetails extends StatefulWidget {
  EstateDetails({Key key}) : super(key: key);

  @override
  _EstateDetailsState createState() => _EstateDetailsState();
}

class _EstateDetailsState extends State<EstateDetails> {
  ScrollController scrollController = ScrollController();
  List<Amenities> amenities = [
    Amenities("Mosque", "assets/images/mosque.jpeg"),
    Amenities("Market", "assets/images/market.jpeg"),
    Amenities("Park", "assets/images/park.png"),
    Amenities("Restaurant", "assets/images/restaurant.png"),
    Amenities("School", "assets/images/school.jpeg")
  ];
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollToBottom());
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: 50,
        ),
        child: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: const Icon(
            Icons.call,
          ),
          backgroundColor: Colors.blue[800],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.blue[800],
          actions: [
            container(
              color: Colors.transparent,
              width: w(300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  text(
                      text: "Estate Details",
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
        child: Column(
          children: [
            estateImages(),
            SizedBox(
              height: h(10),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  attributesdescription(),
                  SizedBox(
                    height: h(20),
                  ),
                  attributesIcons(),
                  SizedBox(
                    height: h(10),
                  ),
                  attributesvalues(),
                  SizedBox(
                    height: h(20),
                  ),
                  amenitiesWidget()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget estateImages() {
    return Container(
      height: h(250),
      child: Hero(
        tag: "hero-Item-",
        child: Carousel(
          dotColor: Colors.blue[700],
          dotIncreaseSize: 1.7,
          dotBgColor: Colors.transparent,
          autoplay: true,
          boxFit: BoxFit.cover,
          images: [
            Image.network(
              "https://www.irishtimes.com/polopoly_fs/1.4236105.1587648708!/image/image.jpg_gen/derivatives/box_620_330/image.jpg",
              fit: BoxFit.cover,
            ),
            Image.network(
                "https://thumbs.dreamstime.com/z/apartment-building-architectural-details-modern-40758853.jpg",
                fit: BoxFit.cover),
          ],
        ),
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

  Widget attributesIcons() {
    return Container(
      color: Colors.grey[50],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
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
              width: w(55),
              child: Center(
                child: text(
                    text: "house",
                    fontsize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              )),
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

  Widget amenitiesWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(
          text: " Amenities",
          fontsize: 18,
        ),
        SizedBox(
          height: h(20),
        ),
        container(
            color: Colors.grey[50],
            hight: h(70),
            child: Center(
              child: ListView.builder(
                controller: scrollController,
                itemCount: amenities.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          container(
                            color: Colors.transparent,
                            borderRadius: 6,
                            hight: h(30),
                            width: w(40),
                            child: Center(
                              child: Image.asset(
                                amenities[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          container(
                              color: Colors.transparent,
                              hight: h(30),
                              width: w(70),
                              child: text(text: amenities[index].amen))
                        ],
                      ),
                    ),
                  );
                },
              ),
            )),
        SizedBox(
          height: h(20),
        ),
        specifications()
      ],
    );
  }

  scrollToBottom() {
    scrollController.jumpTo(scrollController.position.physics.minFlingDistance);
  }

  Widget specifications() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(text: " Specifications", fontsize: 20),
        SizedBox(
          height: h(20),
        ),
        text(text: " Living room"),
        SizedBox(
          height: h(7),
        ),
        text(text: " 1", color: Colors.grey),
        SizedBox(
          height: h(7),
        ),
        text(text: " Floor"),
        SizedBox(
          height: h(7),
        ),
        text(text: " 2", color: Colors.grey),
        SizedBox(
          height: h(7),
        ),
        text(text: " Real Estate Situation"),
        SizedBox(
          height: h(7),
        ),
        text(text: " Tabu", color: Colors.grey),
        SizedBox(
          height: h(7),
        ),
        text(text: " About the Property", fontsize: 18),
        SizedBox(
          height: h(7),
        ),
        Container(
          height: h(150),
          constraints: BoxConstraints(
              maxHeight: h(200), minHeight: h(50), minWidth: w(400)),
          child: text(
              text:
                  "this house is located in the algamhouria St has 2 side and 1 living room and balaconey ",
              color: Colors.grey),
        ),
      ],
    );
  }
}

class Amenities {
  String amen;
  String image;

  Amenities(this.amen, this.image);
}
