import 'package:flutter/material.dart';

import 'package:job_portal/utils/job_list.dart';
import 'package:job_portal/list_item/applications_card.dart';

class ApplicationsPage extends StatefulWidget{
  @override
  _ApplicationsPageState createState() => _ApplicationsPageState();
}

class _ApplicationsPageState extends State<ApplicationsPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Applications', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
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
                return ApplicationsCard(
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