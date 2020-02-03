import 'package:flutter/material.dart';

import 'package:job_portal/widgets/custom_widgets.dart';
import 'package:job_portal/list_item/other_jobs_card.dart';
import 'package:job_portal/utils/jobdesc.dart';
import 'package:job_portal/utils/jobs.dart';
import 'package:job_portal/utils/routes.dart';

class JobDetailPage extends StatefulWidget{

  @override
  _JobDetailPageState createState() => _JobDetailPageState();

}

class _JobDetailPageState extends State<JobDetailPage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Details', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          companyInfo(),

          actionButtons(),

          jobDescription(),

          jobRequirements(),

          companyProfile(),

          Divider(),

          otherJobs(),

          Padding( // This list won't scroll if i put it in otherJobs()
            padding: EdgeInsets.only(right: 10, left: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: jobs.map((value){
                  return OtherJobsCard(
                    img: "${value["img"]}",
                    name: "${value["name"]}",
                    company: "${value["comapany_name"]}",
                  );
                }).toList(),
              ),
            ),
          ),

          SizedBox(height: 30)
        ],
      )
    );
  }

  Widget companyInfo(){
    return Container(
      //alignment:Alignment.center,
      padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
      child: Wrap(
        direction: Axis.horizontal,
        children: <Widget>[

          Container( // Company Logo
            child: Image.asset(
              'assets/codex_logo.png',
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
                  "Mobile Developer",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
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
                  Icon(Icons.business, size: 14),

                  SizedBox(width: 5),

                  SizedBox( // Company Name
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: Text(
                      "Codex by Telkom Indonesia",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          color: Colors.blue
                      ),
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              SizedBox(
                width: MediaQuery.of(context).size.width / 1.7,
                child: Text( // Job Name
                  "IT and Software",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                  ),
                  maxLines: 1,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

            ],
          )
        ],
      ),
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
                showToast("Save", context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.favorite, color: Colors.blueGrey),
                  SizedBox(width: 3),
                  Text("Save", style: TextStyle(color: Colors.blueGrey, fontFamily: 'Montserrat'))
                ],
              ),
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width / 3.5,
            child: FlatButton( // Share Button
              onPressed: () {
                showToast("Share", context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.share, color: Colors.blueGrey),
                  SizedBox(width: 3),
                  Text("Share", style: TextStyle(color: Colors.blueGrey, fontFamily: 'Montserrat'))
                ],
              ),
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width / 3.5,
            child: FlatButton( // Apply Button
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                //showToast("Apply", context);
                Navigator.pushNamed(context, Routes.apply);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Apply", style: TextStyle(fontFamily: 'Montserrat'))
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget jobDescription(){
    return Container(
      padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child:  Row(
            mainAxisSize: MainAxisSize.max, // Row with MainAxisSize.max means (w, h) => (match_parent, wrap_content)
            children: <Widget>[
              Wrap(
                direction: Axis.vertical,
                children: <Widget>[
                  Text(
                    "Job Description",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                    ),
                  ),

                  SizedBox(height: 10),

                  Container(
                    width: MediaQuery.of(context).size.width*0.85,
                    child: Text(
                      '${description[0]["desc"]}',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                      ),
                    ),
                  ),

                  SizedBox(height: 20)
                ],
              )

            ],
          ),
        )
      )
    );
  }

  Widget jobRequirements(){
    return Container(
        padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
        child: Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child:  Row(
                mainAxisSize: MainAxisSize.max, // Row with MainAxisSize.max means (w, h) => (match_parent, wrap_content)
                children: <Widget>[
                  Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      Text(
                        "Job Requirements",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),
                      ),

                      SizedBox(height: 10),

                      Container(
                        width: MediaQuery.of(context).size.width*0.85,
                        child: Text(
                          '${description[0]["req"]}',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                          ),
                        ),
                      ),

                      SizedBox(height: 20)
                    ],
                  )

                ],
              ),
            )
        )
    );
  }

  Widget companyProfile(){
    return Container(
      width: MediaQuery.of(context).size.width,
      //height: MediaQuery.of(context).size.height / 10,
      alignment: Alignment.center,
      padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
      child: FlatButton(
        onPressed: () {
          //showToast("Company Profile", context);
          Navigator.pushNamed(context, Routes.companyProfile);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.business, color: Colors.blueGrey),
            SizedBox(width: 3),
            Text("Company Profile", style: TextStyle(color: Colors.blueGrey, fontFamily: 'Montserrat'))
          ],
        ),
      ),
    );
  }

  Widget otherJobs(){
    return Container(
      padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
      child: Wrap(
        direction: Axis.vertical,
        children: <Widget>[
          Text(
            "Other Jobs",
            style: TextStyle(
                color: Colors.blueGrey,
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),
          ),

          SizedBox(height: 10),

        ],
      )
    );
  }
}