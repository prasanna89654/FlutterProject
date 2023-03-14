import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

class Approvepage extends ConsumerStatefulWidget {
  const Approvepage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ApprovepageState();
}

class _ApprovepageState extends ConsumerState<Approvepage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("All Requests"),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            thickness: 1,
          ),
          padding: EdgeInsets.zero,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          // shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    backgroundImage: AssetImage("assets/images/user.png"),
                  ),
                  contentPadding: EdgeInsets.zero,
                  title: Text("Prasanna ${index}"),
                  subtitle: Text(index == 0
                      ? "Health Maintainer"
                      : index == 1
                          ? "Water Maintainer"
                          : index == 2
                              ? "Water Maintainer"
                              : index == 3
                                  ? "Road Maintainer"
                                  : index == 4
                                      ? "Education Maintainer"
                                      : "Water Maintainer"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            Fluttertoast.showToast(msg: "Approved");
                          },
                          icon: const Icon(
                            Icons.check,
                            color: Colors.green,
                          )),
                      IconButton(
                          onPressed: () {
                            Fluttertoast.showToast(msg: "Declined");
                          },
                          icon: const Icon(
                            Icons.close,
                            color: Colors.red,
                          )),
                    ],
                  )),
            );
          },
        ));
  }
}
