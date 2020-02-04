import 'package:flutter/material.dart';

import 'package:job_portal/utils/job_list.dart';
import 'package:job_portal/list_item/company_jobs_card.dart';

class CompanyProfilePage extends StatefulWidget{
  @override
  _CompanyProfilePageState createState() => _CompanyProfilePageState();

}

class _CompanyProfilePageState extends State<CompanyProfilePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Company Profile', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      //extendBodyBehindAppBar: true,

      body: Padding(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: ListView(
          children: <Widget>[
            companyDetails(),

            jobsList(),

            Column(
              children: jobs.map((value){
                return CompanyJobsCard(
                  name: "${value["name"]}",
                );
              }).toList(),
            ),

            SizedBox(height: 30)

          ],
        ),
      )
    );
  }

  Widget companyDetails(){
    return Wrap(
      direction: Axis.vertical,
      children: <Widget>[

        Container( // Company Logo
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          child: Image.asset(
            'assets/codex_logo.png',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            fit: BoxFit.cover,
          ),
        ),

        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Wrap(
            children: <Widget>[
              Text(
                "Codex by Telkom Indonesia",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontFamily: 'Montserrat',
                    fontSize: 30,
                    fontWeight: FontWeight.w600
                ),
              ),

              SizedBox(height: 8),

              Text(
                "Digitalizing Indonesia through delivering high quality digital products",
                style: TextStyle(
                  //color: Colors.blue,
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                ),
              ),

              SizedBox(height: 8),

              Divider(),

              SizedBox(height: 8),

              Container(
                //width: MediaQuery.of(context).size.width,
                child: Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Wrap( // Location
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Icon(Icons.location_on, size: 15),
                        SizedBox(width: 5),
                        Text(
                          "Jakarta, Indonesia",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              color: Colors.blueGrey
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    Wrap( // Industry
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Icon(Icons.work, size: 15),
                        SizedBox(width: 5),
                        Text(
                          "Information Technology and Services",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              color: Colors.blueGrey
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),

                    SizedBox(height: 8),

                    Wrap( // Website
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Icon(Icons.web, size: 15),
                        SizedBox(width: 5),
                        Text(
                          "https://codex.works",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14,
                              color: Colors.blueGrey
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),

                  ],
                ),
              ),

              SizedBox(height: 8),

              Divider(),

              Container(
                child: Wrap(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Text(
                      "Overview",
                      style: TextStyle(
                          color: Colors.blueGrey,
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    ),

                    SizedBox(height: 10),

                    Container( // Overview
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Text(
                        "Codex is Telkom Indonesia’s initiative with one main goal, to deliver high quality digital product as innovation enablement, by using Lean, Agile, and Squad Framework.",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Divider(),

            ],
          ),
        )

      ],
    );
  }

  Widget jobsList(){
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Wrap(
        direction: Axis.vertical,
        children: <Widget>[
          Text(
            "Jobs",
            style: TextStyle(
                color: Colors.blueGrey,
                fontFamily: 'Montserrat',
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),
          ),

          SizedBox(height: 10),

        ],
      ),
    );
  }

}