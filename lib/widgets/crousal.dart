// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Crousal extends StatefulWidget {
  const Crousal({super.key});

  @override
  State<StatefulWidget> createState() => _CrousalState();
}

class _CrousalState extends State<Crousal> {
  int _current = 0;
  // final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'assets/images/firstimg.png',
      'assets/images/secondimg.png',
      'assets/images/thirdimg.png',
      'assets/images/fourthimg.png',
      'assets/images/fifth.png',
    ];

    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              margin: const EdgeInsets.all(2.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                  )),
            ))
        .toList();

    var size = MediaQuery.of(context).size;
    var height = size.height;
    return Column(children: [
      CarouselSlider(
        options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            height: height * 0.28,
            aspectRatio: 2.40,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enableInfiniteScroll: false,
            initialPage: 2,
            autoPlay: true,
            viewportFraction: 0.85),
        items: imageSliders,
      ),
    ]);
  }
}
