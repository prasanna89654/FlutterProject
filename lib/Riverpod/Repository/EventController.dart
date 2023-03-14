import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project/Riverpod/Models/userModel.dart';

import '../baseDIo.dart';
import '../config.dart';

class EventRepo {
  Future<List<EventModel>> getEvents() async {
    final response = await Api().get(MyConfig.geteventsURL);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"]["items"];

      return data.map((data) => EventModel.fromJson(data)).toList();
    } else {
      List<EventModel> a = [];
      return a;
    }
  }

  Future deleteEvents(String id) async {
    try {
      String getresultdetails = "/api/services/app/Event/Delete?Id=$id";
      final response = await Api().delete(MyConfig.appUrl + getresultdetails);
      return response.statusCode;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}

final eventsProvider = Provider<EventRepo>((ref) => EventRepo());
final getalleventsProvider =
    FutureProvider.autoDispose<List<EventModel>>((ref) async {
  return ref.read(eventsProvider).getEvents();
});
