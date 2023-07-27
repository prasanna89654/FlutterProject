import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:project/view/AdminView/AdminHomePage.dart';
import 'package:project/view/MaintainerView/MaintainerDashboard.dart';
import 'package:project/view/PublicView/EventsPage.dart';
import 'package:project/view/PublicView/appbar.dart';
import 'package:project/view/PublicView/login.dart';

class Routes {
  static FluroRouter getRouter() {
    final router = FluroRouter();

    router.define('appbar',
        handler: Handler(
            handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
                Appbar(
                  cindex: 0,
                )));
    router.define('login',
        handler: Handler(
            handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
                LoginScreen()));

    // router.define('admin',
    //     handler: Handler(
    //         handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
    //             AdminHomePage()));
    // router.define('maintainer',
    //     handler: Handler(
    //         handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
    //             MaintainerDashboard()));
    // router.define('eventspage',
    //     handler: Handler(
    //         handlerFunc: (BuildContext? context, Map<String, dynamic> params) =>
    //             EventsPage()));

    return router;
  }
}
