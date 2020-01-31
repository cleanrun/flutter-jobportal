import 'package:flutter/material.dart';
import 'package:job_portal/activity/home.dart';

import 'package:job_portal/activity/login.dart';
import 'package:job_portal/activity/sign_up.dart';
import 'package:job_portal/activity/job_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/loginpage': (BuildContext context) => LoginPage(),
        '/signuppage': (BuildContext context) => SignUpPage(),
        '/homepage': (BuildContext context) => HomePage(),
        '/jobdetailpage': (BuildContext context) => JobDetailPage(),
      },
      home: HomePage(),
    );
  }

}
