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
  Future<LoginModel?> logIn(String username, String password) async {
    var data = {"userNameOrEmailAddress": username, "password": password};

    try {
      var response = await Api().post(MyConfig.loginURL, data: data);
      print("Heloi: ${response.statusCode}");
      if (response.statusCode == 200) {
        var token = json.decode(response.data)['result']['accessToken'];
        var type = json.decode(response.data)['result']['userType'];
        print(type);

        print(token);
        await setValue(accessToken, token);
        await setValue(userType, type);
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
}

final userapiProvider = Provider<UserRepository>((ref) => UserRepository());
