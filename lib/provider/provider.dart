import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';

import 'package:http/http.dart';

final providerCNP = ChangeNotifierProvider<UrlProvider>((ref) => UrlProvider());

class UrlProvider extends ChangeNotifier {
  int _id;
  String _username;
  String _fname;
  String _lname;
  String _ip;
  final TextEditingController _textEditingController = TextEditingController();

  // getters
  TextEditingController get textEditingController => _textEditingController;
  int get id => _id;
  String get username => _username;
  String get fname => _fname;
  String get lname => _lname;
  String get ip => _ip;

  Future<dynamic> getData() async {
    print('before ');
    try {
      Response response = await get(Uri.parse(_textEditingController.text));
      _id = json.decode(utf8.decode(response.bodyBytes))['id'] as int;
      _username =
          json.decode(utf8.decode(response.bodyBytes))['username'] as String;
      _fname = json.decode(utf8.decode(response.bodyBytes))['fname'] as String;
      _lname = json.decode(utf8.decode(response.bodyBytes))['lname'] as String;
      _ip = json.decode(utf8.decode(response.bodyBytes))['ip'] as String;
    } catch (e) {
      print('error: ${e.toString()}');
      throw e;
    }

    print('after');

    print('on getData');

    notifyListeners();
  }

  notifyListeners();
}
