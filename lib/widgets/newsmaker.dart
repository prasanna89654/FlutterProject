// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/view/fullnews.dart';
import 'package:project/widgets/newscontainer.dart';

import '../controller/newsprovider.dart';
// import 'listnewsmaker.dart';

class Newsmaker extends ConsumerWidget {
  const Newsmaker({Key? key, this.changePage}) : super(key: key);
  final void Function(int)? changePage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var watch = ref.watch(newsriverpod);
    var size = MediaQuery.of(context).size;
    var height = size.height;

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 30),
      child: Container(
        height: height * 0.55,
        // color: Colors.red,
        child: Column(children: [
          const Text("Latest News",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          Container(
              height: height * 0.44,
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
                      return getShimmer();
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
                      return getShimmer();
                    })
              ])),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: InkWell(
                onTap: () => changePage!(2),
                child: const Text("View More --->",
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
