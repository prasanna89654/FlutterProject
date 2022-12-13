import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../model/data_model.dart';

String baseurl = "https://api.publicapis.org/entries";

getData() async {
  var datas = await http.get(Uri.parse(baseurl));
  // var newData = jsonDecode(datas.body);
  Map<String, dynamic> newData = jsonDecode(datas.body);
  List<Data> datalist = [];

  for (var dt in newData['entries']) {
    Data nationalNews = Data(
      apiname: dt['API'],
      description: dt['Description'],
      category: dt['Category'],
    );

    datalist.add(nationalNews);
  }
  debugPrint(datalist[0].apiname.toString());
  return datalist;
}
