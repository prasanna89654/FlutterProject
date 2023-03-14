// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:project/Riverpod/constants.dart';
import 'package:project/Routes/navigator.dart';
import 'package:project/view/PublicView/EventsPage.dart';
import 'package:project/view/PublicView/appbar.dart';
import 'package:project/view/PublicView/guideliness.dart';
import 'package:project/view/PublicView/mycomplaintspage.dart/complaintspage.dart';
import 'package:project/view/PublicView/publicComplaints.dart';

import '../Riverpod/Repository/complaintController.dart';
import '../view/PublicView/login.dart';

class sidebar extends ConsumerStatefulWidget {
  const sidebar({super.key});

  @override
  ConsumerState<sidebar> createState() => _sidebarState();
}

class _sidebarState extends ConsumerState<sidebar> {
  @override
  Widget build(BuildContext context) {
    final details = ref.watch(getuserProvider);

    return Drawer(
      child: details.when(
        data: (data) => ListView(
          // Remove padding
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                data!.name,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              accountEmail: Text(
                data.emailAddress,
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  data.name[0].toUpperCase() + data.surname[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // backgroundImage: const AssetImage(
                //   'assets/images/nopic.png',
                // ),
              ),
              decoration: const BoxDecoration(
                // color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/sliderimg.png')),
              ),
            ),
            ListTile(
                leading: const Icon(Icons.history),
                title: const Text('My Complaints'),
                onTap: () => {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => ComplaintsPage()))
                    }),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Public Complaints'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PublicComplaints(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Nearby Programs'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventsPage(),
                    ));
              },
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
                leading: const Icon(Icons.contact_page),
                title: const Text('Guideliness'),
                onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Guidepage(),
                          ))
                    }),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {},
            ),
            const Divider(
              thickness: 1,
            ),
            ListTile(
                title: const Text('Logout'),
                leading: const Icon(Icons.exit_to_app),
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Logout'),
                      content: const Text('Are you sure to logout?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('CANCEL'),
                        ),
                        TextButton(
                          onPressed: () async {
                            await setValue(accessToken, "");
                            await setValue(userType, "");
                            AppNavigatorService.pushNamedAndRemoveUntil(
                                'login');
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                    context: context,
                  );
                }),
          ],
        ),
        error: (Object error, StackTrace? stackTrace) {},
        loading: () {},
      ),
    );
  }
}
