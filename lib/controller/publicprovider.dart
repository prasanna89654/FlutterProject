import 'package:flutter/material.dart';
import 'package:project/widgets/publicmaker.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

import '../model/threemodel.dart';

class Publicprovider extends ChangeNotifier {
  List<Threemodel> publiccomplaint = [
    Threemodel(
        image: 'assets/images/care.png',
        title: lorem(paragraphs: 1, words: 16)),
    Threemodel(
        image: 'assets/images/care.png',
        title: lorem(paragraphs: 1, words: 16)),
    Threemodel(
        image: 'assets/images/care.png',
        title: lorem(paragraphs: 1, words: 16)),
  ];
}
