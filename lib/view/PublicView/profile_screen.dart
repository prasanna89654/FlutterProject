// ignore_for_file: camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project/Riverpod/Repository/complaintController.dart';

import '../../widgets/profile_maker.dart';
import '../../widgets/style.dart';

class profile extends ConsumerStatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  ConsumerState<profile> createState() => _profileState();
}

class _profileState extends ConsumerState<profile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    final details = ref.watch(getuserProvider);
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: details.when(
                data: (data) => Column(
                  children: [
                    Container(
                        height: height * 0.12,
                        // color: Colors.red,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              // width: height * 0.11,
                              // height: height * 0.11,
                              child: const CircleAvatar(
                                backgroundImage: AssetImage(
                                  "assets/images/user.png",
                                ),
                                backgroundColor: Colors.white,
                                radius: 45,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                                height: height * 0.05,
                                width: width * 0.65,
                                // color: Colors.blue,
                                child: style(text: data!.name, fontsize: 25)),

                            // ClipRRect(
                            //     child: SizedBox.fromSize(
                            //   size: Size.fromRadius(48), // Image radius
                            //   child: Image.asset(
                            //     'assets/images/profile1.png',
                            //     height: 10,
                            //     width: 10,
                            //   ),
                            // ))
                          ],
                        )),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: height * 0.55,
                      // color: Colors.green,
                      child: ListView(
                        // padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                        children: [
                          pmaker(
                            image: "assets/images/email.png",
                            text: 'Email',
                            text1: data.emailAddress.toString(),
                          ),
                          const pmaker(
                            image: "assets/images/location.png",
                            text: 'Location',
                            text1: 'biratnagar',
                          ),
                          const pmaker(
                            image: "assets/images/land.png",
                            text: 'Ward Number',
                            text1: '3',
                          ),
                          const pmaker(
                            image: "assets/images/calendar.png",
                            text: 'D.O.B',
                            text1: '12-12-2000',
                          ),
                          const SizedBox(height: 15),
                          const Divider(
                            thickness: 1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                error: (Object error, StackTrace? stackTrace) {},
                loading: () {},
              ))),
    );
  }
}
