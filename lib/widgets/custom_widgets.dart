import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void showToast(String message, BuildContext context){
  Toast.show(message, context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
}

// Navigation Drawer for Home Page
class HomeDrawer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    // Header info of the account
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('User Name'),
      accountEmail: Text('user@example.com'),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 42.0),
        backgroundColor: Colors.white,
      ),
    );

    // Menu items of the drawer
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Account', style: TextStyle(fontFamily: 'Montserrat'),),
          onTap: () {
            showToast("Account", context);
          },
        ),
        ListTile(
          leading: Icon(Icons.favorite),
          title: Text('Saved', style: TextStyle(fontFamily: 'Montserrat'),),
          onTap: () {
            showToast("Saved", context);
          },
        ),
        ListTile(
          leading: Icon(Icons.folder),
          title: Text('Applications', style: TextStyle(fontFamily: 'Montserrat'),),
          onTap: () {
            showToast("Applications", context);
          },
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notifications', style: TextStyle(fontFamily: 'Montserrat'),),
          onTap: () {
            showToast("Notifications", context);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings', style: TextStyle(fontFamily: 'Montserrat'),),
          onTap: () {
            showToast("Settings", context);
          },
        ),
        ListTile(
          leading: Icon(Icons.help_outline),
          title: Text('About', style: TextStyle(fontFamily: 'Montserrat'),),
          onTap: () {
            showToast("About", context);
          },
        ),
      ],
    );

    return Drawer(
      child: drawerItems,
    );
  }

}