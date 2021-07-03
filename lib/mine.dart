import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_database/cloudbase_database.dart';
import 'package:flutter/material.dart';

class Mine extends StatefulWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> {

  List<dynamic> _plist = <dynamic>[];

  Future _get() async {
    print("get");
    List<dynamic> l = await _cloudDatabase();

    setState(() {
      _plist.addAll(l);
      print(_plist);
    });
  }

  @override
  void initState() {
    super.initState();
    _get();

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
    Collection collection = db.collection('shidahuajia');

    dynamic res = await collection.limit(10).get();

    print(res);
    return res.data;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('近代十大影响力画家'),
        backgroundColor:Colors.purple
      ),
      body: ListView.builder(
          itemCount:_plist.length,
          itemBuilder:(context,index){

        return Card(child: Column(
          children:<Widget>[
            Row(children:<Widget>[
              Container(

                  height: 120.0,
                  width: 120.0,
                  child:Image.network(_plist[index]['pic'].toString(),
                      fit:BoxFit.contain)
              ),
              Padding(
              child:Text(_plist[index]['Name'].toString()), padding:EdgeInsets.fromLTRB(30, 0, 0, 0),)
            ]),
            Text(_plist[index]['jieshao'].toString()),
          ]



        ));
      })
      ,);
  }
}

