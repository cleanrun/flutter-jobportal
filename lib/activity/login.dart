import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:job_portal/activity/home.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:job_portal/widgets/custom_widgets.dart';

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  Animation animation1, animation2, animation3;
  AnimationController animationController;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SharedPreferences prefs;

  @override
  void initState(){
    super.initState();

    animationController = AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation1 = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(curve: Curves.fastLinearToSlowEaseIn, parent: animationController));
    animation2 = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(curve: Interval(0.8, 1.0, curve: Curves.fastLinearToSlowEaseIn), parent: animationController));

    checkLogin();
  }

  Future checkLogin() async{
    prefs = await SharedPreferences.getInstance();
    if(prefs.getBool("isLogin")){
      Navigator.pushReplacement(context,
          MaterialPageRoute(
            builder: (_) => HomePage(),
          )
      );
    }
    else{
      print("Not Logged In");
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();

    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child){
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Transform(
                transform: Matrix4.translationValues(animation1.value * width, 0.0, 0.0),
                child: Container( // Hello Text
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                        child: Text(
                          'Come',
                          style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                        child: Row(
                          children: <Widget>[
                            Text('In', style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),),
                            Text('.', style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold, color: Colors.blue),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Transform(
                transform: Matrix4.translationValues(animation2.value * width, 0.0, 0.0),
                child: Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[

                      TextField( // Email Text Field
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                        ),
                        controller: emailController,
                      ),

                      SizedBox(height: 20.0),

                      TextField( // Password Text Field
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                        ),
                        controller: passwordController,
                        obscureText: true,
                      ),

                      SizedBox(height: 5.0),

                      Container( // Forgot Password Text
                        alignment: Alignment(1.0, 0.0),
                        padding: EdgeInsets.only(top: 15.0, left: 20.0),
                        child: InkWell(
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 40),

                      Container( // Login Button
                        height: 40.0,
                        child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.blueAccent,
                            color: Colors.blue,
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: (){
                                //showToast(emailController.text, context);
                                getLogin(emailController.text, passwordController.text);
                              }, // OnClickListener
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'
                                  ),
                                ),
                              ),
                            )
                        ),
                      ),

                      SizedBox(height: 20.0),

                      Container( // Login with Google button
                        height: 40.0,
                        color: Colors.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Center(
                                  child: ImageIcon(AssetImage('assets/google_icon.png'))
                              ),
                              SizedBox(width: 10.0),
                              Center(
                                child: Text(
                                  'Login with Google',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 15.0),

                      Row( // Register Button
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Did you just born yesterday?',
                            style: TextStyle(fontFamily: 'Montserrat'),
                          ),
                          SizedBox(width: 5.0),
                          InkWell(
                            onTap: () {}, // OnClickListener
                            child: Text(
                              'Register here.',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline
                              ),
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              )

            ],
          ),
        );
      },

    );
  }

  Future getLogin(String email, String password) async{
    prefs = await SharedPreferences.getInstance();

    if(email == "example@gmail.com" && password == "password"){
      try{
        prefs.setBool("isLogin", true);
        prefs.setString("email", email);
        prefs.setString("password", password);

        Navigator.pushReplacement(context,
          MaterialPageRoute(
            builder: (_) => HomePage(),
          )
        );
      }catch(e){
        print(e.toString());
      }
    }
    else{
      showToast("Invalid email or password.", context);
    }
  }

}