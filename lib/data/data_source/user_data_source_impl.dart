import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_moneybag_2024/data/data_source/user_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class UserDataSourceImpl implements UserDataSource {
  final _userRef = FirebaseFirestore.instance.collection('user').withConverter<User>(fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!), toFirestore: (snapshot, _) => snapshot.toJson());
  final _picker = ImagePicker();

  @override
  Future<void> createUser({required User user}) async {
    await _userRef.doc(user.userId.toString()).set(user);
  }

  @override
  Future<void> signOut() async {
    await auth.FirebaseAuth.instance.signOut();
  }

  @override
  Future<User> getUser({required String userId}) async {
    final user = await _userRef.doc(userId).get().then((s) => s.data()!);
    return user;
  }

  @override
  Future<bool> existUser({required String userId}) async {
    final result = await _userRef.doc(userId).get().then((s) => s.data()!).then((value) => true).onError((error, stackTrace) => false);
    return result;
  }

  @override
  Future<void> updateUserName({required String userId, required String name}) async {
    await _userRef.doc(userId).update({'name': name});
  }

  @override
  Future<void> updateLanguage({required String lang, required String userId}) async {
    await _userRef.doc(userId).update({'language': lang});
  }

  @override
  Future<void> updatePhoto({required String userId}) async {
    XFile? xFile = await _picker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      //이미지 업로드
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child('user/$userId/profile/profile.png');

      //이미지 다운로드
      await imageRef.putFile(File(xFile.path));
      final downloadUrl = await imageRef.getDownloadURL();

      //업데이트 (이후 currentUser로 바꾸기)
      await _userRef.doc(userId).update({'imageUrl': downloadUrl});
    }
  }
}