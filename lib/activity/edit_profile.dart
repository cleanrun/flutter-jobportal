import 'package:flutter/material.dart';

import 'package:job_portal/widgets/custom_widgets.dart';

class EditProfilePage extends StatefulWidget{
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
        ),
      ),
      body: ListView(
        children: <Widget>[
          photoChange(),

          SizedBox(height: 5),

          forms(),

          saveChanges(),

          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget photoChange(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: ClipRRect(
        child: Stack(
          children: <Widget>[

            Image.asset(
              'assets/profile_picture.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.cover,
            ),

            Container(
              decoration: BoxDecoration(
                  gradient:LinearGradient(
                      begin:Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.2, 0.7],
                      colors: [
                        Color.fromARGB(100, 0, 0, 0),
                        Color.fromARGB(100, 0, 0, 0),
                      ]
                  )
              ),
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
            ),

            Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(1),
                constraints: BoxConstraints(
                  minWidth: 40,
                  minHeight: 40,
                ),
                child: Center(
                  child: FlatButton(
                    child: Text(
                      'Change Photo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {
                      showToast('Change Photo', context);
                    },
                  )
                ),
              ),

            ),
          ],
        ),
      )
    );
  }

  Widget forms(){
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Personal Info",
            style: TextStyle(
                color: Colors.blueGrey,
                fontFamily: 'Montserrat',
                fontSize: 25,
                fontWeight: FontWeight.w600
            ),
          ),

          TextField( // Name Text Field
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.grey),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            ),
          ),

          SizedBox(height: 10),

          TextField( // Email Text Field
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.grey),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            ),
          ),

          SizedBox(height: 10),

          TextField( // Phone Text Field
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Phone Number',
              labelStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.grey),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
            ),
          ),

          SizedBox(height: 15),

          Divider(),

          Text(
            "Resume",
            style: TextStyle(
                color: Colors.blueGrey,
                fontFamily: 'Montserrat',
                fontSize: 25,
                fontWeight: FontWeight.w600
            ),
          ),

          SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget saveChanges(){
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
      child: FlatButton( // Apply Button
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: () {
          showToast("Save Changes", context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Save Changes", style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }

}