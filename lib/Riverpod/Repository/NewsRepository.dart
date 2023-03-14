// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:project/Riverpod/Models/NewsModel.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NewsRepository {
  Future<List<NewsModel>> getallnews() async {
    // final response = await Api().get(MyConfig.newsUrl);

    // if (response.statusCode == 200) {
    //   Map<String, dynamic> map = json.decode(response.data);
    //   List<dynamic> data = map["data"];

    //   return data.map((data) => NewsModel.fromJson(data)).toList();
    // } else {
    //   List<NewsModel> a = [];
    //   return a;
    // }

    String data = await rootBundle.loadString('assets/newsjson.json');
    final result = json.decode(data);
    List<NewsModel> items = [];

    for (var item in result) {
      items.add(NewsModel.fromJson(item));
    }

    return items;
  }
}

final newsapiProvider = Provider<NewsRepository>((ref) => NewsRepository());
final newsprovider = FutureProvider.autoDispose<List<NewsModel>>((ref) async {
  return ref.read(newsapiProvider).getallnews();
});
