import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:project/view/PublicView/mycomplaintspage.dart/pendingpage.dart";
import "package:readmore/readmore.dart";

class SolvedPage extends ConsumerStatefulWidget {
  const SolvedPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SolvedPageState();
}

class _SolvedPageState extends ConsumerState<SolvedPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: 1,
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
                  padding: EdgeInsets.only(
                      top: 10.0, left: 13, right: 13, bottom: 10),
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
                                Text(
                                  "Today",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                Text(
                                  "11:12pm",
                                )
                              ],
                            )),
                            //add a option menu but the menu should pop from bottom
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
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
                                  "assets/images/road.png",
                                ),
                              )),
                          SizedBox(width: width * 0.02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              makeTwoline("Status:", "Solved", context),
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
