import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'package:job_portal/widgets/custom_widgets.dart';
import 'package:job_portal/list_item/category_card.dart';
import 'package:job_portal/list_item/featured_card.dart';
import 'package:job_portal/utils/categories.dart';
import 'package:job_portal/utils/jobs.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        // No need to add a leading if a drawer is declared.
        title: Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Toast.show("Search", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            },
          )
        ],
      ),

      drawer: HomeDrawer(),

      body: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text( // Popular Categories TextView
                  "Popular Categories",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.blueGrey,
                    fontWeight:FontWeight.w800,
                    fontFamily: 'Montserrat',
                  ),
                ),

                FlatButton( // See All Button
                  child: Text(
                    "See all",
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  onPressed: () {
                    showToast("See all", context);
                  },
                ),
              ],
            ),

            SizedBox(height: 10),

            Container( // Category List View
              height: MediaQuery.of(context).size.height/6,
              child: ListView.builder(
                primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories == null ? 0 : categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map category = categories[index];
                    return Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: CategoryCard(
                        img: category["img"],
                        name: category["name"],
                      ),
                    );
                  },
              ),
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text( // Popular Categories TextView
                  "Featured Jobs",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.blueGrey,
                    fontWeight:FontWeight.w800,
                    fontFamily: 'Montserrat',
                  ),
                ),

                FlatButton( // See All Button
                  child: Text(
                    "See all",
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  onPressed: () {
                    showToast("See all", context);
                  },
                ),
              ],
            ),

            SizedBox(height: 5),

            Container( // Features Jobs List View
              //height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: jobs == null ? 0 : jobs.length,
                itemBuilder: (BuildContext context, int index) {
                  Map job = jobs[index];
                  return Padding(
                      padding: EdgeInsets.only(bottom: 1.0),
                      child: FeaturedCard(
                        img: job["img"],
                        name: job["name"],
                        desc: job["desc"],
                        salary: job["salary"],
                      )
                  );
                },
              ),
            ),

            SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}