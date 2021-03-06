import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utility/database.dart';


Future<Widget> showUnEnrolBottomSheet(BuildContext context,String classId) async {
  final mq = MediaQuery.of(context).size;
  return await showModalBottomSheet(
      context: context,
      builder: (ctx) => Container(
            height: mq.height * 0.1,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlatButton(
                  child: Text(
                    'Unenroll',
                    style: const TextStyle(fontSize: 19),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    showUnEnrolAlert(context,classId);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ));
}

showUnEnrolAlert(BuildContext context,String classId) {
  return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
            title: Text(
              'Unerol',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            content: Text(
              "By doing this, you'll no longer be\nable to see the class or participate\nin it.",
              style: TextStyle(color: Colors.black87),
            ),
            actions: [
              FlatButton(
                child: Text(
                  'CANCEL',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text(
                  'UNENROL',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                onPressed: () {
                  User user = FirebaseAuth.instance.currentUser;
                  unEnrolFromJoinedClass(user.uid, classId);
                },
              ),
            ],
          ));
}
