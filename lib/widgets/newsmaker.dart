// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/Riverpod/Repository/NewsRepository.dart';
import 'package:project/widgets/newscontainer.dart';
import 'package:shimmer/shimmer.dart';

// import 'listnewsmaker.dart';

class Newsmaker extends ConsumerWidget {
  const Newsmaker({Key? key, this.changePage}) : super(key: key);
  final void Function(int)? changePage;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    var details = ref.watch(newsprovider);

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
      child: Container(
        height: height * 0.5,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const Text("  Latest News",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
              const Spacer(),
              InkWell(
                onTap: () => changePage!(2),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade300,
                      borderRadius: BorderRadius.circular(40)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    child: Text("View More",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          details.when(
            data: (data) {
              return Expanded(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return NewsContainer(
                        title: data[index].title,
                        description: data[index].desc,
                        link: data[index].titleLink,
                        imageurl: data[index].image,
                        date: data[index].date,
                      );
                    }),
              );
            },
            loading: () => Container(
                height: height * 0.44,
                child: Column(children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8, top: 10, bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height * 0.1952,
                            width: width * 0.31,
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
                                height: height * 0.039,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                height: height * 0.145,
                                color: Colors.white,
                              ),
                              Container()
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8, top: 10, bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height * 0.1952,
                            width: width * 0.31,
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
                                height: height * 0.039,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                height: height * 0.145,
                                color: Colors.white,
                              ),
                              Container()
                            ],
                          ))
                        ],
                      ),
                    ),
                  )
                ])),
            error: (Object error, StackTrace? stackTrace) {
              return Center(
                child: Text(error.toString()),
              );
            },
          )
        ]),
      ),
    );
  }
}
