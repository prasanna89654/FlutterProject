import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:project/view/MaintainerView/MaintainerRolesPage.dart';
import 'package:project/view/MaintainerView/maintainerComplaintStatus.dart';

import '../../Riverpod/constants.dart';
import '../../Routes/navigator.dart';
import '../AdminView/AdminComplaints/AdminComplaintPage.dart';
import '../AdminView/AdminHomePage.dart';
import '../AdminView/ComplaintsSatuspage.dart';
import '../AdminView/Rolespage.dart';

class MaintainerDashboard extends ConsumerStatefulWidget {
  const MaintainerDashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MaintainerDashboardState();
}

class _MaintainerDashboardState extends ConsumerState<MaintainerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maintainer Home Page'),
      ),
      body:

          //make gridview of four cards
          Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              childAspectRatio: 1.2,
              children: [
                cardmaker(Icons.person, "Manage Roles", Colors.blue,
                    MaintainerRolesPage(), context),
                cardmaker(Icons.subject, "View all complaints", Colors.green,
                    AdminComplaintsPage(), context),

                cardmaker(Icons.track_changes, "Complaints Status", Colors.blue,
                    MaintainerStatus(), context),
                // cardmaker(Icons.person, "Manage Roles", Colors.blue),
                InkWell(
                  onTap: () async {
                    await setValue(accessToken, "");
                    await setValue(userType, "");
                    AppNavigatorService.pushNamedAndRemoveUntil('login');
                  },
                  child: Card(
                    elevation: 5,
                    color: Colors.blue.shade200,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.logout,
                              size: 40,
                              color: Colors.red.shade300,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'logout',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
