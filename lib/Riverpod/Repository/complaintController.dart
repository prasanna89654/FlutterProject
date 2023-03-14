import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Models/userModel.dart';
import '../baseDIo.dart';
import '../config.dart';

class ComplaintController {
  Future<List<ComplaintGetAllModel>> getComplaints() async {
    final response = await Api().get(MyConfig.getcomplaintsURL);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"]["items"];

      return data.map((data) => ComplaintGetAllModel.fromJson(data)).toList();
    } else {
      List<ComplaintGetAllModel> a = [];
      return a;
    }
  }

  Future<UserModel?> getuserdetails() async {
    try {
      String gethomeworkdetails =
          "/api/services/app/Session/GetCurrentLoginInformations";
      final response = await Api().get(MyConfig.appUrl + gethomeworkdetails);
      if (response.statusCode == 200) {
        var value = json.decode(response.toString())["result"]["user"];

        var data = UserModel.fromJson(value);

        return data;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return null;
  }

  Future deleteComplaint(String id) async {
    try {
      String getresultdetails = "/api/services/app/Complaint/Delete?Id=$id";
      final response = await Api().delete(MyConfig.appUrl + getresultdetails);
      return response.statusCode;
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}

final complaintProvider =
    Provider<ComplaintController>((ref) => ComplaintController());
final getallComplaintProvider =
    FutureProvider.autoDispose<List<ComplaintGetAllModel>>((ref) async {
  return ref.read(complaintProvider).getComplaints();
});
final getuserProvider = FutureProvider<UserModel?>((ref) async {
  return ref.read(complaintProvider).getuserdetails();
});
