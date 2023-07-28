import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../Models/userModel.dart';
import '../baseDIo.dart';
import '../config.dart';

class ComplaintController {
  // Future<List<ComplaintGetAllModel>> getComplaints() async {
  //   const url = "/complaint/getAllComplaint";
  //   final response = await Api().get(MyConfig.nodeUrl + url);

  //   if (response.statusCode == 200) {
  //     List<dynamic> data = json.decode(response.data);

  //     return data.map((data) => ComplaintGetAllModel.fromJson(data)).toList();
  //   } else {
  //     List<ComplaintGetAllModel> a = [];
  //     return a;
  //   }
  // }

  Future<List<ComplaintGetAllModel>> getownComplaints() async {
    final response =
        await Api().get("${MyConfig.nodeUrl}/complaint/getOwnComplaint");

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.data);

      return data.map((data) => ComplaintGetAllModel.fromJson(data)).toList();
    } else {
      List<ComplaintGetAllModel> a = [];
      return a;
    }
  }

  Future<UserModel?> getuserdetails() async {
    try {
      String gethomeworkdetails = "/getUserProfile";
      final response = await Api().get(MyConfig.nodeUrl + gethomeworkdetails);
      if (response.statusCode == 200) {
        var value = json.decode(response.toString());

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

  Future<OwnReportModel?> ownReportDetails() async {
    try {
      String gethomeworkdetails = "/complaint/getComplaintStatus";
      final response = await Api().get(MyConfig.nodeUrl + gethomeworkdetails);
      if (response.statusCode == 200) {
        var value = json.decode(response.toString());

        var data = OwnReportModel.fromJson(value);

        return data;
      }
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
    return null;
  }
}

final complaintProvider =
    Provider<ComplaintController>((ref) => ComplaintController());
// final getallComplaintProvider =
//     FutureProvider.autoDispose<List<ComplaintGetAllModel>>((ref) async {
//   return ref.read(complaintProvider).getComplaints();
// });

final getownComplaintProvider =
    FutureProvider.autoDispose<List<ComplaintGetAllModel>>((ref) async {
  return ref.read(complaintProvider).getownComplaints();
});
final getuserProvider = FutureProvider<UserModel?>((ref) async {
  return ref.read(complaintProvider).getuserdetails();
});
final getownReportProvider = FutureProvider<OwnReportModel?>((ref) async {
  return ref.read(complaintProvider).ownReportDetails();
});
