import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../PublicView/mycomplaintspage.dart/pendingpage.dart';

class AdminHoldPage extends ConsumerStatefulWidget {
  const AdminHoldPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AdminHoldPageState();
}

class _AdminHoldPageState extends ConsumerState<AdminHoldPage> {
  bool ispending = false;
  bool issolved = false;
  bool ishold = true;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: 2,
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
                                  const Text(
                                    "Prasanna Poudel",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: width * 0.02,
                                  ),
                                  const Text(
                                    "2072-02-12 11:12pm",
                                  ),
                                  Spacer(),
                                  //add a option menu but the menu should pop from bottom
                                  IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            backgroundColor: Colors.white,
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20))),
                                            context: context,
                                            builder: (context) {
                                              return Wrap(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                width * 0.02,
                                                            vertical:
                                                                height * 0.02),
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
                                                                ishold = false;
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
                                                                    Icons.check,
                                                                    color: Colors
                                                                        .green,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: width *
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
                                                                    Icons.check,
                                                                    color: Colors
                                                                        .green,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: width *
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
                                                              setState(() {
                                                                ispending =
                                                                    false;
                                                                ishold = false;
                                                                issolved = true;
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
                                                                    Icons.check,
                                                                    color: Colors
                                                                        .green,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: width *
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
                      const ReadMoreText(
                        "This is the description Section of Complaints people have been comitted to do all the decoarations of the people can add complaint descriptions it is much more important to have like this at the point of my correction fir",
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
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              height: height * 0.15,
                              width: width * 0.5,
                              child: const Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  "assets/images/wirem.png",
                                ),
                              )),
                          SizedBox(width: width * 0.02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              makeTwoline("Status:", "Hold", context),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              makeTwoline("Location:", "mangadh", context),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              makeTwoline("Ward No:", "4", context),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              makeTwoline("Priority:", "High", context),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              makeTwoline("Category:", "Road", context)
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
    );
  }
}
