import 'package:flutter/material.dart';

import 'package:job_portal/models/beer.dart';
import 'package:job_portal/models/job.dart';
import 'package:job_portal/repository/beer_repository.dart';
import 'package:job_portal/repository/job_repository.dart';
import 'package:job_portal/utils/route_arguments.dart';
import 'package:job_portal/widgets/custom_widgets.dart';
import 'package:job_portal/list_item/other_jobs_card.dart';
import 'package:job_portal/dummy_data/job_list.dart';
import 'package:job_portal/utils/routes.dart';

class JobDetailPage extends StatefulWidget{
  final int id;

  @override
  _JobDetailPageState createState() => _JobDetailPageState();

  JobDetailPage({Key key, @required this.id}) : super(key: key);
}

class _JobDetailPageState extends State<JobDetailPage>{
  Future<Beer> beer;
  Future<Job> job;

  JobRepository calls;

  @override
  void initState() {
    super.initState();
    calls = JobRepository();
    beer = getBeer(widget.id);
    job = calls.getJob(1); // Still using certain index, in this case : 1
  }

  Future getData() async{
    var result = await getBeer(widget.id);
  }

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
      body: FutureBuilder<Job>(
        future: job,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            if(snapshot.hasError){
              print('build: Loading error');
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.3,
                ),
              );
            }
            else{
              print(snapshot.data.company[0].company);
              print(snapshot.data.job_name);
              return contents(snapshot.data);
            }
          }
          else{
            print('build: loading the data');
            return loadingPage();
          }
        },
      ),
    );
  }

  Widget contents(Job job){
    return ListView(
      children: <Widget>[
        companyInfo(job),

        actionButtons(job),

        jobDescription(job),

        jobRequirements(job),

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
    );
  }

  Widget companyInfo(Job job){
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
                  job.job_name,
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
                      job.company[0].company,
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
                  job.category[0].name,
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

  Widget actionButtons(Job job){
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

  Widget jobDescription(Job job){
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
                      //'${description[0]["desc"]}',
                      //beer.description,
                      job.job_description,
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

  Widget jobRequirements(Job job){
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
                          job.requirements,
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

  Widget loadingPage() {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height / 2.5 ),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}