import 'package:exam_tasks/pages/desktopMode.dart';
import 'package:exam_tasks/pages/mobileMode.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static final String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {

    if (MediaQuery.of(context).size.width >= 600)
      return DesktopMode();
    else return MobilePage();

  }

}
