import 'package:flutter/material.dart';
import 'package:new_app/model/model.dart';

class JsonData extends StatelessWidget {
  final UrlModel url;

  const JsonData({Key key, @required this.url}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON Data'),
        centerTitle: false,
      ),
      body: Container(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.menu),
              title: Text('ID: ${url.id.toString()}'),
            ),
            if (url.username != null)
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Username: ${url.username}'),
              ),
            if (url.fname != null)
              ListTile(
                leading: Icon(Icons.menu),
                title: Text('First Name: ${url.fname}'),
              ),
            if (url.lname != null)
              ListTile(
                leading: Icon(Icons.menu),
                title: Text('Last Name: ${url.lname}'),
              ),
          ],
        ),
      ),
    );
  }
}
