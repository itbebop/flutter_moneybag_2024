import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_moneybag_2024/data/data_source/pallete_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/user_pallete.dart';

class PalleteDataSourceImpl implements PalleteDataSource {
  final baseUrl = dotenv.get('Base_URL');
  final Dio _dio;

  PalleteDataSourceImpl({Dio? dio}) : _dio = dio ?? Dio();

  @override
  Future<void> createUserPallete({required int userId}) async {
    final Response response = await _dio.post(
      '$baseUrl/pallete', // 엔드포인트 설정
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
  Future<List<UserPallete>> getUserPallete({required int userId}) async {
    try {
      Response response = await _dio.get(
        '$baseUrl/pallete/$userId',
      );

      final Map<String, dynamic> responseData = response.data['data'];
      final List<dynamic> colorList = responseData['rows'];
      final List<UserPallete> userPallete = colorList.map((data) => UserPallete.fromJson(data)).toList();

      return userPallete;
    } on DioException catch (e) {
      debugPrint("getUserPallete error: ${e.message}");
      rethrow;
    }
  }

  @override
  Future<void> updatePallete({required int userId, required UserPallete pallete}) async {
    // await _userRef.doc(userId).update({'firstColorListSave': user.firstColorListSave, 'secondColorListSave': user.secondColorListSave});
  }
}
