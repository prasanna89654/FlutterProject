import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/controller/riverpodmanager.dart';
import 'package:project/model/threemodel.dart';
import 'package:project/view/login.dart';
import 'package:project/widgets/listpmaker.dart';
import 'package:project/widgets/newscontainer.dart';

import '../controller/newsprovider.dart';
import '../view/fullnews.dart';
import 'listnearbymaker.dart';
import 'listnewsmaker.dart';

class Newsmaker extends ConsumerWidget {
  const Newsmaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var watch = ref.watch(newsriverpod);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        height: height * 0.62,
        // color: Colors.red,
        child: Column(children: [
          Text("Latest News",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          Container(
              height: height * 0.51,
              // color: Colors.green,
              child: Column(children: [
                FutureBuilder(
                    future: getNews(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return NewsContainer(
                          imageurl: snapshot.data[0].imageurl,
                          title: snapshot.data[0].title,
                          description: snapshot.data[0].description,
                          link: snapshot.data[0].link,
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    }),
                FutureBuilder(
                    future: getNews(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return NewsContainer(
                          imageurl: snapshot.data[1].imageurl,
                          title: snapshot.data[1].title,
                          description: snapshot.data[1].description,
                          link: snapshot.data[1].link,
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    })
              ])),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Fullnews(),
                      ));
                },
                child: Text("View More --->",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
