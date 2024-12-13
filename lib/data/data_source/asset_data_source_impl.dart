import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_moneybag_2024/data/data_source/asset_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';

class AssetDataSourceImpl implements AssetDataSource {
  // Firestore 인스턴스 생성
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final baseUrl = dotenv.get('Base_URL');
  final Dio _dio;

  AssetDataSourceImpl({Dio? dio}) : _dio = dio ?? Dio();

  // TransactionRef 초기화
  final _assetRef = FirebaseFirestore.instance.collection('assets').withConverter<Asset>(
        fromFirestore: (snapshot, _) => Asset.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );
  @override
  Future<int> initAsset({required int userId}) async {
    final Options options = Options(
      headers: {
        'userId': userId,
        'action': 'createAsset',
      },
    );
    Response response = await _dio.post(
      '$baseUrl/assets',
      data: Asset(
        assetId: 0,
        assetName: '첫 자산',
        isActivated: 1,
        currency: 'KRW',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        firstColor: '#FFECB159',
        secondColor: '#FFFFC527',
      ).toJson(),
      options: options,
    );
    if (response.statusCode == 201) {
      debugPrint("Asset created successfully: ${response.data}");
      return int.parse(response.data['data']);
    } else {
      debugPrint("Failed to create asset: ${response.statusCode}");
      return 0;
    }
  }

  @override
  Future<int> createAsset({required Asset asset, required int userId}) async {
    Response response;
    // activatedAssetId가 비어있으면 기본 asset 생성
    response = await _dio.post(
      '$baseUrl/assets/$userId',
      data: asset.toJson(),
    );

    if (response.statusCode == 201) {
      debugPrint("Asset created successfully: ${response.data}");
      return int.parse(response.data['data']);
    } else {
      debugPrint("Failed to create asset: ${response.statusCode}");
      return 0;
    }
  }

  @override
  Future<List<Asset>> getAssetList({required int userId}) async {
    // 요청 헤더에 userId 추가
    final Options options = Options(
      headers: {
        'userId': userId,
      },
    );

    try {
      Response response = await _dio.get(
        '$baseUrl/assets',
        options: options,
      );

      final Map<String, dynamic> responseData = response.data['data'];
      final List<dynamic> assetJson = responseData['rows'];
      final List<Asset> assetList = assetJson.map((data) => Asset.fromJson(data)).toList();
      return assetList;
    } catch (e) {
      debugPrint('Error in getAssetList: $e');
      return [];
    }
  }

  @override
  Future<Asset> getAsset({required int assetId}) async {
    try {
      final Options options = Options(
        headers: {
          'action': 'getAsset',
        },
      );
      Response response = await _dio.get(
        '$baseUrl/assets/$assetId',
        options: options,
      );

      final assetJson = response.data['data'];
      final Asset asset = Asset.fromJson(assetJson);
      return asset;
    } catch (error) {
      throw Exception('Asset not found');
    }
  }

  @override
  Future<void> updateAsset({required Asset asset}) async {
    final Response response = await _dio.put(
      '$baseUrl/assets/${asset.assetId}',
      data: asset.toJson(),
    );
    if (response.statusCode == 201) {
      debugPrint("Asset updated successfully: ${response.data}");
    } else {
      debugPrint("Failed to update asset: ${response.statusCode}");
    }
  }

  @override
  Future<void> chageActivatedAsset({required int assetId, required bool isActivated}) async {
    await _assetRef.doc('assetId').update({'isActivated': isActivated});
  }

  @override
  Future<void> deleteAsset({required int assetId, required int userId}) async {
    await _firestore.collection('users').doc('userId').update({
      'assetIdList': FieldValue.arrayRemove([assetId]) // 특정 assetId 제거);
    });
    // 최상위 asset 문서 참조
    final DocumentReference assetDocRef = _firestore.collection('assets').doc('assetId');

    // asset과 그 하위 컬렉션들까지 모두 삭제하는 재귀 함수
    await _deleteDocumentWithSubcollections(assetDocRef);
  }

  Future<void> _deleteDocumentWithSubcollections(DocumentReference docRef) async {
    try {
      // 현재 문서의 모든 하위 컬렉션 문서들을 가져오기
      final subcollections = await _firestore.collectionGroup(docRef.id).get();
      for (final subDoc in subcollections.docs) {
        // 하위 문서에 대해 재귀 호출하여 그 문서의 하위 컬렉션도 모두 삭제
        await _deleteDocumentWithSubcollections(subDoc.reference);
      }

      // 최종적으로 현재 문서를 삭제
      await docRef.delete();
    } catch (e) {
      rethrow;
    }
  }
}
