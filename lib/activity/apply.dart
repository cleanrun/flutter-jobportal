import 'package:flutter/material.dart';

import 'package:job_portal/utils/jobdesc_list.dart';
import 'package:job_portal/utils/routes.dart';
import 'package:job_portal/widgets/custom_widgets.dart';

class ApplyPage extends StatefulWidget{
  @override
  _ApplyPageState createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: ListView(
        children: <Widget>[

          jobHeading(),

          SizedBox(height: 10),

          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/codex_logo.png'),
              backgroundColor: Colors.transparent,
            ),
          ),

          SizedBox(height: 10),

          personalInfo(),

          SizedBox(height: 10),

          jobForm(),

          SizedBox(height: 10),

          apply(),

          SizedBox(height: 30)

        ],
      ),
    );
  }

  Widget jobHeading(){
    return Center(
      child: Container(
          padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
          width: MediaQuery.of(context).size.width * 0.9,
          child: Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            children: <Widget>[
              Text(
                'You are about to apply to ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  //fontWeight: FontWeight.w600
                ),
              ),

              Text(
                'Codex by Telkom Indonesia',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),

              Text(
                ' as ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  //fontWeight: FontWeight.w600
                ),
              ),

              Text(
                'Mobile Developer',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
            ],
          )
      ),
    );
  }

  Widget personalInfo(){
    return Container(
        padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
        child: Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.max, // Row with MainAxisSize.max means (w, h) => (match_parent, wrap_content)
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Wrap(
                          direction: Axis.vertical,
                          children: <Widget>[
                            Text(
                              "Personal Info",
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600
                              ),
                              textAlign: TextAlign.start,
                            ),

                            SizedBox(height: 20),

                            Container(
                              //alignment:Alignment.center,
                              //padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
                              child: Wrap(
                                direction: Axis.horizontal,
                                children: <Widget>[

                                  Container( // Company Logo
                                    child: Image.asset(
                                      'assets/profile_picture.jpg',
                                      width: MediaQuery.of(context).size.height / 8,
                                      height: MediaQuery.of(context).size.height / 8,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  SizedBox(width: 10),

                                  Wrap(
                                    alignment: WrapAlignment.center,
                                    direction: Axis.vertical,
                                    children: <Widget>[

                                      SizedBox(
                                        width: MediaQuery.of(context).size.width / 1.7,
                                        child: Text( // Job Name
                                          "Muhammad Marchell",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 20,
                                              color: Colors.blueGrey
                                          ),
                                          maxLines: 1,
                                          softWrap: false,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      SizedBox(height: 5),

                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: <Widget>[
                                          Icon(Icons.location_on, size: 14),

                                          SizedBox(width: 5),

                                          SizedBox( // Company Name
                                            width: MediaQuery.of(context).size.width / 1.7,
                                            child: Text(
                                              "Bandung, Indonesia",
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 13,
                                                  color: Colors.black
                                              ),
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 10),

                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: <Widget>[
                                          Icon(Icons.email, size: 14),

                                          SizedBox(width: 5),

                                          SizedBox( // Company Name
                                            width: MediaQuery.of(context).size.width / 1.7,
                                            child: Text(
                                              "marchellehcram@gmail.com",
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 13,
                                                  color: Colors.black
                                              ),
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 10),

                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: <Widget>[
                                          Icon(Icons.phone, size: 14),

                                          SizedBox(width: 5),

                                          SizedBox( // Company Name
                                            width: MediaQuery.of(context).size.width / 1.7,
                                            child: Text(
                                              "+6283820862695",
                                              style: TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 13,
                                                  color: Colors.black
                                              ),
                                              maxLines: 1,
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),

                                    ],
                                  )
                                ],
                              ),
                            ),

                            Divider(),
                          ],
                        ),

                        FlatButton(
                          onPressed: () {
                            //showToast("Edit Info", context);
                            Navigator.pushNamed(context, Routes.editProfile);
                          },
                          child: Text(
                            "Edit Info",
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontFamily: 'Montserrat'
                            ),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
              ),
            )
        )
    );
  }

  Widget jobForm(){
    return Container(
        padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
        child: Card(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.all(10),
                child:  Row(
                  mainAxisSize: MainAxisSize.max, // Row with MainAxisSize.max means (w, h) => (match_parent, wrap_content)
                  children: <Widget>[
                    Wrap(
                      direction: Axis.vertical,
                      children: <Widget>[
                        Text(
                          "Resume",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          ),
                        ),

                        SizedBox(height: 50),

                        Text(
                          "Cover Letter",
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                          ),
                        ),

                        SizedBox(height: 50),

                      ],
                    )

                  ],
                ),
              ),
            )
        )
    );
  }

  Widget apply(){
    return Container(
      width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height / 10,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
        child: FlatButton( // Apply Button
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            showToast("Apply", context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Apply", style: TextStyle(fontFamily: 'Montserrat'))
            ],
          ),
        ),
    );
  }
}