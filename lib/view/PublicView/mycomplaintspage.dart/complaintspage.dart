import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:project/view/PublicView/mycomplaintspage.dart/holdpage.dart';
import 'package:project/view/PublicView/mycomplaintspage.dart/pendingpage.dart';
import 'package:project/view/PublicView/mycomplaintspage.dart/solvedpage.dart';

import '../../../Riverpod/Repository/complaintController.dart';

class ComplaintsPage extends ConsumerStatefulWidget {
  const ComplaintsPage({super.key});

  @override
  ConsumerState<ComplaintsPage> createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends ConsumerState<ComplaintsPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    ref.refresh(getallComplaintProvider);
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Material(
          color: Colors.blue,
          child: TabBar(
            controller: tabController,
            indicatorColor: Colors.white,
            labelStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16
                    // color: Colors.black,
                    ),
            labelColor: Colors.white,
            tabs: const [
              Tab(
                text: "Pending",
              ),
              Tab(text: "Hold"),
              Tab(text: "Solved")
            ],
          ),
        ),
        Expanded(
          child: TabBarView(controller: tabController, children: const [
            PendingComplaints(),
            HoldComplaints(),
            SolvedComplaints()
          ]),
        ),
      ]),
    );
  }
}
