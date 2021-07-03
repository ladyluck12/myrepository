import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'mayjor.dart';
import 'collection.dart';
import 'mine.dart';


class IndexPage extends StatefulWidget {
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.circle_grid_3x3),
      title: Text('西方油画'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.color_filter),
      title: Text('中国古画'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.tag_fill),
      title: Text('画家简介'),
    ),

  ];

  final List tabBodies = [
    HomePage(),
    myCollection(),
    Mine(),

  ];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = tabBodies[currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.pinkAccent,
        backgroundColor: Colors.purple,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
