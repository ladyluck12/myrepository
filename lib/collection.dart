import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_database/cloudbase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'guohua.dart';

class myCollection extends StatefulWidget {
  const myCollection({Key? key}) : super(key: key);

  @override
  _myCollectionState createState() => _myCollectionState();
}

class _myCollectionState extends State<myCollection> {
  int page = 0;
  List<int> pageflag = [0, 0, 0, 0, 0, 0, 0, 0];

  int myIndex = 0;
  List<dynamic> _plist = <dynamic>[];
  List<dynamic> _wudaili = <dynamic>[];
  List<dynamic> _jinli = <dynamic>[];
  List<dynamic> _tangli = <dynamic>[];
  List<dynamic> _songli = <dynamic>[];
  List<dynamic> _yuanli = <dynamic>[];
  List<dynamic> _mingli = <dynamic>[];
  List<dynamic> _qingli = <dynamic>[];

  Future _get() async {
    print("get");
    List<dynamic> l = await _jingxuanDatabase();
    List<dynamic> wu = await  _wudaishiguoDatabase();
    List<dynamic> jin = await  _jinDatabase();
    List<dynamic> tang = await  _tangDatabase();
    List<dynamic> song = await  _songDatabase();
    List<dynamic> yuan = await  _yuanDatabase();
    List<dynamic> ming = await  _mingDatabase();
    List<dynamic> qing = await  _qingDatabase();
    setState(() {
      _plist.addAll(l);
      // _artistlist=artistlist;
    });
    _wudaili.addAll(wu);
    _jinli.addAll(jin);
    _tangli.addAll(tang);
    _songli.addAll(song);
    _yuanli.addAll(yuan);
    _mingli.addAll(ming);

    _qingli.addAll(qing);
  }

  @override
  void initState() {
    super.initState();
    // _jingxuanDatabase();
    _get();
    print(_plist);
  }

  Future _jingxuanDatabase() async {
    print('已调用');
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
    Collection collection = db.collection('chinajingxuan');
    dynamic res = await collection.skip(pageflag[0]).limit(6).get();
    print(res);
    pageflag[0] = pageflag[0] + 6;
    return res.data;
  }

  Future _wudaishiguoDatabase() async {
    print('已调用');
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
    Collection collection = db.collection('wudaishiguo');
    dynamic res = await collection.skip(pageflag[1]).limit(6).get();
    print(res);
    pageflag[1] = pageflag[1] + 6;
    return res.data;
  }

  Future _jinDatabase() async {
    print('已调用');
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
    Collection collection = db.collection('jin');
    dynamic res = await collection.skip(pageflag[2]).limit(6).get();
    print(res);
    pageflag[2] = pageflag[2] + 6;
    return res.data;
  }
  Future _tangDatabase() async {
    print('已调用');
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
    Collection collection = db.collection('tang');
    dynamic res = await collection.skip(pageflag[3]).limit(6).get();
    print(res);
    pageflag[3] = pageflag[3] + 6;
    return res.data;
  }

  Future _songDatabase() async {
    print('已调用');
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
    Collection collection = db.collection('song');
    dynamic res = await collection.skip(pageflag[4]).limit(6).get();
    print(res);
    pageflag[4] = pageflag[4] + 6;
    return res.data;
  }

  Future _yuanDatabase() async {
    print('已调用');
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
    Collection collection = db.collection('yuan');
    dynamic res = await collection.skip(pageflag[5]).limit(6).get();
    print(res);
    pageflag[5] = pageflag[5] + 6;
    return res.data;
  }

  Future _mingDatabase() async {
    print('已调用');
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
    Collection collection = db.collection('ming');
    dynamic res = await collection.skip(pageflag[6]).limit(6).get();
    print(res);
    pageflag[6] = pageflag[6] + 6;
    return res.data;
  }

