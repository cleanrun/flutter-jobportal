import 'package:flutter/material.dart';

import 'package:job_portal/widgets/custom_widgets.dart';

class CompanyJobsCard extends StatefulWidget{
  final String name;

  @override
  _CompanyJobsCard createState() => _CompanyJobsCard();

  CompanyJobsCard({Key key, @required this.name}) : super(key: key);

}

class _CompanyJobsCard extends State<CompanyJobsCard>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showToast("Jobs", context);
      },

      child: Container(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: Wrap(
          direction: Axis.vertical,
          children: <Widget>[
            Text(
              widget.name,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),

            SizedBox(height: 5),

            Text(
              'Jakarta',
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Montserrat',
                color: Colors.grey[700],
              ),
            ),

            SizedBox(height: 5),

            Text(
              '9 days ago',
              style: TextStyle(
                fontSize: 13,
                fontFamily: 'Montserrat',
                color: Colors.grey[700],
              ),
            ),

          ],
        ),
      ),
    );
  }

}