import 'dart:io';
import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_database/cloudbase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'anotherPage.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'artistpage.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> _pic = <dynamic>[];
  List<dynamic> _plist = <dynamic>[];
  List<dynamic> _artistlist = <dynamic>[];
  int page=0;
  Future _get() async {
    print("get");
    List<dynamic> l = await _cloudDatabase();

    setState(() {
      _plist.addAll(l);
      // _artistlist=artistlist;

    });
  }

  Future _getArtist() async{
    List<dynamic> artist = await  _artistDatabase();
    List<dynamic> p = await _lunbotuDatabase();
    setState(() {
      _artistlist=artist;
      _pic.addAll(p);
      print(_pic);
    });
  }

  @override
  void initState() {
    super.initState();
    _get();
    _getArtist();
    print(_plist);

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
    // int page=10;
    CloudBaseDatabase db = CloudBaseDatabase(core);
    Collection collection = db.collection('note');

    dynamic res = await collection.skip(page).limit(10).get();
    print(page);
    page=page+10;
    print(res);
    return res.data;
  }

  Future _lunbotuDatabase() async {
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
    // int page=10;
    CloudBaseDatabase db = CloudBaseDatabase(core);
    Collection collection = db.collection('lunbotu');

    dynamic res = await collection.get();

    print(res);
    return res.data;
  }

  Future _artistDatabase() async {
    print('已调用');
    String _enV = 'hello-cloudbase-1g4a0pycd33251a7';
    String _appaccess = '7568a11b56ace537bede6f3d913d8d15';
    CloudBaseCore core = CloudBaseCore.init({
      'env': _enV,
      'appAccess': {'key': _appaccess, 'version': '1', 'timeout': '3000'}
    });
    print('授权');
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
    Collection collection = db.collection('painters');
    // Collection artist = db.collection('qing');
    dynamic res = await collection.get();

    print(res);
    return res.data;
  }
  //初始化滚动监听器，加载更多使用


  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.purple,
          title: new TabBar(
              // isScrollable:true,
            tabs: <Widget>[
              new Tab(text: ('精选')),
              new Tab(
                text: ('全部'),
              ),
            ],
            // controller: _tabController,
          ),
        ),
        body:Container(
            // color: Colors.black,
            child: new TabBarView(
          children: <Widget>[
            new EasyRefresh(
                onLoad: () async {
                  print('下拉已调用');
                  _get();
                },
                child:
            new Center(
                child: new Container(
                  width: 400.0,
                  // color: Colors.black,
                    alignment: Alignment.center,
                    child: GridView.builder(
                      shrinkWrap: true,
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
                                                    color: Colors.black,
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
                    )))),
            new Center(
              child:SingleChildScrollView(
                child: new Column(
                  children:<Widget>[
                    Container(
                      width: double.infinity,
                      child: AspectRatio(
                        aspectRatio: 16 / 10,
                        child: Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return new Image.network(
                              _pic[index]['img'].toString(),
                              fit: BoxFit.fitHeight,
                            );
                          },
                          itemCount: 7,
                          pagination: new SwiperPagination(), //底部分页器
                          // control: new SwiperControl(), //左右箭头
                          autoplay: true,
                        ),
                      ),

                    ),
                    // ListTile(
                    // leading:Image.network(this._artistlist[0]['pic'].toString()),
                    // title:Text(this._artistlist[0]['Name'].toString())
                    // ),
                    new Text(''),
                    new Container(
                        // width: 400.0,
                        // color: Colors.black,
                        alignment: Alignment.center,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _artistlist.length,
                          // padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          itemBuilder: (context, index) {
                            return GridTile(
                              // height: 250.0,
                                child: Column(children:<Widget>[
                                  InkWell(
                                      onTap: () {

                                        Navigator.push(context, new MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return new artistpage(
                                                title: index,
                                                buffer:_artistlist[index]['personStory'].toString(),
                                              );
                                            }));
                                      },
                                  child: Container(
                                     height:140.0,
                                    width: 110.0,
                                      child:ClipRRect(
                                          borderRadius: BorderRadius.circular(10.0),
                                          child:Image.network(this._artistlist[index]['pic'].toString(),
                                  fit:BoxFit.cover,
                                  //  height:140.0,
                                  // width: 100.0,
                               )))),
                                 Text(this._artistlist[index]['Name'].toString(),
                                   style:TextStyle(
                                     color:Colors.black
                                   ),
                                 )
                               ]),

                            );
                          },
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 0.7,
                              mainAxisSpacing:15.0,
                              crossAxisSpacing:16.0
                          ),
                        ))


                  // Row( children:<Widget>[
                  //   Card( child:Column(children:<Widget>[
                  //     InkWell(
                  //         onTap: () {
                  //           Navigator.push(context, new MaterialPageRoute(
                  //               builder: (BuildContext context) {
                  //                 return new artistpage(
                  //                   title: 0,
                  //                 );
                  //               }));
                  //         },
                  //     child: Image.network(this._artistlist[0]['pic'].toString(),
                  //     fit:BoxFit.cover,
                  //      height:150.0,
                  //     width: 110.0,
                  //  )),
                  //    Text(this._artistlist[0]['Name'].toString())
                  //  ])),
                  //   Card( child:Column(children:<Widget>[
                  //     InkWell(
                  //         onTap: () {
                  //           Navigator.push(context, new MaterialPageRoute(
                  //               builder: (BuildContext context) {
                  //                 return new artistpage(
                  //                   title: 1,
                  //                 );
                  //               }));
                  //         },
                  //         child: Image.network(this._artistlist[1]['pic'].toString(),
                  //           fit:BoxFit.cover,
                  //           height:150.0,
                  //           width: 110.0,
                  //         )),
                  //     Text(this._artistlist[1]['Name'].toString())
                  //   ])),
                  //   Card( child:Column(children:<Widget>[
                  //     InkWell(
                  //         onTap: () {
                  //           Navigator.push(context, new MaterialPageRoute(
                  //               builder: (BuildContext context) {
                  //                 return new artistpage(
                  //                   title: 2,
                  //                 );
                  //               }));
                  //         },
                  //         child: Image.network(this._artistlist[2]['pic'].toString(),
                  //           fit:BoxFit.cover,
                  //           height:150.0,
                  //           width: 110.0,
                  //         )),
                  //     Text(this._artistlist[2]['Name'].toString())
                  //   ])),
                  //
                  // ]),
                  //   Row(children:<Widget>[ Card( child:Column(children:<Widget>[
                  //     InkWell(
                  //         onTap: () {
                  //           Navigator.push(context, new MaterialPageRoute(
                  //               builder: (BuildContext context) {
                  //                 return new artistpage(
                  //                   title: 3,
                  //                 );
                  //               }));
                  //         },
                  //         child: Image.network(this._artistlist[3]['pic'].toString(),
                  //           fit:BoxFit.cover,
                  //           height:150.0,
                  //           width: 110.0,
                  //         )),
                  //     Text(this._artistlist[3]['Name'].toString())
                  //   ])),
                  //     Card( child:Column(children:<Widget>[
                  //       InkWell(
                  //           onTap: () {
                  //             Navigator.push(context, new MaterialPageRoute(
                  //                 builder: (BuildContext context) {
                  //                   return new artistpage(
                  //                     title: 4,
                  //                   );
                  //                 }));
                  //           },
                  //           child: Image.network(this._artistlist[4]['pic'].toString(),
                  //             fit:BoxFit.cover,
                  //             height:150.0,
                  //             width: 110.0,
                  //           )),
                  //       Text(this._artistlist[4]['Name'].toString())
                  //     ]))
                  //   ])
                ]
                ))),
          ],
        )),
      ),
    );
  }
}
