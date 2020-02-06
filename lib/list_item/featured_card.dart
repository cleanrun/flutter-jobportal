import 'package:flutter/material.dart';
import 'package:job_portal/activity/job_detail.dart';

import 'package:job_portal/models/beer.dart';
import 'package:job_portal/utils/route_arguments.dart';
import 'package:job_portal/widgets/custom_widgets.dart';
import 'package:job_portal/utils/routes.dart';

class FeaturedCard extends StatefulWidget{
  //final String img;
  //final String name;
  //final String desc;
  //final String salary;

  final Beer beer;

  @override
  _FeaturedCardState createState() => _FeaturedCardState();

  FeaturedCard({Key key, @required this.beer})
      : super(key: key);
}

class _FeaturedCardState extends State<FeaturedCard>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //showToast(widget.name, context);
        //Navigator.pushNamed(context, Routes.jobDetail, arguments: JobDetailArguments(widget.beer.id));
        Navigator.push(context,
          MaterialPageRoute(
            builder: (_) => JobDetailPage(
              id: widget.beer.id,
            )
        ));
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
                    //backgroundImage: AssetImage(widget.img),
                    backgroundImage: NetworkImage(widget.beer.image_url),
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
                          widget.beer.name,
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
                            widget.beer.id.toString(),
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
                          widget.beer.tagline,
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