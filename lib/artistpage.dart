import 'dart:io';

import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_database/cloudbase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'anotherPage.dart';
class artistpage extends StatefulWidget {
  final int title;
  final String buffer;
  const artistpage({Key? key,required this.title, required this.buffer}) : super(key: key);

  @override
  _artistpageState createState() => _artistpageState(title:this.title,buffer:this.buffer);
}

class _artistpageState extends State<artistpage> {
  int page=0;
  late final int title;
  final String buffer;
  List<dynamic> _plist = <dynamic>[];
  _artistpageState({required this.title,required this.buffer});

  Future _get() async {
    print("get");
    List<dynamic> l = await _cloudDatabase();
    print(buffer);
    setState(() {
      _plist.addAll(l);
      // _artistlist=artistlist;

    });
  }

  @override
  void initState() {
    super.initState();
    // Navigator.pop(context,);
    print(title);
    _get();
    // print(_plist);
  }

  Future _cloudDatabase() async {
    String _enV = 'hello-cloudbase-1g4a0pycd33251a7';
    String _appaccess = '7568a11b56ace537bede6f3d913d8d15';
    CloudBaseCore core = CloudBaseCore.init({
      'env': _enV,
      'appAccess': {'key': _appaccess, 'version': '1', 'timeout': '3000'}
    });
    CloudBaseAuth auth = CloudBaseAuth(core);
    CloudBaseAuthState authState = await auth.getAuthState();
    if (authState == null) {
      auth.signInAnonymously().then((success) {
        print('登录成功!');
      }).catchError((err) {
        print("登录失败");
      });
    }

    CloudBaseDatabase db = CloudBaseDatabase(core);
    switch(this.title){
      case 0:{print(0);
      Collection collection = db.collection('dafenqi');
      dynamic res = await collection.skip(page).limit(10).get();
      print(res);
      page=page+10;
      return res.data;
      }  break;
      case 1:{print(1);
      Collection collection = db.collection('henri');
      dynamic res = await collection.skip(page).limit(10).get();
      print(res);
      page=page+10;
      return res.data;
      }  break;
      case 2:{print(2);
      Collection collection = db.collection('pikasso');
      dynamic res = await collection.skip(page).limit(10).get();
      print(res);
      page=page+10;
      return res.data;
      }  break;
      case 3:{print(3);
      Collection collection = db.collection('yagebu');
      dynamic res = await collection.skip(page).limit(10).get();
      print(res);
      page=page+10;
      return res.data;
      }  break;
      case 4:{print(4);
      Collection collection = db.collection('note');
      dynamic res = await collection.skip(page).limit(10).get();
      print(res);
      page=page+10;
      return res.data;
      }  break;

    }
    // Collection collection = db.collection('note');




  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:EasyRefresh(

            onLoad:() async {
              print('上拉加载已调用');
              _get();
            },
            child:
        SingleChildScrollView(
      child:Container(
          color:Colors.black,
          child:Column(
        children:<Widget>[
          // Text(''),
          Text(''),
          Text('画家生平',
          textAlign: TextAlign.left,
          style:TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color:Colors.grey

          ),
          ),
          Card(
              color: Colors.grey,
          child:Container(
              // color: Colors.black26,
           padding: EdgeInsets.all(10),
          height:200.0,
          width:360.0,
          child:SingleChildScrollView( child:ListView.builder(
              shrinkWrap: true,
              //禁用滑动事件
              physics: NeverScrollableScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context,index){
            return Text(buffer
              ,style: TextStyle(
                // backgroundColor: Colors.black26

              ),
            );
          })


          ))),
          Container(child:
          GridView.builder(
            shrinkWrap: true,
            //禁用滑动事件
            physics: NeverScrollableScrollPhysics(),
            itemCount: _plist.length,
            // padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            itemBuilder: (context, index) {
              return GridTile(
                // height: 250.0,
                  child:ListView(
                      children: <Widget>[
                        // contentPadding: EdgeInsets.all(5),
                        Container(

                            height: 182.0,
                            // width: 160.0,
                            child:InkWell(
                              // enableFeedback:false, //检测到的手势是否应该提供声音和/或触觉反馈，默认true
                              // excludeFromSemantics:true,
                                onTap: () {
                                  Navigator.push(context, new MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return new anotherPage(
                                          plist: _plist[index],
                                        );
                                      }));
                                },
                                child:
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child:Image.network(_plist[index]['draw'].toString(),
                                      fit: BoxFit.cover,
                                    )))),

                        Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child:Text(
                              _plist[index]['TitleinCh'].toString(),
                              textAlign:TextAlign.center,
                              style:TextStyle(
                                color: Colors.white,
                              ),
                            )),

                      ]) //

              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing:15.0,
                crossAxisSpacing:16.0
            ),
          ))




        ]

      )

    ))));
  }
}

