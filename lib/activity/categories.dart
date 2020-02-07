import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:job_portal/activity/category_detail.dart';
import 'package:job_portal/dummy_data/category_list.dart';
import 'package:job_portal/widgets/custom_widgets.dart';

class CategoriesPage extends StatefulWidget{
  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat')),
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

  Widget contents() {
    return Container(
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: categories == null ? 0 : categories.length,
        itemBuilder: (context, index) {
          Map category = categories[index];
          return ListTile(
            onTap: () {
              //showToast(category["name"], context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CategoryDetailPage(
                    categoryName: category["name"],
                  )
                )
              );
            },
            leading: CircleAvatar(
              backgroundImage: AssetImage(category["img"]),
              backgroundColor: Colors.transparent,
              radius: 20,
            ),
            title: Text(
              category["name"],
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.blueGrey,
              ),
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
            subtitle: Text(
              "This text is the subtitle of the category.",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 13
              ),
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
            trailing: Icon(Icons.keyboard_arrow_right),
          );
        }
      ),
    );
  }

}