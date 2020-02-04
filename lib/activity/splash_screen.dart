import 'package:flutter/material.dart';
import 'package:job_portal/main.dart';

class SplashScreen extends StatefulWidget{
  final VoidCallback onInitializationComplete;
  final bool initializationShouldFail;

  const SplashScreen({Key key,
    @required this.onInitializationComplete,
    this.initializationShouldFail = false})
      : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    if(widget.initializationShouldFail){
      loadingAndError();
    }
    else{
      loadingAndSuccess();
    }
  }

  Future<void> loadingAndError() async{
    Future.delayed(
      Duration(milliseconds: 1500),
      () {
         setState(() {
           _hasError = true;
         });
      }
    );
  }

  Future<void> loadingAndSuccess() async{
    Future.delayed(
      Duration(milliseconds: 1500),
      () => widget.onInitializationComplete(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_hasError) {
      return Center(
        child: RaisedButton(
          onPressed: () => main(),
          child: Text('retry'),
        ),
      );
    }
    return Center(
      child: Container(
        //width: double.infinity,
        //height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle
        ),
        child: CircularProgressIndicator(),
      ),
    );
  }

}