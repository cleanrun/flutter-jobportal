import 'package:flutter/material.dart';

import 'package:job_portal/widgets/custom_widgets.dart';
import 'package:job_portal/activity/job_detail.dart';

// Used in home.dart

class FeaturedCard extends StatefulWidget{
  final String img;
  final String name;
  final String desc;
  final String salary;

  @override
  _FeaturedCardState createState() => _FeaturedCardState();

  FeaturedCard({Key key, @required this.img, @required this.name, @required this.desc, @required this.salary})
      : super(key: key);
}

class _FeaturedCardState extends State<FeaturedCard>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //showToast(widget.name, context);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context){
              return JobDetailPage();
            }
          )
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 5.0),
        child: Container(
          height: MediaQuery.of(context).size.height / 9,
          width: MediaQuery.of(context).size.width,
          child: Card(
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            //elevation: 3.0,
            child: Row(
              children: <Widget>[

                Padding( // Company Logo ImageView
                  padding: EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(widget.img),
                    backgroundColor: Colors.transparent,
                  ),
                ),

                SizedBox(width: 10),

                Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 3.0, 3.0, 3.0),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[

                      SizedBox(height: 2),

                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: Text( // Job Name TextView
                          widget.name,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                            color: Colors.blueGrey,
                          ),
                        )
                      ),

                      SizedBox(height: 3),

                      Row( // Salary TextView
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[

                          Icon(
                            Icons.attach_money,
                            size: 11,
                          ),

                          Text(
                            widget.salary,
                            style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Montserrat',
                                color: Colors.blue[300]
                            ),
                          )
                        ],
                      ),

                      SizedBox(height: 3),

                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: Text( // Job Description TextView
                          widget.desc,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}