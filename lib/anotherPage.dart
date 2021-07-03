import 'dart:io';

import 'package:cloudbase_auth/cloudbase_auth.dart';
import 'package:cloudbase_core/cloudbase_core.dart';
import 'package:cloudbase_database/cloudbase_database.dart';
import 'package:flutter/material.dart';



class  anotherPage extends StatefulWidget {

  final Map<dynamic,dynamic>  plist ;
  const  anotherPage({Key? key,required  this.plist}) : super(key: key);


  @override
  anotherPageState createState() => anotherPageState(alist:this.plist);
}

class anotherPageState extends State< anotherPage> {
  // int get title => this.title;

  Map<dynamic,dynamic>  alist =<dynamic,dynamic>{};
 anotherPageState({required this.alist});
 // List<dynamic> _plist = <dynamic>[];
 Map<dynamic,dynamic>  _plist =<dynamic,dynamic>{};





 // late int title;
  @override
  Widget build(BuildContext context) {
    return Container(
       child: SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
       children:<Widget>[
         Image.network(alist['draw'].toString()),

           Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child: Text(
               "画作名称:"+"     "+alist['TitleinCh'].toString(),
               textAlign: TextAlign.left,
               style:TextStyle(
                   fontSize: 20.0,
                   fontStyle: FontStyle.normal,
                   color: Colors.white,
                    decoration: TextDecoration.none
               )
           )),



      Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child: Text(
                 "Title of  painting:"+"   "+alist['TitleinEng'].toString(),
               textAlign: TextAlign.left,
               style:TextStyle(
                   fontSize: 20.0,
                   fontStyle: FontStyle.normal,
                   color: Colors.white,
                   decoration: TextDecoration.none)
             )),
      Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child:Text("国籍:"+"     "+alist['personContry'].toString(),
                        style:TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                        decoration: TextDecoration.none)

             )),

      Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child:Text("画家:"+"     "+alist['personName'].toString()
         ,
             style:TextStyle(
                 fontSize: 20.0,
                 fontStyle: FontStyle.normal,
                 color: Colors.white,
                 decoration: TextDecoration.none))),
      Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child:Text(alist['drawStory'].toString(),
             style:TextStyle(
             fontSize: 20.0,
             fontStyle: FontStyle.normal,
             color: Colors.white,
             decoration: TextDecoration.none)
         )),

         Center(child:Image.network(alist['personImage'].toString())),
      Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),child:Text("作者简介:"+"     "+alist['personStory'].toString(),
             style:TextStyle(
             fontSize: 20.0,
             fontStyle: FontStyle.normal,
             color: Colors.white,
             decoration: TextDecoration.none)
         ))

       ]
       ),
      )
    );
  }
}


// class anotherPage extends StatelessWidget {
//
//   anotherPage({Key? key, required this.title})
//       : super(key: key);
//   var data;
//   void _cloudDatabasemy(BuildContext context) async{
//     String _enV = 'hello-cloudbase-1g4a0pycd33251a7';
//     String _appaccess = '9477ef51d7e7da24a3ded7bb66c5353d';
//     CloudBaseCore core = CloudBaseCore.init({
//       'env': _enV,
//       'appAccess':{
//         'key':_appaccess,
//         'version':'1',
//         'timeout': '3000'
//       }
//     });
//     // Navigator.pop(context,this.title);
//     // print(this.title);
//     int num=this.title as int ;
//     CloudBaseAuth auth = CloudBaseAuth(core);
//     CloudBaseAuthState authState = await auth.getAuthState();
//     if(authState==null){
//       await auth.signInAnonymously().then((success){
//         print('登录成功!');
//       } ).catchError((err){
//         print("登录失败");
//
//       });
//     }
//
//     CloudBaseDatabase db = CloudBaseDatabase(core);
//     Collection collection = db.collection('note');
//     await collection.where({
//           "Id":"$num"
//     }).get().then((res) {
//       data = res.data;
//       print(data[0]);
//       // print('num');
//
//     }).catchError((e) => {
//
//     });
//   }
//
//
//
//   late int title;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       body: Center(  child:
//       new ListView(
//         children:_getList(context),
//       )
//       ),
//     );
//   }
//
//
//   List<Widget>  _getList(BuildContext context)  {
//     // Navigator.pop(context,this.title);
//     // print('LIST');
//     _cloudDatabasemy(context);
//     sleep(const Duration(seconds:15));
//     List<Widget> list = [Text('新页面')];
//     //
//     // if(list[0]!=null){
//     //   list.removeAt(0);}
//     print(data);
//     // print(authorName.length);
//     // print(titlelist.length);
//     // print(picturelist.length);
//
//     // list[0]= Image.network(data[0]['draw'].toString());
//     // list[1]= Text(data[0]['TitleinCh'].toString());
//     // list[2]=Text(data[0]['TitleinEng'].toString());
//     // list[4]=Text(data[0]['personContry'].toString());
//     // list[3]=Text(data[0]['personName'].toString());
//     // list[5]=Image.network(data[0]['personImage'].toString());
//     // list[6]=Text(data[0]['drawStory'].toString());
//     // list[7]=Text(data[0]['personStory'].toString());
//
//     // list.add(
//     //     ListTile(
//     //       leading:Image.network(data[0]['draw']),
//     //       title:Text("$i"+".   "+titlelist[i].toString()),
//     //       subtitle: Text(authorName[i].toString()),
//     //     ));
//     //
//
//
//     return list;
//   }
//
//
//
// }
