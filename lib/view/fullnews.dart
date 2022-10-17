import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
// import '../ApiHelper/news_api.dart';
// import '../widgets/news_container.dart';
import '../controller/newsprovider.dart';
import '../widgets/newscontainer.dart';

class Fullnews extends StatefulWidget {
  const Fullnews({
    Key? key,
  }) : super(key: key);

  @override
  State<Fullnews> createState() => _FullnewsState();
}

class _FullnewsState extends State<Fullnews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getNews(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data;
                    return NewsContainer(
                      imageurl: data[index].imageurl,
                      title: data[index].title,
                      description: data[index].description,
                      author: data[index].author,
                      link: data[index].link,
                    );
                  });
            }

            return ListView.builder(
              itemBuilder: (context, index) {
                return getShimmer();
              },
              itemCount: 10,
            );
          }),
    );
  }
}

Shimmer getShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 10, bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            width: 130,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 30,
                color: Colors.white,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 140,
                color: Colors.white,
              ),
              Container()
            ],
          ))
        ],
      ),
    ),
  );
}
