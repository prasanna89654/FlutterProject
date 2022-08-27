import 'package:flutter/material.dart';

import 'package:flutter_lorem/flutter_lorem.dart';

import '../model/threemodel.dart';

class Nearbyprovider extends ChangeNotifier {
  List<Threemodel> nearby = [
    Threemodel(
        image: 'assets/images/care.png',
        subject: lorem(paragraphs: 1, words: 16),
        date: DateTime.now(),
        title: "Polio Vaccine",
        venue: "bargachhi,biratnagar"),
    Threemodel(
        image: 'assets/images/contact.png',
        subject: lorem(paragraphs: 1, words: 16),
        title: "Aalu Vaccine",
        date: DateTime.now(),
        venue: "Sundar morang"),
    Threemodel(
        image: 'assets/images/logo.png',
        subject: lorem(paragraphs: 1, words: 16),
        name: "Aalu Vaccine",
        date: DateTime.now(),
        venue: "Sundar morang"),
  ];
}
