import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../Riverpod/Models/userModel.dart';
import '../../../Riverpod/baseDIo.dart';
import '../../../Riverpod/config.dart';
import '../../../widgets/TEsts/random.dart';

class PendingComplaints extends ConsumerStatefulWidget {
  const PendingComplaints({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PendingComplaintsState();
}

class _PendingComplaintsState extends ConsumerState<PendingComplaints> {
  List<ComplaintGetAllModel>? datas;

  @override
  void initState() {
    super.initState();

    getownComplaints().then((value) {
      if (mounted) {
        setState(() {
          datas = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: datas == null
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                // datas.clear();
                // ref.watch(getownComplaintProvider).when(
                //       data: (data) {
                //         final dad = data
                //             .where((element) => element.status == 'pending')
                //             .toList();
                //         setState(() {
                //           datas = dad;
                //         });
                //       },
                //       error: (error, stackTrace) {},
                //       loading: () {},
                //     );
                // return Future<void>.value();
              },
              child: ListView.builder(
                itemCount: datas!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 2.0, right: 2.0, top: 0.0, bottom: 6),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RandomPage(
                                      choosedlat:
                                          firstString(datas![index].address),
                                      choosedlong:
                                          lastString(datas![index].address),
                                    )));
                      },
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      datas![index].created_at.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black),
                                    ),
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
                                                              onPressed:
                                                                  () async {
                                                                // Navigator.push(
                                                                //     context,
                                                                //     MaterialPageRoute(
                                                                //         builder: (context) =>
                                                                //             ComplaintUpdatePage(
                                                                //               cm: datas[index],
                                                                //             )));
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  const Icon(
                                                                    Icons.edit,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        width *
                                                                            0.04,
                                                                  ),
                                                                  const Text(
                                                                    "Edit",
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
                                                                showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (BuildContext
                                                                          context) {
                                                                    return AlertDialog(
                                                                      title:
                                                                          const Text(
                                                                        "Are you sure you want to delete?",
                                                                        // style: getsubtitleSize(context).copyWith(fontFamily: "Regular"),
                                                                      ),
                                                                      actions: [
                                                                        TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                          child:
                                                                              const Text("No"),
                                                                        ),
                                                                        TextButton(
                                                                          onPressed:
                                                                              () {
                                                                            // Future<dynamic>
                                                                            //     code =
                                                                            //     ref.watch(complaintProvider).deleteComplaint(datas[index].id.toString());
                                                                            // code.then(
                                                                            //   (value) {
                                                                            //     if (value == 200) {
                                                                            //       Navigator.pop(context);
                                                                            //       Navigator.pop(context);
                                                                            //       ref.refresh(getallComplaintProvider);

                                                                            //       Navigator.pushReplacement(
                                                                            //           context,
                                                                            //           MaterialPageRoute(
                                                                            //               builder: (context) => Appbar(
                                                                            //                     cindex: 1,
                                                                            //                   )));
                                                                            //     }
                                                                            //   },
                                                                            // );
                                                                          },
                                                                          child:
                                                                              const Text("Yes"),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  const Icon(
                                                                    Icons
                                                                        .delete,
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        width *
                                                                            0.04,
                                                                  ),
                                                                  const Text(
                                                                    "Delete",
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
                                        icon: const Icon(
                                          Icons.more_vert,
                                          color: Colors.black,
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text(
                                datas![index].title.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              ReadMoreText(
                                datas![index].description.toString(),
                                trimLines: 3,
                                colorClickableText: Colors.blue,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Read more',
                                trimExpandedText: '...show less',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.015,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  datas![index].image == null
                                      ? const SizedBox()
                                      : InkWell(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Center(
                                                  child: Wrap(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                          height: height * 0.15,
                                                          width: width * 0.5,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: MemoryImage(
                                                                      base64Decode(datas![
                                                                              index]
                                                                          .image
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
                                          child: Row(
                                            children: [
                                              Container(
                                                height: height * 0.15,
                                                width: width * 0.5,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: MemoryImage(
                                                            base64Decode(datas![
                                                                    index]
                                                                .image
                                                                .toString())),
                                                        fit: BoxFit.cover)),
                                              ),
                                              SizedBox(width: width * 0.02),
                                            ],
                                          ),
                                        ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      makeTwoline("Status:",
                                          datas![index].status, context),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      makeTwoline(
                                          "Ward No:",
                                          datas![index].ward.toString(),
                                          context),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      makeTwoline("Priority:",
                                          datas![index].priority, context),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      makeTwoline("Category:",
                                          datas![index].category, context)
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

makeTwoline(String first, String second, BuildContext context) {
  var height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        first,
        style: const TextStyle(
            fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),
      ),
      SizedBox(width: width * 0.01),
      SizedBox(
        child: Text(
          second,
          style: const TextStyle(fontSize: 15
              // fontWeight: FontWeight.bold,
              ),
        ),
      ),
    ],
  );
}

double firstString(String str) {
  var split = str.split("+");
  var first = split[0];
  var last = split[1];
  return first.toDouble();
}

double lastString(String str) {
  var split = str.split("+");
  var first = split[0];
  var last = split[1];
  return last.toDouble();
}

Future<List<ComplaintGetAllModel>> getownComplaints() async {
  final response =
      await Api().get("${MyConfig.nodeUrl}/complaint/getOwnComplaint");

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.data);

    return data.map((data) => ComplaintGetAllModel.fromJson(data)).toList();
  } else {
    List<ComplaintGetAllModel> a = [];
    return a;
  }
}
