import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:habs/widgets/menu_list_tile.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";

class LeftDrawerWidget extends StatefulWidget {
  @override
  _LeftDrawerWidgetState createState() => _LeftDrawerWidgetState();
}

class _LeftDrawerWidgetState extends State<LeftDrawerWidget> {
  final _auth= FirebaseAuth.instance;
  final _firestore=FirebaseFirestore.instance;
  String loggedUser;
  String Name;
  void getUserSetails(){
    try{
      final users = _auth.currentUser;
      if(users!=null){
        loggedUser = users.email;
      }

    } catch(e){
      print(e);
    }
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserSetails();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            currentAccountPicture: Icon(
              Icons.person,
              size: 80.0,
              color: Colors.white,
            ),
            accountEmail: Text(loggedUser),
            accountName: null,
          ),
          MenuListTileWidget(),
        ],
      ),
    );
  }
}
