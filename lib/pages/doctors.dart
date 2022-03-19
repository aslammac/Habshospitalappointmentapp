import 'package:flutter/material.dart';
import 'package:habs/widgets/doctors_list_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// this class lists the doctors at the hospital

//get the doctors from the database 
Future<QuerySnapshot> getDoctors() async {
  //get the doctors from the database
  var firestore = FirebaseFirestore.instance;
  var query = firestore.collection('doctors').get();
  return query;
}
class Doctors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFFF9800),
        title: Text('Doctors', style: TextStyle(
          fontWeight:FontWeight.w300,
          fontSize: 20.0,
          color: Colors.black,
        ),
        ),
      ),
      body: FutureBuilder(
        future: getDoctors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                return DoctorsList(
                  doctorName: snapshot.data.docs[index].data()['name'],
                  doctorRole: snapshot.data.docs[index].data()['role'],
                  doctorContact: snapshot.data.docs[index].data()['phone'].toString(),
                );
              },
            );
          }
        },
      ),
      
      //  ListView(
      //   children: <Widget>[
      //     DoctorsList(
      //       doctorName: 'Sande Sydney',
      //       doctorRole: 'Bone Surgeon',
      //       doctorContact: '0728124585',
      //     ),
      //     Divider(color: Colors.black),
      //     DoctorsList(
      //       doctorName: 'Matete Taro',
      //       doctorRole: 'Psychiatrist',
      //       doctorContact: '0758624122',
      //     ),
      //     Divider(color: Colors.black),
      //     DoctorsList(
      //       doctorName: 'Joan James',
      //       doctorRole: 'General Obstetrician',
      //       doctorContact: '07562221214',
      //     ),
      //     Divider(color: Colors.black),
      //     DoctorsList(
      //       doctorName: 'Malunga Marley',
      //       doctorRole: 'General Obstetrician',
      //       doctorContact: '0763214587',
      //     ),
      //     Divider(color: Colors.black),
      //     DoctorsList(
      //       doctorName: 'Bossy Ross',
      //       doctorRole: 'Gynaecologist',
      //       doctorContact: '0765854587',
      //     ),
      //     Divider(color: Colors.black),
      //     DoctorsList(
      //       doctorName: 'Peter Parker',
      //       doctorRole: 'Radiologist',
      //       doctorContact: '0769854590',
      //     ),
      //     Divider(color: Colors.black),
      //     DoctorsList(
      //       doctorName: 'Anna Mitosis',
      //       doctorRole: 'Ear, Nose and Throat',
      //       doctorContact: '07563245854',
      //     ),
      //     Divider(color: Colors.black),
      //   ],
      // ),
    );
  }
}
