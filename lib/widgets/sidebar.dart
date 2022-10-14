// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:project/view/login.dart';

class sidebar extends StatelessWidget {
  const sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Example'),
            accountEmail: const Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              // color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
              leading: const Icon(Icons.history),
              title: const Text('Complaint History'),
              onTap: () => {}),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Public Complaints'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.event),
            title: const Text('Nearby Programs'),
            onTap: () {},
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
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
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
    );
  }
}
