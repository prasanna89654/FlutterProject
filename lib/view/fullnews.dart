import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
// import '../ApiHelper/news_api.dart';
// import '../widgets/news_container.dart';

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
        body: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8, top: 10, bottom: 8),
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
                ))));
  }
}
