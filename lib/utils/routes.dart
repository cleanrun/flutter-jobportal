import 'package:flutter/material.dart';

import 'package:job_portal/activity/account.dart';
import 'package:job_portal/activity/applications.dart';
import 'package:job_portal/activity/apply.dart';
import 'package:job_portal/activity/categories.dart';
import 'package:job_portal/activity/company_profile.dart';
import 'package:job_portal/activity/home.dart';
import 'package:job_portal/activity/job_detail.dart';
import 'package:job_portal/activity/login.dart';
import 'package:job_portal/activity/edit_profile.dart';
import 'package:job_portal/activity/messages.dart';
import 'package:job_portal/activity/saved.dart';
import 'package:job_portal/activity/settings.dart';
import 'package:job_portal/activity/sign_up.dart';

class Routes {
  // Route name constants
  static const String apply = '/applypage';
  static const String companyProfile = '/companyprofilepage';
  static const String home = '/homepage';
  static const String jobDetail = '/jobdetailpage';
  static const String login = '/loginpage';
  static const String signup = '/signuppage';
  static const String editProfile = '/profilepage';
  static const String account = '/accountpage';
  static const String saved = '/savedpage';
  static const String messages = 'messagespage';
  static const String applications = '/applicationspage';
  static const String settings = '/settingspage';
  static const String categories = '/categoriespage';

  // The map used to define our routes, need to be supplied to [MaterialApp]
  static Map<String, WidgetBuilder> getRoutes() {
   return {
     Routes.apply: (context) => ApplyPage(),
     Routes.companyProfile: (context) => CompanyProfilePage(),
     Routes.home: (context) => HomePage(),
     Routes.jobDetail: (context) => JobDetailPage(),
     Routes.login: (context) => LoginPage(),
     Routes.signup: (context) => SignUpPage(),
     Routes.editProfile: (context) => EditProfilePage(),
     Routes.account: (context) => AccountPage(),
     Routes.saved: (context) => SavedPage(),
     Routes.messages: (context) => MessagesPage(),
     Routes.applications: (context) => ApplicationsPage(),
     Routes.settings: (context) => SettingsPage(),
     Routes.categories: (context) => CategoriesPage(),
   };
  }
}