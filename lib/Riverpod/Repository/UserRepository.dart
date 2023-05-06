import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:project/Riverpod/Models/userModel.dart';
import 'package:project/Riverpod/constants.dart';
// import 'package:nb_utils/nb_utils.dart';

import '../../Routes/navigator.dart';
import '../baseDIo.dart';
import '../config.dart';

class UserRepository {
  Future<LoginModel?> logIn(
      String username, String password, BuildContext context) async {
    var data = {"userNameOrEmailAddress": username, "password": password};

    try {
      var response = await Api().post(MyConfig.loginURL, data: data);
      print("Heloi: ${response.statusCode}");
      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Row(
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 40,
                  ),
                  Text("Loading...")
                ],
              ),
            );
          },
        );
        var token = json.decode(response.data)['result']['accessToken'];
        var type = json.decode(response.data)['result']['userType'];
        print(type);

        print(token);
        await setValue(accessToken, token);
        await setValue(userType, type);
        Navigator.pop(context);
        if (type == "Admin") {
          await AppNavigatorService.pushNamedAndRemoveUntil("admin");
        } else if (type == "User") {
          await AppNavigatorService.pushNamedAndRemoveUntil("appbar");
        } else {
          await AppNavigatorService.pushNamedAndRemoveUntil("maintainer");
        }
      }
      await AppNavigatorService.pushNamedAndRemoveUntil("login");
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  Future<List<RequestModel>> getRequests() async {
    final url = "/maintainer/getRequest";
    final response = await Api().get(MyConfig.nodeUrl + url);

    if (response.statusCode == 200) {
      // Map<String, dynamic> map =
      List<dynamic> data = json.decode(response.data);

      return data.map((data) => RequestModel.fromJson(data)).toList();
    } else {
      List<RequestModel> a = [];
      return a;
    }
  }

  Future<List<TryModel>> getTry() async {
    final url = "/maintainer/getFile";
    final response = await Api().get(MyConfig.nodeUrl + url);

    if (response.statusCode == 200) {
      // Map<String, dynamic> map =
      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"];

      return data.map((data) => TryModel.fromJson(data)).toList();
    } else {
      List<TryModel> a = [];
      return a;
    }
  }

  Future<List<UserDetailsModel>> getAllUsers() async {
    final url = "/api/services/app/Complaint/GetAllUsers";
    final response = await Api().get(MyConfig.appUrl + url);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.data);
      List<dynamic> data = map["result"];

      return data.map((data) => UserDetailsModel.fromJson(data)).toList();
    } else {
      List<UserDetailsModel> a = [];
      return a;
    }
  }
}

final userapiProvider = Provider<UserRepository>((ref) => UserRepository());
final getallRequestsProvider =
    FutureProvider.autoDispose<List<RequestModel>>((ref) async {
  return ref.read(userapiProvider).getRequests();
});

final getallUsers =
    FutureProvider.autoDispose<List<UserDetailsModel>>((ref) async {
  return ref.read(userapiProvider).getAllUsers();
});
final getallTry = FutureProvider.autoDispose<List<TryModel>>((ref) async {
  return ref.read(userapiProvider).getTry();
});
