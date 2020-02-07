import 'package:flutter/material.dart';
import 'package:async/async.dart';

import 'package:job_portal/models/beer.dart';
import 'package:job_portal/repository/beer_repository.dart';
import 'package:job_portal/dummy_data/job_list.dart';
import 'package:job_portal/list_item/featured_card.dart';

class CategoryDetailPage extends StatefulWidget{
  final String categoryName;

  @override
  _CategoryDetailPageState createState() => _CategoryDetailPageState();

  CategoryDetailPage({Key key, @required this.categoryName}) : super(key: key);
}

class _CategoryDetailPageState extends State<CategoryDetailPage>{
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
        title: Text(widget.categoryName, style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _buildFuture(context),
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