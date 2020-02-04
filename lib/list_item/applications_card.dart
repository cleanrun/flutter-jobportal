import 'package:flutter/material.dart';

import 'package:job_portal/widgets/custom_widgets.dart';

class ApplicationsCard extends StatefulWidget{
  final String name;

  @override
  _ApplicationsCardState createState() => _ApplicationsCardState();

  ApplicationsCard({Key key, @required this.name}) : super(key: key);
}

class _ApplicationsCardState extends State<ApplicationsCard>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: applicationsList(),
    );
  }

  Widget applicationsList(){
    return InkWell(
      onTap: () {
        showToast("Jobs", context);
      },

      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Wrap(
              direction: Axis.vertical,
              children: <Widget>[
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 13,
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

                Divider(),

              ],
            ),

            IconButton(
              icon: Icon(Icons.visibility),
              color: Colors.blueGrey,
              onPressed: () {
                //showToast('Dialog Box', context);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ApplicationInfoDialog(
                      title: 'Title',
                      description: 'Description',
                    );
                  }
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ApplicationInfoDialog extends StatelessWidget{
  final String title, description;

  ApplicationInfoDialog({@required this.title, @required this.description});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: content(context),
    );
  }

  Widget content(BuildContext context){
    return Stack(
      children: <Widget>[

        Container(
          padding: EdgeInsets.fromLTRB(16, 82, 16, 16),
          margin: EdgeInsets.only(top: 66),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: const Offset(0.0, 10.0)
              )
            ]
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Application Status',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat'
                ),
              ),

              SizedBox(height: 16),

              Text(
                'This is the application status description.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                ),
              ),

              SizedBox(height: 24),

              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

}