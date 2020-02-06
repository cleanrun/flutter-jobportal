import 'package:flutter/material.dart';
import 'package:async/async.dart';

import 'package:job_portal/models/beer.dart';
import 'package:job_portal/repository/beer_repository.dart';
import 'package:job_portal/widgets/custom_widgets.dart';
import 'package:job_portal/list_item/popular_category_card.dart';
import 'package:job_portal/list_item/featured_card.dart';
import 'package:job_portal/dummy_data/category_list.dart';
import 'package:job_portal/dummy_data/job_list.dart';
import 'package:job_portal/utils/routes.dart';
import 'package:job_portal/activity/search.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  SearchPage _searchPage = SearchPage();
  List<Beer> _beers = <Beer>[];

  AsyncMemoizer _memoizer = AsyncMemoizer();

  @override
  void initState(){
    super.initState();
    listenForBeers();
  }

  Future listenForBeers() async {
    return this._memoizer.runOnce(() async{
      final Stream<Beer> stream = await getBeers();
      stream.listen((Beer beer) => setState(() => _beers.add(beer)));
    });
  }

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
            onPressed: () async {
              //Toast.show("Search", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
              await showSearch(
                context: context,
                delegate: _searchPage);
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
                    //showToast("See all", context);
                    Navigator.pushNamed(context, Routes.categories);
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
                      child: PopularCategoryCard(
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
              //child: _buildBeers(),
              child: _buildFuture(context),
            ),

            SizedBox(height: 30),

          ],
        ),
      ),
    );
  }

  Widget _buildFuture(BuildContext context){
    return FutureBuilder(
      future: listenForBeers(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            print('_buildFuture: Loading error');
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }
          print('_buildFuture: Showing the Data');
          return _buildBeers();
        }
        else{
          print('_buildFuture: Loading the data');
          return Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 100),
                CircularProgressIndicator()
              ],
            ),
          );
        }
      }
    );
  }

  // List featured jobs with hardcoded data
//  Widget _buildDummy(){
//    return ListView.builder(
//      primary: false,
//      shrinkWrap: true,
//      scrollDirection: Axis.vertical,
//      itemCount: jobs == null ? 0 : jobs.length,
//      itemBuilder: (BuildContext context, int index) {
//        Map job = jobs[index];
//        return Padding(
//            padding: EdgeInsets.only(bottom: 1.0),
//            child: FeaturedCard(
//              img: job["img"],
//              name: job["name"],
//              desc: job["desc"],
//              salary: job["salary"],
//            )
//        );
//      },
//    );
//  }

  // List featured jobs from a server
  Widget _buildBeers(){
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: _beers.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: EdgeInsets.only(bottom: 1.0),
            child: FeaturedCard(beer: _beers[index],)
        );
      },
    );
  }
}