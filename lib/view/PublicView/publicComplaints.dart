import 'dart:async';
import 'dart:convert';
import 'dart:math' show cos, sqrt, asin;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:project/Riverpod/Models/userModel.dart';
import 'package:project/view/PublicView/viewonmap.dart';

import '../../Riverpod/baseDIo.dart';
import '../../Riverpod/config.dart';
import '../../widgets/TEsts/random.dart';
import 'mycomplaintspage.dart/pendingpage.dart';

class PublicComplaints extends ConsumerStatefulWidget {
  const PublicComplaints({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PublicComplaintsState();
}

class _PublicComplaintsState extends ConsumerState<PublicComplaints>
    with SingleTickerProviderStateMixin {
  List<ComplaintGetAllModel> datas = [];
  bool isanimation = false;
  bool ispressed = true;
  bool isward = false;
  bool ispending = false;
  bool ishold = false;
  bool issolved = false;
  bool isHigh = false;
  bool isLow = false;
  bool isdefault = true;
  bool isnearme = false;
  TextEditingController searchController = TextEditingController();
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  Timer? _timer;
  int _number = 0;
  // int seconds = 500;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {
      setState(() {
        if (_number < datas.length) {
          _number++;
        } else {
          timer.cancel();
        }
      });
    });
  }

  getNearmeComplaints() async {
    var location = Location();

    LocationData ld = await location.getLocation();

    datas.sort((a, b) {
      double toA = calculateDistanceUsingLatandLong(ld.latitude, ld.longitude,
          firstString(a.address), lastString(a.address));
      double toB = calculateDistanceUsingLatandLong(ld.latitude, ld.longitude,
          firstString(b.address), lastString(b.address));
      return toA.compareTo(toB);
    });

    setState(() {});
  }

  double calculateDistanceUsingLatandLong(
      latitudefirst, longitudefirst, latitudesecond, longitudesecond) {
    var perfectDistancetoCalculate = 0.017453292519943295;
    var accumulatedDistancefromCurrentPosition = 0.5 -
        cos((latitudesecond - latitudefirst) * perfectDistancetoCalculate) / 2 +
        cos(latitudefirst * perfectDistancetoCalculate) *
            cos(latitudesecond * perfectDistancetoCalculate) *
            (1 -
                cos((longitudesecond - longitudefirst) *
                    perfectDistancetoCalculate)) /
            2;
    return 12742 * asin(sqrt(accumulatedDistancefromCurrentPosition)) * 1000;
  }

  getinitdata() {
    getComplaints().then((value) {
      setState(() {
        datas = value;
      });
    });
  }

  getmyward() {
    getComplaints().then((value) {
      final dw = value.where((element) => element.ward == 3).toList();
      setState(() {
        datas = dw;
      });
    });
  }

  getpendingdata() {
    getComplaints().then((value) {
      final dw = value.where((element) => element.status == 'pending').toList();
      setState(() {
        datas = dw;
      });
    });
  }

  getholddata() {
    getComplaints().then((value) {
      final dw = value.where((element) => element.status == 'hold').toList();
      setState(() {
        datas = dw;
      });
    });
  }

  getsolveddata() {
    getComplaints().then((value) {
      final dw = value.where((element) => element.status == 'solved').toList();
      setState(() {
        datas = dw;
      });
    });
  }

  // sortlowpriority() {
  //   datas.sort((a, b) => a.priority.compareTo(b.priority));

  //   // });
  // }

  // sorthighpriority() {
  //   datas.sort((a, b) => b.priority.compareTo(a.priority));

  //   // });
  // }

  @override
  void initState() {
    super.initState();

    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: Duration(seconds: 1),
    // )..repeat();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    )..repeat(reverse: true);
    _animation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getinitdata();

      // getpendingdata();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    // final details = ref.watch(getallComplaintProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Public Complaints"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: TextField(
                                // keyboardType: TextInputType.number,
                                controller: searchController,
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    getinitdata();
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "Search by name",
                                  isDense: true,
                                  contentPadding: const EdgeInsets.all(12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ))),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            setState(() {
                              datas = datas
                                  .where((element) => element.title
                                      .toLowerCase()
                                      .contains(searchController.value.text
                                          .toLowerCase()))
                                  .toList();
                            });
                          },
                          child: const Chip(
                            backgroundColor: Colors.blue,
                            label: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 6.0),
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Visibility(
                          visible: ispressed,
                          child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  PopupMenuButton(
                                    icon: const Icon(Icons.filter_list),
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          onTap: () {
                                            setState(() {
                                              datas = [];
                                            });
                                            getmyward();
                                            setState(() {
                                              ispressed = false;
                                              isward = true;
                                            });
                                          },
                                          child: const Text("My Ward"),
                                        ),
                                        PopupMenuItem(
                                          onTap: () {
                                            setState(() {
                                              datas = [];
                                            });
                                            getpendingdata();
                                            setState(() {
                                              ispressed = false;
                                              ispending = true;
                                            });
                                          },
                                          child: const Text("Pending"),
                                        ),
                                        PopupMenuItem(
                                          onTap: () {
                                            setState(() {
                                              datas = [];
                                            });
                                            getholddata();
                                            setState(() {
                                              ispressed = false;
                                              ishold = true;
                                            });
                                          },
                                          child: const Text("Hold"),
                                        ),
                                        PopupMenuItem(
                                          onTap: () {
                                            setState(() {
                                              datas = [];
                                            });
                                            getsolveddata();
                                            setState(() {
                                              ispressed = false;
                                              issolved = true;
                                            });
                                          },
                                          child: const Text("Solved"),
                                        ),
                                      ];
                                    },
                                  ),
                                  const Text(
                                    "Filter",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              )

                              //  Row(
                              //   children: [
                              //     Icon(Icons.filter_list),
                              //     const Text("  Filter"),
                              //   ],
                              // ),
                              ),
                        ),
                        Visibility(
                          visible: isward,
                          child: FilterChip(
                              label: const Row(
                                children: [
                                  Text(
                                    "My Ward",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              onSelected: (value) {
                                getinitdata();
                                setState(() {
                                  ispressed = true;
                                  isward = false;
                                });
                              }),
                        ),
                        Visibility(
                          visible: ispending,
                          child: FilterChip(
                              label: const Row(
                                children: [
                                  Text(
                                    "Pending",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              onSelected: (value) {
                                setState(() {
                                  datas = [];
                                });
                                getinitdata();
                                setState(() {
                                  ispressed = true;
                                  ispending = false;
                                });
                              }),
                        ),
                        Visibility(
                          visible: ishold,
                          child: FilterChip(
                              label: const Row(
                                children: [
                                  Text(
                                    "Hold",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              onSelected: (value) {
                                setState(() {
                                  datas = [];
                                });
                                getinitdata();
                                setState(() {
                                  ispressed = true;
                                  ishold = false;
                                });
                              }),
                        ),
                        Visibility(
                          visible: issolved,
                          child: FilterChip(
                              label: const Row(
                                children: [
                                  Text(
                                    "Solved",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.close,
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                              onSelected: (value) {
                                setState(() {
                                  datas = [];
                                });
                                getinitdata();
                                setState(() {
                                  ispressed = true;
                                  issolved = false;
                                });
                              }),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              Text(
                                isdefault
                                    ? "Sort"
                                    : isHigh
                                        ? "High to Low"
                                        : isLow
                                            ? "Low to High"
                                            : "Near me",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              // Icon(Icons.keyboard_double_arrow_down_sharp),
                              PopupMenuButton(
                                icon: const Icon(
                                    Icons.keyboard_double_arrow_down_sharp),
                                itemBuilder: (context) {
                                  return [
                                    PopupMenuItem(
                                      onTap: () {
                                        // setState(() {
                                        //   datas = [];
                                        // });
                                        // getinitdata();
                                        // sorthighpriority();
                                        setState(() {
                                          isdefault = false;
                                          isHigh = true;
                                          isLow = false;
                                        });
                                      },
                                      child: const Text("High to Low"),
                                    ),
                                    PopupMenuItem(
                                      onTap: () {
                                        // setState(() {
                                        //   datas = [];
                                        // });
                                        // getinitdata();
                                        // sortlowpriority();
                                        setState(() {
                                          isdefault = false;
                                          isHigh = false;
                                          isLow = true;
                                        });
                                      },
                                      child: const Text("Low to High"),
                                    ),
                                    PopupMenuItem(
                                      onTap: () {
                                        getNearmeComplaints();
                                        setState(() {
                                          isnearme = true;
                                          isdefault = false;
                                          isHigh = false;
                                          isLow = false;
                                        });

                                        setState(() {
                                          _number = 0;
                                          // datas = [];
                                          isanimation = true;
                                        });
                                        _startTimer();

                                        Future.delayed(
                                            Duration(
                                                milliseconds:
                                                    1000 * datas.length + 500),
                                            () {
                                          setState(() {
                                            isanimation = false;
                                          });
                                        });

                                        // getinitdata();
                                        // sortlowpriority();
                                      },
                                      child: const Text("Near me"),
                                    ),
                                    PopupMenuItem(
                                      onTap: () {
                                        setState(() {
                                          datas = [];
                                        });
                                        getinitdata();
                                        setState(() {
                                          isdefault = true;
                                          isLow = false;
                                          isHigh = false;
                                        });
                                      },
                                      child: const Text("Default"),
                                    ),
                                  ];
                                },
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              datas.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : isanimation
                      ? Column(
                          children: [
                            const CircleAvatar(
                              radius: 145,
                              backgroundColor: Colors.green,
                              child: CircleAvatar(
                                radius: 140,
                                backgroundImage:
                                    AssetImage("assets/images/map.jpg"),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // child: Image.asset("assets/images/map.jpg")),
                            SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: SlideTransition(
                                position: _animation,
                                child: Image.asset(
                                  "assets/images/mapicon.png",
                                  height: 50,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Searching...",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 22),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Found $_number Nearby Complaints",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18),
                            )
                            // RotationTransition(
                            //   turns: Tween(begin: 0.0, end: 1.0)
                            //       .animate(_animationController),
                            //   child: Image.asset(
                            //     "assets/images/mapicon.png",
                            //     height: 50,
                            //   ),
                            // ),
                          ],
                        )
                      : Column(
                          children: [
                            isnearme
                                ? Column(
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Found ${datas.length} Nearby Complaints",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const ViewonMap(),
                                              ));
                                        },
                                        child: const Chip(
                                            backgroundColor: Colors.blue,
                                            label: Text(
                                              "View On Map",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      )
                                    ],
                                  )
                                : const SizedBox(),
                            const SizedBox(
                              height: 10,
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: datas.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2.0,
                                      right: 2.0,
                                      top: 4.0,
                                      bottom: 6),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => RandomPage(
                                                    choosedlat: firstString(
                                                        datas[index].address),
                                                    choosedlong: lastString(
                                                        datas[index].address),
                                                  )));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          color: Colors.grey.shade200),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0,
                                            left: 13,
                                            right: 4,
                                            bottom: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(0.0),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.white,
                                                          radius: width * 0.04,
                                                          backgroundImage:
                                                              const AssetImage(
                                                                  "assets/images/user.png"),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.02,
                                                        ),
                                                        Text(
                                                          datas[index]
                                                              .username!,
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 17,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.02,
                                                        ),
                                                        Text(
                                                          datas[index]
                                                              .created_at
                                                              .toString()
                                                              .substring(0, 10),
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.04,
                                                        ),
                                                        Chip(
                                                            backgroundColor: datas[
                                                                            index]
                                                                        .priority ==
                                                                    0
                                                                ? Colors.green
                                                                : datas[index]
                                                                            .priority ==
                                                                        1
                                                                    ? Colors
                                                                        .orange
                                                                    : Colors
                                                                        .red,
                                                            label: Text(
                                                              datas[index].priority ==
                                                                      0
                                                                  ? "Low"
                                                                  : datas[index]
                                                                              .priority ==
                                                                          1
                                                                      ? "Medium"
                                                                      : "High",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )),
                                                      ],
                                                    ),
                                                  ]),
                                            ),
                                            //add a option menu but the menu should pop from bottom

                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            Text(
                                              datas[index].title,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: height * 0.01,
                                            ),
                                            ReadMoreText(
                                              datas[index].description,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                datas[index].image == null
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
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          Container(
                                                                        height: height *
                                                                            0.8,
                                                                        decoration:
                                                                            BoxDecoration(image: DecorationImage(image: MemoryImage(base64Decode(datas[index].image.toString())), fit: BoxFit.fitWidth)),
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
                                                              height:
                                                                  height * 0.15,
                                                              width:
                                                                  width * 0.5,
                                                              decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                      image: MemoryImage(base64Decode(datas[
                                                                              index]
                                                                          .image
                                                                          .toString())),
                                                                      fit: BoxFit
                                                                          .cover)),
                                                            ),
                                                            SizedBox(
                                                                width: width *
                                                                    0.02),
                                                          ],
                                                        ),
                                                      ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    makeTwoline(
                                                        "Status:",
                                                        datas[index].status,
                                                        context),
                                                    SizedBox(
                                                      height: height * 0.01,
                                                    ),
                                                    makeTwoline(
                                                        "Ward No:",
                                                        datas[index]
                                                            .ward
                                                            .toString(),
                                                        context),
                                                    SizedBox(
                                                      height: height * 0.01,
                                                    ),
                                                    makeTwoline(
                                                        "Priority:",
                                                        datas[index].priority,
                                                        context),
                                                    SizedBox(
                                                      height: height * 0.01,
                                                    ),
                                                    makeTwoline(
                                                        "Category:",
                                                        datas[index].category,
                                                        context)
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
                          ],
                        ),
            ],
          ),
        ));
  }
}

Future<List<ComplaintGetAllModel>> getComplaints() async {
  final response =
      await Api().get("${MyConfig.nodeUrl}/getAllComplaint");
  print("fatas: ${response.statusCode}");
  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.data);

    return data.map((data) => ComplaintGetAllModel.fromJson(data)).toList();
  } else {
    List<ComplaintGetAllModel> a = [];
    return a;
  }
}
