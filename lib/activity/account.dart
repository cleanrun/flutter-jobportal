import 'package:flutter/material.dart';

import 'package:job_portal/widgets/custom_widgets.dart';
import 'package:job_portal/utils/routes.dart';

class AccountPage extends StatefulWidget{
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Your Account',
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
        padding: EdgeInsets.fromLTRB(15, 5, 15, 0),
        child: ListView(
          children: <Widget>[

            SizedBox(height: 20),

            accountHeader(),

            SizedBox(height: 10),

            actionButtons(),

            SizedBox(height: 10),

            options(),

            SizedBox(height: 30),

            Center(
              child: Text(
                '© Job Portal 2020   v: 18392',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  color: Colors.blueGrey
                ),
              ),
            ),

            SizedBox(height: 20),

          ],
        ),
      )
    );
  }

  Widget accountHeader(){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
              backgroundColor: Colors.transparent,
            ),

            SizedBox(height: 20),

            Column(
              children: <Widget>[
                Text(
                  "Muhammad Marchell",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 25,
                      color: Colors.blueGrey
                  ),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 5),

                Text(
                  "marchellehcram@gmail.com",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      color: Colors.blueGrey
                  ),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),

          ],
        ),
      )
    );
  }

  Widget actionButtons(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 10,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
      child: Wrap(
        direction: Axis.horizontal,
        alignment: WrapAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 3.5,
            child: FlatButton( // Save Button
              onPressed: () {
                //showToast("Edit", context);
                Navigator.pushNamed(context, Routes.editProfile);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.edit, color: Colors.blueGrey),
                  SizedBox(width: 3),
                  Text("Edit", style: TextStyle(color: Colors.blueGrey, fontFamily: 'Montserrat'))
                ],
              ),
            ),
          ),

          SizedBox(width: 20),

          Container(
            width: MediaQuery.of(context).size.width / 3.5,
            child: FlatButton( // Apply Button
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                //showToast("Apply", context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Other", style: TextStyle(fontFamily: 'Montserrat'))
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget options(){
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Saved', style: TextStyle(fontFamily: 'Montserrat'),),
            onTap: () {
              //showToast("Saved", context);
              Navigator.pushNamed(context, Routes.saved);
            },
          ),

          ListTile(
            leading: Icon(Icons.folder),
            title: Text('Applications', style: TextStyle(fontFamily: 'Montserrat'),),
            onTap: () {
              //showToast("Applications", context);
              Navigator.pushNamed(context, Routes.applications);
            },
          ),

          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages', style: TextStyle(fontFamily: 'Montserrat'),),
            onTap: () {
              //showToast("Messages", context);
              Navigator.pushNamed(context, Routes.messages);
            },
          ),

          Divider(),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings', style: TextStyle(fontFamily: 'Montserrat'),),
            onTap: () {
              //showToast("Settings", context);
              Navigator.pushNamed(context, Routes.settings);
            },
          ),

          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Log out', style: TextStyle(fontFamily: 'Montserrat'),),
            onTap: () {
              showToast("Log out", context);
            },
          ),

          ListTile(
            leading: Icon(Icons.info),
            title: Text('About', style: TextStyle(fontFamily: 'Montserrat'),),
            onTap: () {
              showToast("About", context);
            },
          ),

          Divider(),

        ],
      ),
    );
  }
}