import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:open_filex/open_filex.dart';
import 'package:project/Riverpod/Models/userModel.dart';
import 'package:project/Riverpod/config.dart';
import 'package:project/view/maintainerrequest.dart';

import '../Riverpod/baseDIo.dart';

class MyListItem extends StatefulWidget {
  final RequestModel data;

  MyListItem({required this.data});

  @override
  _MyListItemState createState() => _MyListItemState();
}

class _MyListItemState extends State<MyListItem> {
  bool isApproved = false;
  bool isDeclined = false;

  Future<int?> deleteRequest(String id) async {
    try {
      final url = "/maintainer/deleteRequest/$id";
      var response = await Api().delete(MyConfig.nodeUrl + url);
      return response.statusCode;
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ListTile(
          onTap: () async {
            showDialog(
                context: context,
                builder: (context) {
                  return StatefulBuilder(
                      builder: (context, setState) => AlertDialog(
                            title: Text(
                              widget.data.name,
                              style: TextStyle(color: Colors.blue),
                            ),
                            content: Wrap(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Role",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      widget.data.role,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(height: 20),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    Row(
                                      children: [
                                        const Text(
                                          "Document",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () async {
                                            final file =
                                                await createFileFromString(
                                                    widget.data.file);
                                            OpenFilex.open(file.path);
                                          },
                                          child: Chip(
                                            backgroundColor: Color(0xFFb53033),
                                            label: Row(
                                              children: [
                                                const Icon(
                                                  Icons.remove_red_eye,
                                                  color: Colors.white,
                                                  size: 18,
                                                ),
                                                const SizedBox(width: 5),
                                                const Text(
                                                  "View",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Description",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      widget.data.description,
                                      style: const TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )

                      // content:
                      );
                });
          },
          leading: const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            backgroundImage: AssetImage("assets/images/user.png"),
          ),
          contentPadding: EdgeInsets.zero,
          title: Text(
            widget.data.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              widget.data.position,
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ),
          //  Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     SizedBox(
          //       height: 3,
          //     ),
          //     Text(
          //       "Role: ${widget.data.position}",
          //       style: TextStyle(fontSize: 16, color: Colors.black),
          //     ),
          //     SizedBox(
          //       height: 3,
          //     ),
          //     Text(
          //       widget.data.description,
          //       style: TextStyle(fontSize: 16),
          //     ),
          //     SizedBox(
          //       height: 3,
          //     ),
          //     Text(
          //       widget.data.role,
          //       style: TextStyle(fontSize: 16, color: Colors.blue),
          //     ),
          //   ],
          // ),
          trailing: isApproved || isDeclined == true
              ? Chip(
                  label: isApproved == true
                      ? const Text("Approved")
                      : const Text("Declined"),
                  backgroundColor:
                      isApproved == true ? Colors.green : Colors.red,
                  labelStyle: const TextStyle(color: Colors.white),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () async {
                          var data = {
                            "name": firstname(widget.data.name),
                            "lastName": firstname(widget.data.name),
                            "usersType": 4,
                            "id": widget.data.userid
                          };
                          try {
                            var response = await Api()
                                .put(MyConfig.getuserdetailsURL, data: data);
                            print("upload: ${response.statusCode}");
                            if (response.statusCode == 200) {
                              Fluttertoast.showToast(
                                  msg: "User Updated Successfully");
                            } else {}
                          } catch (e) {
                            print("Helloi: $e");
                          }

                          deleteRequest(widget.data.id).then((value) => {
                                if (value == 200)
                                  {
                                    setState(() {
                                      isApproved = true;
                                    })
                                  }
                              });
                        },
                        icon: const CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        )),
                    IconButton(
                        onPressed: () {
                          // Fluttertoast.showToast(msg: "Declined");
                          deleteRequest(widget.data.id).then((value) => {
                                if (value == 200)
                                  {
                                    setState(() {
                                      isDeclined = true;
                                    })
                                  }
                              });
                        },
                        icon: const CircleAvatar(
                          backgroundColor: Colors.red,
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        )),
                  ],
                )),
    );
  }
}

firstname(String str) {
  return str.split(" ")[0];
}

lastname(String str) {
  return str.split(" ")[1];
}
