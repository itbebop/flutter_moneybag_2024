import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_moneybag_2024/data/data_source/user_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class UserDataSourceImpl implements UserDataSource {
  final _userRef = FirebaseFirestore.instance.collection('users').withConverter<User>(
        fromFirestore: (snapshot, _) => User.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );
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
  Future<bool> isNewUser({required User user}) async {
    try {
      // 이메일로 User 컬렉션을 조회하여 중복된 이메일이 있는지 확인
      final querySnapshot = await _userRef.where('email', isEqualTo: user.email).get();

      if (querySnapshot.docs.isNotEmpty) {
        // 같은 이메일을 가진 문서가 존재하면 false 반환 (중복 사용자)
        return false;
      }
      // 이메일이 존재하지 않으면 새로운 사용자로 간주하고 true 반환
      return true;
    } catch (error) {
      return false; // 에러 발생 시 기본적으로 false 반환
    }
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
