import 'package:flutter/material.dart';
import 'package:job_portal/widgets/custom_widgets.dart';

// Used in home.dart

class CategoryCard extends StatefulWidget{
  final String img;
  final String name;

  @override
  _CategoryCardState createState() => _CategoryCardState();

  CategoryCard({Key key, @required this.img, @required this.name}) : super(key: key);
}

class _CategoryCardState extends State<CategoryCard>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showToast(widget.name, context);
      },

      child: Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Stack(
            children: <Widget>[

              Image.asset(
                widget.img,
                height: MediaQuery.of(context).size.height/6,
                width: MediaQuery.of(context).size.height/6,
                fit: BoxFit.cover,
              ),

              Container(
                decoration: BoxDecoration(
                  gradient:LinearGradient(
                    begin:Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.2, 0.7],
                    colors: [
                      Color.fromARGB(100, 0, 0, 0),
                      Color.fromARGB(100, 0, 0, 0),
                    ]
                  )
                ),
                height: MediaQuery.of(context).size.height/6,
                width: MediaQuery.of(context).size.height/6,
              ),

              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height/6,
                  width: MediaQuery.of(context).size.height/6,
                  padding: EdgeInsets.all(1),
                  constraints: BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  child: Center(
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),

              ),

            ],
          ),
        ),
      ),
    );
  }

}