import 'package:flutter/material.dart';

import 'package:job_portal/utils/jobs.dart';
import 'package:job_portal/list_item/company_jobs_card.dart';

class SavedPage extends StatefulWidget{
  @override
  _SavedPageState createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Jobs', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: jobs.map((value){
                return CompanyJobsCard(
                  name: "${value["name"]}",
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }

}