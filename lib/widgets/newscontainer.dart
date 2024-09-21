// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';

import '../view/PublicView/webview.dart';

// import '../screens/webview_screen.dart';

class NewsContainer extends StatelessWidget {
  final String? imageurl;
  final String? title;
  final String? description;
  final String? date;
  final String? link;
  const NewsContainer(
      {super.key,
      this.imageurl,
      this.title,
      this.description,
      this.link,
      this.date});

  @override
  Widget build(BuildContext context) {
    removelast(String value) {
      final String result = value.substring(0, value.length - 5);
      return result;
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WebviewScreen(url: link)));
        },
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                  width: 3, color: Color.fromARGB(255, 245, 242, 251)),
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 20,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 3, top: 3, bottom: 3, right: 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: NetworkImage(imageurl!))),
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(title!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(description!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle()),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, bottom: 8),
                              child: Text(removelast(date!),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    // color: Colors.grey
                                  )),
                            )
                          ],
                        )
                      ],
                    ))
              ],

              // color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
