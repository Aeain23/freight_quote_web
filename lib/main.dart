import 'dart:async';
import 'dart:convert';
import 'package:FreightQuote/constants/utilizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:FreightQuote/constants/style.dart';
import 'package:FreightQuote/helpers/connecitivity_util.dart';
import 'package:FreightQuote/widgets/correspondence_screen.dart';
import 'package:FreightQuote/widgets/dashboard_screen.dart';
import 'package:FreightQuote/widgets/freight_charge_screen.dart';
import 'package:FreightQuote/widgets/login_screen.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  bool isInternetConnected = false;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late Map<String, dynamic> users = {};
  @override
  void initState() {
    initialConnectivity();
    getProfile();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  getProfile() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = pref.getString('users');
    users = data != null ? Map<String, dynamic>.from(jsonDecode(data)) : {};
  }

  // Platform messages are asynchronous, so we initialize in an async method.

  Future<void> initialConnectivity() async {
    ConnectivityResult connectionStatus;
    try {
      connectionStatus = await _connectivity.checkConnectivity();
      if (connectionStatus == ConnectivityResult.none) {
        setState(() {
          isInternetConnected = false;
        });
      } else {
        var result = await ConnectivityUtil.pingSucced();
        if (result) {
          setState(() {
            isInternetConnected = true;
          });
        } else {
          setState(() {
            isInternetConnected = false;
          });
        }
      }
    } on PlatformException catch (e) {
      print(e.toString());
    }
    if (!mounted) {
      return;
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freight Quotation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: primaryColor,
        textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        // primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        DashboardScreen.routeName: (BuildContext context) =>
            DashboardScreen(username: '', password: '', email: ''),
        LoginScreen.routeName: (context) => LoginScreen(),
        FreightChargeScreen.routeName: (context) => FreightChargeScreen(),
        CorrespondenceScreen.routeName: (context) => CorrespondenceScreen()
      },
      home: login == true
          ? DashboardScreen(
              username: users[0],
              password: users[1],
              email: users[3],
            )
          : LoginScreen(),
    );
  }
}
