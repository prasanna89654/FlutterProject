import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;
import 'package:project/Riverpod/Repository/complaintController.dart';

import '../../PublicView/mycomplaintspage.dart/pendingpage.dart';

class PendingPage extends ConsumerStatefulWidget {
  const PendingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PendingPageState();
}

class _PendingPageState extends ConsumerState<PendingPage> {
  bool ispending = true;
  bool issolved = false;
  bool ishold = false;

  holdnoti(String id) {
    var data = {
      "registration_ids": [
        "dHe6leWkTSy6zNpQ3pQmy2:APA91bGbhDUz1_XR1hYYeJvWbUrZIKemFl1f9AmSY3onXNhiIqjYTlujNaSsDJ_KWRPmh6uijYa7mTPNH1kOPgJXlsXWP3JsVAL6KXNdnuORX1iDlNG6j8ChZDXm8AexfDjwUlyVGgpA"
      ],
      "notification": {
        "body": "Your Complaint at $id is on Hold",
        "title": "Hold",
        "android_channel_id": "project",
        "sound": false
      }
    };
    var url = Uri.parse("https://fcm.googleapis.com/fcm/send");

    var response = http.post(url, body: json.encode(data), headers: {
      "Content-Type": "application/json",
      "Authorization":
          "key=AAAAT6UPTPw:APA91bGik0yWQnYEzR6wb8qU0EM28dJeHypX_JkrFOVUyZ1h8OkoLraz6owJW7DF3cj6PNXQWDCf9uaFQO-kwLeZ_cXbJsUjc5-QxKbydYMKH-0Ukk-SYc6HB8ED_Qj5oYcHEz4YRXtF"
    });
  }

  solvednoti(String id) {
    var data = {
      "registration_ids": [
        "dHe6leWkTSy6zNpQ3pQmy2:APA91bGbhDUz1_XR1hYYeJvWbUrZIKemFl1f9AmSY3onXNhiIqjYTlujNaSsDJ_KWRPmh6uijYa7mTPNH1kOPgJXlsXWP3JsVAL6KXNdnuORX1iDlNG6j8ChZDXm8AexfDjwUlyVGgpA"
      ],
      "notification": {
        "body": "Your Complaint at $id is Solved",
        "title": "Solved",
        "android_channel_id": "project",
        "sound": false
      }
    };
    var url = Uri.parse("https://fcm.googleapis.com/fcm/send");

    var response = http.post(url, body: json.encode(data), headers: {
      "Content-Type": "application/json",
      "Authorization":
          "key=AAAAT6UPTPw:APA91bGik0yWQnYEzR6wb8qU0EM28dJeHypX_JkrFOVUyZ1h8OkoLraz6owJW7DF3cj6PNXQWDCf9uaFQO-kwLeZ_cXbJsUjc5-QxKbydYMKH-0Ukk-SYc6HB8ED_Qj5oYcHEz4YRXtF"
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final details = ref.watch(getallComplaintProvider);
    return details.when(
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
                        top: 10.0, left: 13, right: 4, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: width * 0.04,
                                      backgroundImage: const AssetImage(
                                          "assets/images/user.png"),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Text(
                                      data[index].username,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Text(
                                      data[index].complaintMiti,
                                    ),
                                    Spacer(),
                                    //add a option menu but the menu should pop from bottom
                                    IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                              backgroundColor: Colors.white,
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(20),
                                                              topRight:
                                                                  Radius
                                                                      .circular(
                                                                          20))),
                                              context: context,
                                              builder: (context) {
                                                return Wrap(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal:
                                                                  width * 0.02,
                                                              vertical: height *
                                                                  0.02),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          TextButton(
                                                              onPressed: () {
                                                                setState(() {
                                                                  ispending =
                                                                      true;
                                                                  ishold =
                                                                      false;
                                                                  issolved =
                                                                      false;
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  Visibility(
                                                                    visible:
                                                                        ispending,
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: Colors
                                                                          .green,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        width *
                                                                            0.04,
                                                                  ),
                                                                  const Text(
                                                                    "Pending",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black87,
                                                                    ),
                                                                  ),
                                                                ],
                                                              )),
                                                          TextButton(
                                                              onPressed: () {
                                                                holdnoti(data[
                                                                        index]
                                                                    .complaintMiti);
                                                                setState(() {
                                                                  ispending =
                                                                      false;
                                                                  ishold = true;
                                                                  issolved =
                                                                      false;
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  Visibility(
                                                                    visible:
                                                                        ishold,
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: Colors
                                                                          .green,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        width *
                                                                            0.04,
                                                                  ),
                                                                  const Text(
                                                                    "Hold",
                                                                    style:
                                                                        TextStyle(
                                                                      color: Colors
                                                                          .black87,
                                                                    ),
                                                                  ),
                                                                ],
                                                              )),
                                                          TextButton(
                                                              onPressed: () {
                                                                solvednoti(data[
                                                                        index]
                                                                    .complaintMiti);
                                                                setState(() {
                                                                  ispending =
                                                                      false;
                                                                  ishold =
                                                                      false;
                                                                  issolved =
                                                                      true;
                                                                });
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  Visibility(
                                                                    visible:
                                                                        issolved,
                                                                    child:
                                                                        const Icon(
                                                                      Icons
                                                                          .check,
                                                                      color: Colors
                                                                          .green,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        width *
                                                                            0.04,
                                                                  ),
                                                                  const Text(
                                                                    "Solved",
                                                                    style:
                                                                        TextStyle(
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
                                          color: Colors.black,
                                        ))
                                  ],
                                )),
                              ]),
                        ),
                        //add a option menu but the menu should pop from bottom

                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          data[index].complaintTitle,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        ReadMoreText(
                          data[index].complaintDescription,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            data[index].imageBytes == null
                                ? Container(
                                    height: height * 0.15,
                                    width: width * 0.5,
                                    color: Colors.grey,
                                    child: Center(
                                      child: const Text(
                                        "No Image",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  )
                                : InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Center(
                                            child: Wrap(
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    height: height * 0.15,
                                                    width: width * 0.5,
                                                    decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: MemoryImage(
                                                                base64Decode(data[
                                                                        index]
                                                                    .imageBytes
                                                                    .toString())),
                                                            fit: BoxFit
                                                                .fitWidth)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      height: height * 0.15,
                                      width: width * 0.5,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: MemoryImage(base64Decode(
                                                  data[index]
                                                      .imageBytes
                                                      .toString())),
                                              fit: BoxFit.cover)),
                                    ),
                                  ),
                            SizedBox(width: width * 0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                makeTwoline(
                                    "Status:",
                                    data[index].complaintStatus == 0
                                        ? "Pending"
                                        : data[index].complaintStatus == 1
                                            ? "Hold"
                                            : "Solved",
                                    context),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                makeTwoline(
                                    "Location:", data[index].location, context),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                makeTwoline("Ward No:",
                                    data[index].wardNo.toString(), context),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                makeTwoline(
                                    "Priority:",
                                    data[index].priority == 0
                                        ? "Critical"
                                        : data[index].priority == 1
                                            ? "Moderate"
                                            : "Low",
                                    context),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                makeTwoline(
                                    "Category:",
                                    data[index].category == 0
                                        ? "Water"
                                        : data[index].category == 1
                                            ? "Road"
                                            : data[index].category == 2
                                                ? "Health"
                                                : data[index].category == 3
                                                    ? "Electricity"
                                                    : "Education",
                                    context)
                              ],
                            )
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
        return const Center(child: Text('Something went wrong!'));
      },
      loading: () {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
