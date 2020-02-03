import 'package:flutter/material.dart';

import 'package:job_portal/utils/jobs.dart';

class SearchPage extends SearchDelegate<String>{
  
  final jobsList = [
    "Android Developer",
    "IOs Developer",
    ".Net Developer",
    "Quality Assurance Engineer",
    "Full Stack Developer",
    "Back End Developer",
    "Front End Developer",
    "Data Engineer",
    "Data Analyst",
    "Oracle Engineer",
    "Java Desktop Developer",
    "Python Engineer"
  ];

  final recentJobs = [
    "android",
    "hospitality",
    "web",
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      query.isEmpty ? IconButton(
        icon: Icon(Icons.clear),
        color: Colors.transparent,
        onPressed: () {
          // Do nothing
        },
      )
      : IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
            // Clear the TextField
            query = '';
          },
        )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        // Back to previous Activity
        this.close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentJobs : jobsList;

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.work),
          title: Text(suggestionList[index]),
        );
      },
    );
  }

}