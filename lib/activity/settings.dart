import 'package:flutter/material.dart';
import 'package:job_portal/widgets/custom_widgets.dart';

class SettingsPage extends StatefulWidget{
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Settings',
          style: TextStyle(
              color: Colors.black54,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black54),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: ListView(
          children: <Widget>[
            notificationContents(),

            SizedBox(height: 30),

            languageContents(),

            SizedBox(height: 30),

            miscContents(),

            SizedBox(height: 20),

            Align(
              alignment: Alignment.center,
              child: Text(
                "v: 18392",
                style: TextStyle(
                    fontFamily: 'Montserrat'
                ),
              ),
            ),

            SizedBox(height: 30),

          ],
        ),
      ),
    );
  }

  Widget notificationContents(){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text( // Popular Categories TextView
              "Notifications",
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey,
                fontFamily: 'Montserrat',
              ),
            ),
          ),

          SizedBox(height: 15),

          ListTile(
            onTap: () {
              showToast("Push Notification", context);
            },
            title: Text(
              "Push Notification",
              style: TextStyle(
                fontFamily: 'Montserrat'
              ),
            ),
          ),

          Divider(),

          ListTile(
            onTap: () {
              showToast("Notification Sound", context);
            },
            title: Text(
              "Notification Sound",
              style: TextStyle(
                  fontFamily: 'Montserrat'
              ),
            ),
          ),

          Divider(),

        ],
      ),
    );
  }

  Widget languageContents(){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text( // Popular Categories TextView
              "Language",
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey,
                fontFamily: 'Montserrat',
              ),
            ),
          ),

          SizedBox(height: 15),

          ListTile(
            onTap: () {
              showToast("Change Language", context);
            },
            title: Text(
              "Change Language",
              style: TextStyle(
                  fontFamily: 'Montserrat'
              ),
            ),
          ),

          Divider(),

        ],
      ),
    );
  }

  Widget miscContents(){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text( // Popular Categories TextView
              "Miscellaneous",
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueGrey,
                fontFamily: 'Montserrat',
              ),
            ),
          ),

          SizedBox(height: 15),

          ListTile(
            onTap: () {
              showToast("Terms of Service", context);
            },
            title: Text(
              "Terms of Service",
              style: TextStyle(
                  fontFamily: 'Montserrat'
              ),
            ),
          ),

          Divider(),

          ListTile(
            onTap: () {
              showToast("Privacy Policy", context);
            },
            title: Text(
              "Privacy Policy",
              style: TextStyle(
                  fontFamily: 'Montserrat'
              ),
            ),
          ),

          Divider(),

          ListTile(
            onTap: () {
              showToast("Log Out", context);
            },
            title: Text(
              "Log Out",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.red,
              ),
            ),
          ),

        ],
      ),
    );
  }

}