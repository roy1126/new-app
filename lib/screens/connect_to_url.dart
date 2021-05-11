import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_app/model/model.dart';
import 'package:new_app/provider/provider.dart';
import 'package:new_app/screens/json_data.dart';

class ConnectToURl extends StatefulWidget {
  @override
  _ConnectToURlState createState() => _ConnectToURlState();
}

class _ConnectToURlState extends State<ConnectToURl> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      final provider = watch(providerCNP);
      return Scaffold(
        appBar: AppBar(
          title: Text('Connect to URL'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.always,
                child: TextFormField(
                  controller: provider.textEditingController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return '*http is required.';
                    }
                    bool _validURL = Uri.parse(value).isAbsolute;
                    if (_validURL) {
                      return null;
                    } else {
                      return 'http is not valid';
                    }
                  },
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    provider.getData().then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JsonData(
                                  url: UrlModel(
                                      id: provider.id,
                                      username: provider.username,
                                      lname: provider.lname,
                                      fname: provider.fname,
                                      ip: provider.ip),
                                ))));
                    // await provider.getData().whenComplete(() => Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    // builder: (context) => JsonData(
                    //       url: UrlModel(
                    //           id: provider.id,
                    //           username: provider.username,
                    //           lname: provider.lname,
                    //           fname: provider.fname,
                    //           ip: provider.ip),
                    //             ))));
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      );
    });
  }
}
