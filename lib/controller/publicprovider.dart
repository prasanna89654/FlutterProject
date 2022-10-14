import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../model/threemodel.dart';

class Publicprovider extends ChangeNotifier {
  List<Threemodel> publiccomplaint = [
    Threemodel(
        image: 'assets/images/care.png',
        subject: lorem(paragraphs: 1, words: 16),
        date: DateTime.now(),
        name: "Prasanna Poudel"),
    Threemodel(
      image: 'assets/images/contact.png',
      subject: lorem(paragraphs: 1, words: 16),
      name: "Suman Shrestha",
      date: DateTime.now(),
    ),
    Threemodel(
      image: 'assets/images/logo.png',
      subject: lorem(paragraphs: 1, words: 16),
      name: "Mahesh neupane",
      date: DateTime.now(),
    ),
  ];
}
