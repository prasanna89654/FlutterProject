import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:project/Riverpod/constants.dart';
import 'package:project/controller/notificationservices.dart';
import 'package:project/view/AdminView/AdminHomePage.dart';
import 'package:project/view/MaintainerView/MaintainerDashboard.dart';
import 'package:project/view/PublicView/appbar.dart';
import 'package:project/view/PublicView/login.dart';
import 'package:project/view/maintainerdisplay.dart';
import 'package:project/view/maintainerrequest.dart';
import 'package:project/widgets/TEsts/random.dart';
import 'package:project/widgets/TEsts/randomget.dart';
import 'package:project/widgets/TEsts/sendmap.dart';
import 'package:project/widgets/test1.dart';

import 'Routes/navigator.dart';
import 'Routes/routes.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print("Token: $fcmToken");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          if (message.data['_id'] != null) {}
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
      (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        AppNavigatorService.pushNamed('eventspage');

        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final router = Routes.getRouter();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generator,
        navigatorKey: AppNavigatorService.navigatorKey,
        home: EasySplashScreen(
          durationInSeconds: 1,
          showLoader: false,
          logo: Image.asset(
            'assets/images/care.png',
            color: Colors.white,
          ),
          backgroundColor: Colors.blue.shade300,
          navigator: LoginScreen(),
        ));
  }
}

selectScreen() {
  final usertype = getStringAsync(userType);
  print(usertype);
  final token = getStringAsync(accessToken);

  if (token.isEmptyOrNull || usertype.isEmptyOrNull) {
    return const LoginScreen();
  } else if (usertype == "Admin") {
    return const AdminHomePage();
  } else if (usertype == "User") {
    return Appbar(
      cindex: 0,
    );
  } else {
    return MaintainerDashboard();
  }
}
