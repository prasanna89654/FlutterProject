// ignore_for_file: sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:project/Riverpod/Repository/complaintController.dart';
import 'package:project/Riverpod/constants.dart';
import 'package:project/view/PublicView/Complaints/addcomplaint.dart';
import 'package:project/view/PublicView/trackpage.dart';
import 'package:project/widgets/crousal.dart';
import 'package:project/widgets/newsmaker.dart';

import '../../Riverpod/Models/userModel.dart';
import '../../Riverpod/baseDIo.dart';
import '../../Riverpod/config.dart';
import '../../widgets/publicmaker.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key, this.changePage});
  final void Function(int)? changePage;

  @override
  ConsumerState<Homepage> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  @override
  void initState() {
    ref.refresh(getownReportProvider);
    // getinitdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    final token = getStringAsync(accessToken);
    print("tokenId: $token");
    final report = ref.watch(getownReportProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Crousal(),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: height * 0.15,
                child: Container(
                  height: height * 0.29,
                  width: width,
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    borderRadius: BorderRadius.vertical(
                        top: Radius.elliptical(width, 10.0),
                        bottom: Radius.elliptical(width, 120.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: height * 0.120,
                            width: width * 0.30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: height * 0.09,
                                    width: width * 0.22,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.blue),
                                      color: Colors.white,
                                    ),
                                    child: IconButton(
                                      onPressed: (() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const test(),
                                            ));
                                      }),
                                      icon: const Icon(Icons.track_changes),
                                    )),
                                const Text("Track Complain")
                              ],
                            )),
                        Container(
                            height: height * 0.120,
                            width: width * 0.30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: height * 0.09,
                                    width: width * 0.22,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(color: Colors.blue),
                                    ),
                                    child: IconButton(
                                      onPressed: (() {
                                        showDialog(
                                            context: context,
                                            builder: (_) =>
                                                const ComplaintAddPage());
                                      }),
                                      icon: const Icon(Icons.add),
                                    )),
                                const Text("Add Complain")
                              ],
                            )),
                        Container(
                            height: height * 0.120,
                            width: width * 0.30,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: height * 0.09,
                                    width: width * 0.22,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      border: Border.all(color: Colors.blue),
                                    ),
                                    child: IconButton(
                                      onPressed: (() {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           const Helpliness(),
                                        //     ));
                                      }),
                                      icon: const Icon(Icons.phone),
                                    )),
                                const Text("Helplines")
                              ],
                            )),
                      ],
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 14, right: 14),
              child: Container(
                height: height * 0.224,
                // color: Colors.blue,
                child: report.when(
                  data: (data) => Card(
                      margin: const EdgeInsets.all(3),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: const BorderSide(
                              width: 5,
                              color: Color.fromARGB(255, 245, 242, 251))),
                      elevation: 20,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 30, right: 30),
                        child: Column(
                          children: [
                            const Center(
                              child: Text(
                                "Complaint Status",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: height * 0.1,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text(
                                        "Pending",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Container(
                                            height: height * 0.045,
                                            width: width * 0.10,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.rectangle,
                                                // color: Colors.blue,
                                                border: Border.all(
                                                    color: Colors.black)),
                                            child: Center(
                                              child: Text(
                                                data!.pendingComplaint
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                    height: height * 0.10,
                                    child: const VerticalDivider(
                                      thickness: 2,
                                      color: Colors.black26,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    height: height * 0.098,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        const Text(
                                          "Hold",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Container(
                                              height: height * 0.045,
                                              width: width * 0.10,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  // color: Colors.blue,
                                                  border: Border.all(
                                                      color: Colors.black)),
                                              child: Center(
                                                child: Text(
                                                  data.holdComplaint.toString(),
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                    height: height * 0.10,
                                    // color: Colors.red,
                                    child: const VerticalDivider(
                                      thickness: 2,
                                      color: Colors.black26,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    height: height * 0.098,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        const Text(
                                          "Solved",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Container(
                                              height: height * 0.048,
                                              width: width * 0.10,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.rectangle,
                                                  // color: Colors.blue,
                                                  border: Border.all(
                                                      color: Colors.black)),
                                              child: Center(
                                                child: Text(
                                                  data.solvedComplaint
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )),
                  error: (Object error, StackTrace? stackTrace) {
                    return null;
                  },
                  loading: () {
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Publicmaker(),
            // const Nearbymaker(),
            Newsmaker(
              changePage: widget.changePage,
            )
          ],
        ),
      ),
    );
  }
}

Future<UserModel?> getuserdetails() async {
  try {
    String gethomeworkdetails = "/getUserProfile";
    final response = await Api().get(MyConfig.nodeUrl + gethomeworkdetails);
    if (response.statusCode == 200) {
      var value = json.decode(response.toString());

      var data = UserModel.fromJson(value);

      return data;
    }
  } catch (e) {
    // ignore: avoid_print
    print(e.toString());
  }
  return null;
}
