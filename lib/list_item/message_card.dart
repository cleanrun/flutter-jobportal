import 'package:flutter/material.dart';
import 'package:job_portal/activity/message_detail.dart';

import 'package:job_portal/widgets/custom_widgets.dart';

class MessageCard extends StatefulWidget{
  final String from;
  final String contents;

  @override
  _MessageCardState createState() => _MessageCardState();

  MessageCard({Key key, @required this.from, @required this.contents}) : super(key: key);
}

class _MessageCardState extends State<MessageCard>{
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        //showToast("Message", context);
        Navigator.push(context,
          MaterialPageRoute(
            builder: (_) => MessageDetailPage(
              from: widget.from,
              contents: widget.contents,
            )
          ));
      },
      leading: CircleAvatar(
        backgroundImage: AssetImage('assets/codex_logo.png'),
        backgroundColor: Colors.transparent,
        radius: 20,
      ),
      title: Text(
        //"Message",
        widget.from,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: Colors.blueGrey,
        ),
        maxLines: 1,
        overflow: TextOverflow.fade,
      ),
      subtitle: Text(
        //"This text is the subtitle of the category.",
        widget.contents,
        style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 13
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Icon(Icons.keyboard_arrow_right),
    );
  }

}