import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:job_portal/widgets/custom_widgets.dart';

class OtherJobsCard extends StatefulWidget{
  final String img;
  final String name;
  final String company;

  @override
  _OtherJobsCardState createState() => _OtherJobsCardState();

  OtherJobsCard({Key key, @required this.img, @required this.name, @required this.company}) : super(key: key);
}

class _OtherJobsCardState extends State<OtherJobsCard>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showToast("Job Toast", context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: 150,
        child: Card(
          child: Wrap(
            direction: Axis.vertical,
            children: <Widget>[
              Image.asset( // Company Logo / Picture
                'assets/it_software.jpg',
                width: MediaQuery.of(context).size.width * 0.3,
                height: 60,
                fit: BoxFit.cover,
              ),

              SizedBox(height: 5),

              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                padding: EdgeInsets.only(left: 3, right: 1),
                child: Text(
                  'Mobile Developer',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 12,
                      color: Colors.blueGrey
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),


              SizedBox(height: 3),

              Container(
                width: MediaQuery.of(context).size.width * 0.3,
                padding: EdgeInsets.only(left: 3, right: 1),
                child: Text(
                  'Google Inc.',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 10,
                      color: Colors.blue
                  ),
                  maxLines: 1,
                ),
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: Text('Test'),
              ),

            ],
          ),
        ),
      ),
    );
  }

}