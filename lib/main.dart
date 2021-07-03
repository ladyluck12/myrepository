import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_function/cloudbase_function.dart';
import 'package:cloudbase_storage/cloudbase_storage.dart';
import 'package:cloudbase_database/cloudbase_database.dart';
import 'package:path_provider/path_provider.dart';
import 'index_page.dart';

final _envId = 'hello-cloudbase';
// final _function = 'glot';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {


  // var currentIndex;
  // var currentPage;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
      child: Scaffold(

        body: IndexPage(),
      ),
    ));
  }
}
