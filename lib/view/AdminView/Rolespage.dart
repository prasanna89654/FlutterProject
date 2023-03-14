import 'package:flutter/material.dart';
import 'package:project/view/AdminView/approvepage.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({super.key});

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Roles"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Approvepage(),
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
                      onPressed: () {},
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
                itemCount: 5,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 20,
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
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
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                      contentPadding: EdgeInsets.zero,
                      title: Text("Prasanna ${index}"),
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
