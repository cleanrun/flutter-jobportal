import 'package:flutter/material.dart';

class MessageDetailPage extends StatefulWidget{
  final String from;
  final String contents;

  @override
  _MessageDetailPageState createState() => _MessageDetailPageState();

  MessageDetailPage({Key key, @required this.from, @required this.contents}) : super(key: key);
}

class _MessageDetailPageState extends State<MessageDetailPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Text('Messages', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          fromDetails(),

          SizedBox(height: 5),

          messageDetail(),

          SizedBox(height: 30),

        ],
      ),
    );
  }

  Widget fromDetails(){
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Wrap(
        direction: Axis.vertical,
        children: <Widget>[
          Container( // Company Logo
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset(
              'assets/codex_logo.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.cover,
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: Wrap(
              direction: Axis.horizontal,
              children: <Widget>[
                Text(
                  "From: ",
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                      fontWeight: FontWeight.w600
                  ),
                ),

                SizedBox(width: 5),

                Text(
                  widget.from,
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      )
    );
  }

  Widget messageDetail(){
    return Container(
        padding: EdgeInsets.fromLTRB(8, 5, 8, 0),
        child: Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child:  Row(
                mainAxisSize: MainAxisSize.max, // Row with MainAxisSize.max means (w, h) => (match_parent, wrap_content)
                children: <Widget>[
                  Wrap(
                    direction: Axis.vertical,
                    children: <Widget>[
                      Text(
                        "Message",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),
                      ),

                      SizedBox(height: 10),

                      Container(
                        width: MediaQuery.of(context).size.width*0.85,
                        child: Text(
                          widget.contents,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15,
                          ),
                        ),
                      ),

                      SizedBox(height: 20)
                    ],
                  )

                ],
              ),
            )
        )
    );
  }

}