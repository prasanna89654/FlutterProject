import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project/view/AdminView/editeventpage.dart';
import 'package:readmore/readmore.dart';

import '../../Riverpod/Repository/EventController.dart';
import '../PublicView/mycomplaintspage.dart/pendingpage.dart';

class UpdateEventsPage extends ConsumerStatefulWidget {
  const UpdateEventsPage({super.key});

  @override
  ConsumerState<UpdateEventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends ConsumerState<UpdateEventsPage> {
  // @override
  // void initState() {
  //   ref.refresh(getalleventsProvider);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final details = ref.watch(getalleventsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Event"),
      ),
      body: details.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 2.0, right: 2.0, top: 4.0, bottom: 6),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.grey.shade200),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, left: 13, right: 13, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          data[index].imageBytes == null
                              ? Container(
                                  height: height * 0.2,
                                  width: width,
                                  color: Colors.grey,
                                  child: Center(
                                    child: const Text(
                                      "No Image",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                )
                              : Container(
                                  height: height * 0.2,
                                  width: width,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: MemoryImage(base64Decode(
                                              data[index]
                                                  .imageBytes
                                                  .toString())),
                                          fit: BoxFit.cover)),
                                ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Text(
                              data[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          ReadMoreText(
                            data[index].shortDescription,
                            trimLines: 3,
                            colorClickableText: Colors.blue,
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Read more',
                            trimExpandedText: '...show less',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  makeTwoline("Location:", data[index].location,
                                      context),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  makeTwoline(
                                      "Date:", data[index].eventMiti, context),
                                ],
                              ),
                              SizedBox(
                                width: width * 0.1,
                              ),
                              IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        backgroundColor: Colors.white,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20))),
                                        context: context,
                                        builder: (context) {
                                          return Wrap(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: width * 0.02,
                                                    vertical: height * 0.02),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextButton(
                                                        onPressed: () async {
                                                          // final cid = await getclassId(data[index]
                                                          //     .detail[dindex]
                                                          //     .detailClass);

                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          EditEventPage(
                                                                            em: data[index],
                                                                          )));
                                                        },
                                                        child: Row(
                                                          children: [
                                                            const Icon(
                                                              Icons.edit,
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  width * 0.04,
                                                            ),
                                                            const Text(
                                                              "Edit",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                    TextButton(
                                                        onPressed: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                  "Are you sure you want to delete?",
                                                                  // style: getsubtitleSize(context).copyWith(fontFamily: "Regular"),
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child:
                                                                        const Text(
                                                                            "No"),
                                                                  ),
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Future<dynamic>
                                                                          code =
                                                                          ref.watch(eventsProvider).deleteEvents(data[index]
                                                                              .id
                                                                              .toString());
                                                                      code.then(
                                                                        (value) {
                                                                          if (value ==
                                                                              200) {
                                                                            Navigator.pop(context);
                                                                            Navigator.pop(context);
                                                                            ref.refresh(getalleventsProvider);

                                                                            Navigator.pushReplacement(context,
                                                                                MaterialPageRoute(builder: (context) => UpdateEventsPage()));
                                                                          }
                                                                        },
                                                                      );
                                                                    },
                                                                    child: const Text(
                                                                        "Yes"),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Row(
                                                          children: [
                                                            const Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                            ),
                                                            SizedBox(
                                                              width:
                                                                  width * 0.04,
                                                            ),
                                                            const Text(
                                                              "Delete",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black87,
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          );
                                        });
                                  },
                                  icon: Icon(
                                    Icons.more_vert,
                                    size: 25,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ));
          },
        ),
        error: (Object error, StackTrace? stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () {
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
