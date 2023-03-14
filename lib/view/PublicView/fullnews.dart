import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../Riverpod/Repository/NewsRepository.dart';
import '../../widgets/newscontainer.dart';
// import '../ApiHelper/news_api.dart';
// import '../widgets/news_container.dart';

class Fullnews extends ConsumerStatefulWidget {
  const Fullnews({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<Fullnews> createState() => _FullnewsState();
}

class _FullnewsState extends ConsumerState<Fullnews> {
  @override
  Widget build(BuildContext context) {
    final details = ref.watch(newsprovider);
    return Scaffold(
        body: details.when(
            data: (data) {
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return NewsContainer(
                      title: data[index].title,
                      description: data[index].desc,
                      link: data[index].titleLink,
                      imageurl: data[index].image,
                      date: data[index].date,
                    );
                  });
            },
            loading: () => ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => Shimmer.fromColors(
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
                          ))),
                ),
            error: (error, stack) => Center(
                  child: Text(error.toString()),
                )));
  }
}
