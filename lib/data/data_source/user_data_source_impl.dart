import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
  final baseUrl = dotenv.get('Base_URL');
  final Dio _dio;

  UserDataSourceImpl({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<int> createUser({required User user}) async {
    if (user.imgUrl.isEmpty) {
      user = user.copyWith(imgUrl: 'https://ui-avatars.com/api/?name=${Uri.encodeComponent(user.name)}&size=50');
    }
    final userJson = user.toJson();
    final Options options = Options(
      headers: {
        'action': 'createUser',
      },
    );
    final Response response = await _dio.post(
      '$baseUrl/users', // 엔드포인트 설정
      data: userJson,
      options: options,
    );
    try {
      if (response.statusCode == 201) {
        debugPrint("User created successfully: ${response.data}");
        user = user.copyWith(userId: int.parse(response.data['data']));
        await _userRef.doc(user.uid).set(user);
      } else {
        debugPrint("Failed to create user: ${response.statusCode}");
      }
    } on DioException catch (e) {
      debugPrint("Dio error: ${e.message}");
      if (e.response != null) {
        debugPrint("Error details: ${e.response?.data}");
      }
    } catch (e) {
      debugPrint("Unexpected error: $e");
    }
    return int.parse(response.data['data']);
  }

  @override
  Future<void> createUserPallete({required int userId}) async {
    final Options options = Options(
      headers: {
        'userId': userId,
        'action': 'createUserPallete',
      },
    );
    final Response response = await _dio.post(
      '$baseUrl/users', // 엔드포인트 설정
      options: options,
    );
    try {
      if (response.statusCode == 201) {
        debugPrint("Pallete created successfully: ${response.data}");
      } else {
        debugPrint("Failed to create Pallete: ${response.statusCode}");
      }
    } on DioException catch (e) {
      debugPrint("Dio error: ${e.message}");
      if (e.response != null) {
        debugPrint("Error details: ${e.response?.data}");
      }
    }
  }

  @override
  Future<void> signOut() async {
    await auth.FirebaseAuth.instance.signOut();
  }

  @override
  Future<int> getUserId({required String uid}) async {
    final user = await _userRef.doc(uid).get().then((s) => s.data()!);
    return user.userId;
  }

  @override
  Future<User> getUser({required String uid}) async {
    final userId = await getUserId(uid: uid);
    final Options options = Options(
      headers: {
        'action': 'getUser',
      },
    );

    Response response = await _dio.get(
      '$baseUrl/users/$userId',
      options: options,
    );
    final userJson = response.data['data'];
    final user = User.fromJson(userJson);
    return user;
  }

  @override
  Future<List<String>> getUserPallete({required int userId}) async {
    final Options options = Options(
      headers: {
        'action': 'getUserPallete',
      },
    );

    Response response = await _dio.get(
      '$baseUrl/users/$userId',
      options: options,
    );
    final List<String> colorList = response.data['data'];
    return colorList;
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
  Future<void> updateUserName({required int userId, required String name}) async {
    await _userRef.doc('userId').update({'name': name});
  }

  @override
  Future<void> updateColorList({required int userId, required User user}) async {
    // await _userRef.doc(userId).update({'firstColorListSave': user.firstColorListSave, 'secondColorListSave': user.secondColorListSave}); // TODO: user_color
  }

  @override
  Future<void> updateLanguage({required String lang, required int userId}) async {
    await _userRef.doc('userId').update({'language': lang});
  }

  @override
  Future<void> updatePhoto({required int userId}) async {
    XFile? xFile = await _picker.pickImage(source: ImageSource.gallery);
    if (xFile != null) {
      //이미지 업로드
      final storageRef = FirebaseStorage.instance.ref();
      final imageRef = storageRef.child('user/$userId/profile/profile.png');

      //이미지 다운로드
      await imageRef.putFile(File(xFile.path));
      final downloadUrl = await imageRef.getDownloadURL();

      //업데이트 (이후 currentUser로 바꾸기)
      await _userRef.doc('userId').update({'imageUrl': downloadUrl});
    }
  }
}
