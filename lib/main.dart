import 'package:exam_tasks/pages/desktopMode.dart';
import 'package:exam_tasks/pages/home_page.dart';
import 'package:exam_tasks/pages/mobileMode.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Force only Portrait Mode
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        MobilePage.id: (context) => MobilePage(),
        DesktopMode.id: (context) => DesktopMode()
      },
    );
  }
}
