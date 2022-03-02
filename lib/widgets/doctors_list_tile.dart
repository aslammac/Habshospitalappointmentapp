import 'package:flutter/material.dart';

class DoctorsList extends StatelessWidget {
  // Constructor
  DoctorsList(
      {@required this.doctorName,
      @required this.doctorRole,
      @required this.doctorContact});

  // variables to hold passed doctor's name, role and telephone contact
  final String doctorName;
  final String doctorRole;
  final String doctorContact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // TODO: Use the doctor's image here
      leading: Icon(
        Icons.person,
        size: 40.0,
      ),
      title: Text('Dr. ' + doctorName,
        style: TextStyle(
          fontWeight:FontWeight.w600,
          fontSize: 25.0,
          color: Colors.black,
        ),),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(doctorRole,
            style: TextStyle(
              fontWeight:FontWeight.w500,
              fontSize: 20.0,
              color: Colors.black,
            ),
          ),
          Text('Tel: ' + doctorContact,
            style: TextStyle(
              fontWeight:FontWeight.w400,
              fontSize: 20.0,
              color: Colors.black,
            ),),
        ],
      ),
      contentPadding: EdgeInsets.all(8.0),
      trailing: Icon(
        Icons.calendar_today,
        size: 30,
      ),
    );
  }
}
