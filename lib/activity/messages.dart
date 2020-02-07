import 'package:flutter/material.dart';
import 'package:job_portal/dummy_data/message_list.dart';
import 'package:job_portal/list_item/message_card.dart';

class MessagesPage extends StatefulWidget{
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Messages', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: contents(),
    );
  }

  Widget contents(){
    return Container(
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: messages == null ? 0 : messages.length,
        itemBuilder: (context, index) {
          Map message = messages[index];
          return MessageCard(
            from: message["from"],
            contents: message["contents"],
          );
        }
      ),
    );
  }

}