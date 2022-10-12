import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Model/news_model.dart';

String baseurl = "https://ktmwebscraper.herokuapp.com/";

getNews() async {
  var national = await http.get(Uri.parse(baseurl + "national"));
  var sports = await http.get(Uri.parse(baseurl + "sports"));
  var money = await http.get(Uri.parse(baseurl + "money"));
  var valley = await http.get(Uri.parse(baseurl + "valley"));
  var art = await http.get(Uri.parse(baseurl + "art-culture"));

  var nationaldata = jsonDecode(national.body);

  var sportsdata = jsonDecode(sports.body);

  var moneydata = jsonDecode(money.body);

  var valleydata = jsonDecode(valley.body);

  var artdata = jsonDecode(art.body);

  List<News> mynews = [];

  for (var news in nationaldata) {
    News nationalNews = News(
        title: news['title'],
        imageurl: news['image'],
        description: news['description'],
        author: news['author'],
        link: news['link']);

    mynews.add(nationalNews);
  }

  for (var news in sportsdata) {
    News sportsnews = News(
        title: news['title'],
        imageurl: news['image'],
        description: news['description'],
        author: news['author'],
        link: news['link']);

    mynews.add(sportsnews);
  }

  for (var news in moneydata) {
    News moneynews = News(
        title: news['title'],
        imageurl: news['image'],
        description: news['description'],
        author: news['author'],
        link: news['link']);

    mynews.add(moneynews);
  }

  for (var news in valleydata) {
    News valleynews = News(
        title: news['title'],
        imageurl: news['image'],
        description: news['description'],
        author: news['author'],
        link: news['link']);

    mynews.add(valleynews);
  }

  for (var news in artdata) {
    News artnews = News(
        title: news['title'],
        imageurl: news['image'],
        description: news['description'],
        author: news['author'],
        link: news['link']);

    mynews.add(artnews);
  }

  debugPrint(mynews[0].title.toString());
  return mynews;
}