  Future _qingDatabase() async {
    print('已调用');
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
    Collection collection = db.collection('qing');
    dynamic res = await collection.skip(pageflag[7]).limit(6).get();
    print(res);
    pageflag[7] = pageflag[7] + 6;
    return res.data;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 8,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              title: new TabBar(
                onTap: (index) {
                  myIndex = index;
                  // _plist = [];
                },
                isScrollable: true,
                tabs: <Widget>[
                  new Tab(text: ('  精选    ')),
                  new Tab(text: ('   五代十国  ')),
                  new Tab(text: ('     晋     ')),
                  new Tab(text: ('     唐     ')),
                  new Tab(text: ('     宋     ')),
                  new Tab(text: ('     元     ')),
                  new Tab(text: ('     明     ')),
                  new Tab(text: ('     清     ')),
                ],
                // controller: _tabController,
              ),
            ),
            body: Container(
                child: TabBarView(
              children: <Widget>[
                EasyRefresh(
                    onLoad: () async {
                      _get();
                    },
                    child: Card(
                        child: Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                //禁用滑动事件
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _plist.length,
                                itemBuilder: (context, index) {
                                  return Column(children: <Widget>[
                                    AspectRatio(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(context, new MaterialPageRoute(
                                                              builder: (BuildContext context) {
                                                                return new guohua(
                                                                  title:_plist[index]['pictures']
                                                                      .toString(),
                                                                );
                                                              }));
                                          },
                                          child: Image.network(_plist[index]['pictures']
                                                .toString(),
                                            fit: BoxFit.cover,
                                          )),
                                      aspectRatio: 16 / 9,
                                    ),
                                    Text(_plist[index]['data'].toString()),
                                  ]);
                                })))),
                EasyRefresh(
                    onLoad: () async {
                      _get();
                    },
                    child: Card(
                        child: Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                //禁用滑动事件
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _wudaili.length,
                                itemBuilder: (context, index) {
                                  return Column(children: <Widget>[
                                    AspectRatio(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(context, new MaterialPageRoute(
                                                builder: (BuildContext context) {
                                                  return new guohua(
                                                    title:_wudaili[index]['pictures']
                                                        .toString(),
                                                  );
                                                }));
                                          },
                                          child: Image.network(_wudaili[index]['pictures']
                                              .toString(),
                                            fit: BoxFit.cover,
                                          )),
                                      aspectRatio: 16 / 9,
                                    ),
                                    Text(_wudaili[index]['data'].toString()),
                                  ]);
                                })))),
                EasyRefresh(
                    onLoad: () async {
                      _get();
                    },
                    child: Card(
                        child: Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                //禁用滑动事件
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _jinli.length,
                                itemBuilder: (context, index) {
                                  return Column(children: <Widget>[
                                    AspectRatio(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(context, new MaterialPageRoute(
                                                builder: (BuildContext context) {
                                                  return new guohua(
                                                    title:_jinli[index]['pictures']
                                                        .toString(),
                                                  );
                                                }));
                                          },
                                          child: Image.network(_jinli[index]['pictures']
                                              .toString(),
                                            fit: BoxFit.cover,
                                          )),
                                      aspectRatio: 16 / 9,
                                    ),
                                    Text(_jinli[index]['data'].toString()),
                                  ]);
                                })))),
                EasyRefresh(
                    onLoad: () async {
                      _get();
                    },
                    child: Card(
                        child: Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                //禁用滑动事件
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _tangli.length,
                                itemBuilder: (context, index) {
                                  return Column(children: <Widget>[
                                    AspectRatio(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(context, new MaterialPageRoute(
                                                builder: (BuildContext context) {
                                                  return new guohua(
                                                    title:_tangli[index]['pictures']
                                                        .toString(),
                                                  );
                                                }));
                                          },
                                          child: Image.network(_tangli[index]['pictures']
                                              .toString(),
                                            fit: BoxFit.cover,
                                          )),
                                      aspectRatio: 16 / 9,
                                    ),
                                    Text(_tangli[index]['data'].toString()),
                                  ]);
                                })))),
                EasyRefresh(
                    onLoad: () async {
                      _get();
                    },
                    child: Card(
                        child: Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                //禁用滑动事件
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _songli.length,
                                itemBuilder: (context, index) {
                                  return Column(children: <Widget>[
                                    AspectRatio(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(context, new MaterialPageRoute(
                                                builder: (BuildContext context) {
                                                  return new guohua(
                                                    title:_songli[index]['pictures']
                                                        .toString(),
                                                  );
                                                }));
                                          },
                                          child: Image.network(_songli[index]['pictures']
                                              .toString(),
                                            fit: BoxFit.cover,
                                          )),
                                      aspectRatio: 16 / 9,
                                    ),
                                    Text(_songli[index]['data'].toString()),
                                  ]);
                                })))),
                EasyRefresh(
                    onLoad: () async {
                      _get();
                    },
                    child: Card(
                        child: Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                //禁用滑动事件
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _yuanli.length,
                                itemBuilder: (context, index) {
                                  return Column(children: <Widget>[
                                    AspectRatio(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(context, new MaterialPageRoute(
                                                builder: (BuildContext context) {
                                                  return new guohua(
                                                    title:_yuanli[index]['pictures']
                                                        .toString(),
                                                  );
                                                }));
                                          },
                                          child: Image.network(_yuanli[index]['pictures']
                                              .toString(),
                                            fit: BoxFit.cover,
                                          )),
                                      aspectRatio: 16 / 9,
                                    ),
                                    Text(_yuanli[index]['data'].toString()),
                                  ]);
                                })))),
                EasyRefresh(
                    onLoad: () async {
                      _get();
                    },
                    child: Card(
                        child: Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                //禁用滑动事件
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _mingli.length,
                                itemBuilder: (context, index) {
                                  return Column(children: <Widget>[
                                    AspectRatio(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(context, new MaterialPageRoute(
                                                builder: (BuildContext context) {
                                                  return new guohua(
                                                    title:_mingli[index]['pictures']
                                                        .toString(),
                                                  );
                                                }));
                                          },
                                          child: Image.network(_mingli[index]['pictures']
                                              .toString(),
                                            fit: BoxFit.cover,
                                          )),
                                      aspectRatio: 16 / 9,
                                    ),
                                    Text(_mingli[index]['data'].toString()),
                                  ]);
                                })))),
                EasyRefresh(
                    onLoad: () async {
                      _get();
                    },
                    child: Card(
                        child: Container(
                            child: ListView.builder(
                                shrinkWrap: true,
                                //禁用滑动事件
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _qingli.length,
                                itemBuilder: (context, index) {
                                  return Column(children: <Widget>[
                                    AspectRatio(
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.push(context, new MaterialPageRoute(
                                                builder: (BuildContext context) {
                                                  return new guohua(
                                                    title:_qingli[index]['pictures']
                                                        .toString(),
                                                  );
                                                }));
                                          },
                                          child: Image.network(_qingli[index]['pictures']
                                              .toString(),
                                            fit: BoxFit.cover,
                                          )),
                                      aspectRatio: 16 / 9,
                                    ),
                                    Text(_qingli[index]['data'].toString()),
                                  ]);
                                })))),
              ],
            ))));
  }
}
