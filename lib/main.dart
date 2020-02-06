import 'package:flutter/material.dart';

import 'package:job_portal/activity/home.dart';
import 'package:job_portal/utils/routes.dart';

void main() => runApp(MainApp());

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.getRoutes(),
      home: HomePage(),
    );
  }
}