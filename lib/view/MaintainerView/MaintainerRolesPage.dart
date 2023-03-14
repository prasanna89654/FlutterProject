import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MaintainerRolesPage extends ConsumerStatefulWidget {
  const MaintainerRolesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MaintainerRolesPageState();
}

class _MaintainerRolesPageState extends ConsumerState<MaintainerRolesPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Roles"),
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
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.send,
                                                      color: Colors.blue,
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.04,
                                                    ),
                                                    const Text(
                                                      "Request to Admin",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
