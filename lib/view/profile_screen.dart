// ignore_for_file: camel_case_types, sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../widgets/profile_maker.dart';
import '../widgets/style.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
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
                      width: height * 0.11,
                      height: height * 0.11,
                      child: const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/Bill.png"),
                        backgroundColor: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                        height: height * 0.05,
                        width: width * 0.65,
                        // color: Colors.blue,
                        child: const style(text: 'Sample Name', fontsize: 25)),

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
            const SizedBox(height: 15),
            Container(
                height: height * 0.55,
                // color: Colors.green,
                child: ListView(
                  // padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                  children: const [
                    pmaker(
                      image: "assets/images/gender.png",
                      text: 'Gender',
                      text1: 'Male',
                    ),
                    pmaker(
                      image: "assets/images/calendar.png",
                      text: 'Birthday',
                      text1: '12-12-2000',
                    ),
                    pmaker(
                      image: "assets/images/email.png",
                      text: 'Email',
                      text1: 'poudellfvgdu7@gmail.com',
                    ),
                    pmaker(
                      image: "assets/images/call.png",
                      text: 'Phone Number',
                      text1: '98822843462',
                    ),
                    pmaker(
                      image: "assets/images/lock.png",
                      text: 'Password',
                      text1: '.............',
                    ),
                  ],
                ))
          ],
        ),
      )),
    );
  }
}
