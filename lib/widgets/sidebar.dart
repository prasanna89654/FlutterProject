import 'package:flutter/material.dart';
import 'package:project/view/home.dart';
import 'package:project/view/login.dart';

class sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Example'),
            accountEmail: Text('example@gmail.com'),
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
            decoration: BoxDecoration(
              // color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
              leading: Icon(Icons.history),
              title: Text('Complaint History'),
              onTap: () => {}),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Public Complaints'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.event),
            title: Text('Nearby Programs'),
            onTap: () => null,
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.contact_page),
            title: Text('About Us'),
            onTap: () => null,
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('Logout'),
                    content: Text('Are you sure to logout?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('CANCEL'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Text('OK'),
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
