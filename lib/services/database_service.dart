import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../modals/user_modal.dart';

class Database with ChangeNotifier {
  // collection reference
  final CollectionReference group =
      FirebaseFirestore.instance.collection('group');

  final CollectionReference groupUsers =
      FirebaseFirestore.instance.collection('group_users');

  final CollectionReference groupMessages =
      FirebaseFirestore.instance.collection('group_messages');

  final CollectionReference userProfile =
      FirebaseFirestore.instance.collection('user_profile');

  Future getGroupsAndChats(UserModal user) async {
    // read documents from the collection ie get the groups
    try {
      // dynamic userGroups =
      //     await groupUsers.where('user_id', isEqualTo: user.id).get().then(
      //   (querySnapshot) {
      //     return querySnapshot.docs;
      //   },
      // );

      QuerySnapshot groups =
          await groupUsers.where('user_id', isEqualTo: user.id).get();
      final allUserGroups = groups.docs;

      // remember that we can have clicked sign in mutiple
      // for (var docSnapshot in userGroups) {
      //   print('${docSnapshot.id} => ${docSnapshot.data()}');
      // }

      return allUserGroups;
    } catch (e) {
      print('group error == ${e.toString()}');
      return null;
    }

    // read documents from collection to get chats
  }

  Future getGroups(String groupId) async {
    try {
      return await group.doc(groupId).get().then((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return data;
      });
    } catch (e) {
      print('getting chat error == ${e.toString()}');
      return null;
    }
  }

  // we want to get data and show it in our app using streams to listen for changes in out collection
  // stream will notify us of any changes document changes
  // steam will look at the group_chat collection and listens for any documents added removed updated
  // come down the stream and notify us
  // data we get back will be a snapshot of the group_messages collection which will be an object
  // with current documents

  // steps one is to setup
  //<QuerySnapshot> is the return type of the stream and is a snapshot what is contained in the collection at the given moment
  Stream<QuerySnapshot> getChats() {
    return groupMessages
        .where('group_id', isEqualTo: 'RV9lQOituND0dZ4Zfy0W')
        .snapshots();
  }

  Stream<QuerySnapshot> getprofile() {
    return userProfile
        .where('user_id', isEqualTo: 'RV9lQOituND0dZ4Zfy0W')
        .snapshots();
  }

  Future updateProfile(String id) async {
    return await userProfile.doc(id).update({'color': 'sam pam wam'});
  }

  Future getColor(String id) async {
    return await userProfile.doc(id).get();
  }

  // to update records look at code in lesson 17 at 7:22
}
