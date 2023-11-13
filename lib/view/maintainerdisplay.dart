import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:project/Riverpod/Repository/UserRepository.dart';
import '../widgets/practice.dart';

class DemoDisplayPage extends ConsumerStatefulWidget {
  const DemoDisplayPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => DemoDisplayPageState();
}

class DemoDisplayPageState extends ConsumerState<DemoDisplayPage> {
  bool isApproved = false;
  bool isDeclined = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final details = ref.watch(getallRequestsProvider);
    return Scaffold(
        appBar: AppBar(
          title: Text("All Requests"),
        ),
        body: details.when(
          data: (data) => RefreshIndicator(
              onRefresh: () => Future.sync(() {
                    ref.refresh(getallRequestsProvider);
                  }),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.grey,
                  );
                },
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return MyListItem(data: data[index]);
                },
              )),
          error: (Object error, StackTrace? stackTrace) {
            return Center(
              child: Text(error.toString()),
            );
          },
          loading: () {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
