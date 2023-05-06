import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:project/Riverpod/Models/userModel.dart';
import 'package:project/view/AdminView/approvepage.dart';

import '../../Riverpod/Repository/UserRepository.dart';
import '../../Riverpod/baseDIo.dart';
import '../../Riverpod/config.dart';

class RolesPage extends ConsumerStatefulWidget {
  const RolesPage({super.key});

  @override
  ConsumerState<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends ConsumerState<RolesPage> {
  List<UserDetailsModel> maintainers = [];
  List<UserDetailsModel> users = [];
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final details = ref.watch(getallUsers);
    details.when(
      data: (data) {
        final daw = data.where((element) => element.usersType == 6).toList();
        final ffd = daw
            .where((element) => element.name
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
            .toList();
        setState(() {
          maintainers =
              data.where((element) => element.usersType != 6).toList();
          users = ffd;
        });
      },
      loading: () {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
      error: (error, stack) {
        return Center(
          child: Text(error.toString()),
        );
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Roles"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DemoDisplayPage(),
                  ));
            },
            icon: const Icon(
              Icons.person_add,
              size: 26,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          maintainers = maintainers
                              .where((element) =>
                                  element.name
                                      .toLowerCase()
                                      .contains(searchController.text) ||
                                  element.lastName
                                      .toLowerCase()
                                      .contains(searchController.text))
                              .toList();
                        });
                      },
                      icon: const Icon(
                        Icons.search,
                        size: 28,
                      ))
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Text("Maintainers",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 5,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                ),
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: maintainers.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 20,
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                      title: Text(
                          "${maintainers[index].name} ${maintainers[index].lastName}"),
                      subtitle: Text(maintainers[index].usersType == 1
                          ? "Health Maintainer"
                          : index == 2
                              ? "Water Maintainer"
                              : index == 3
                                  ? "Water Maintainer"
                                  : index == 4
                                      ? "Road Maintainer"
                                      : index == 5
                                          ? "Education Maintainer"
                                          : "Water Maintainer"),
                      trailing: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                context: context,
                                builder: (context) {
                                  return Wrap(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.02,
                                            vertical: height * 0.02),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextButton(
                                                onPressed: () async {
                                                  var data = {
                                                    "name":
                                                        maintainers[index].name,
                                                    "lastName":
                                                        maintainers[index]
                                                            .lastName,
                                                    "usersType": 6,
                                                    "id": maintainers[index].id
                                                  };
                                                  try {
                                                    var response = await Api().put(
                                                        MyConfig
                                                            .getuserdetailsURL,
                                                        data: data);
                                                    print(
                                                        "upload: ${response.statusCode}");
                                                    if (response.statusCode ==
                                                        200) {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "User Updated Successfully");
                                                    } else {}
                                                  } catch (e) {
                                                    print("Helloi: $e");
                                                  }
                                                  ref.refresh(getallUsers);
                                                  Navigator.pop(context);
                                                },
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.04,
                                                    ),
                                                    const Text(
                                                      "Remove from Maintainer",
                                                      style: TextStyle(
                                                        color: Colors.black87,
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
                            size: 25,
                          )));
                },
              ),
              SizedBox(
                height: 30,
              ),
              Text("Users",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              SizedBox(
                height: 10,
              ),
              ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                ),
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: users.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                      contentPadding: EdgeInsets.zero,
                      title:
                          Text("${users[index].name} ${users[index].lastName}"),
                      trailing: IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                                context: context,
                                builder: (context) {
                                  return Wrap(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.02,
                                            vertical: height * 0.02),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextButton(
                                                onPressed: () async {
                                                  var data = {
                                                    "name": users[index].name,
                                                    "lastName":
                                                        users[index].lastName,
                                                    "usersType": 2,
                                                    "id": users[index].id
                                                  };
                                                  try {
                                                    var response = await Api().put(
                                                        MyConfig
                                                            .getuserdetailsURL,
                                                        data: data);
                                                    print(
                                                        "upload: ${response.statusCode}");
                                                    if (response.statusCode ==
                                                        200) {
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "User Updated Successfully");
                                                    } else {}
                                                  } catch (e) {
                                                    print("Helloi: $e");
                                                  }
                                                  ref.refresh(getallUsers);
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "Water Maintainer",
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                  ),
                                                )),
                                            TextButton(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "Road Maintainer",
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                  ),
                                                )),
                                            TextButton(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "Electricity Maintainer",
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                  ),
                                                )),
                                            TextButton(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "Health Maintainer",
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                  ),
                                                )),
                                            TextButton(
                                                onPressed: () async {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  "Education Maintainer",
                                                  style: TextStyle(
                                                    color: Colors.black87,
                                                  ),
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
                            size: 25,
                          )));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
