import 'package:flutter/material.dart';
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

            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
