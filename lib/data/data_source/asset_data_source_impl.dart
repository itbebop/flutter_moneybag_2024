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
      headers: {'userId': userId, 'action': 'createAsset'},
    );
    Response response = await _dio.post(
      '$baseUrl/assets',
      data: Asset(
        assetId: 0,
        assetName: '첫 자산',
        isActiveAsset: 1,
        currency: 'KRW',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        firstColor: 1,
        secondColor: 2,
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
    // 요청 헤더에 userId 추가
    final Options options = Options(
      headers: {'userId': userId, 'action': 'createAsset'},
    );

    Response response;
    // activatedAssetId가 비어있으면 기본 asset 생성
    response = await _dio.post(
      '$baseUrl/assets',
      data: asset,
    );
    response = await _dio.post(
      '$baseUrl/assets',
      data: asset.toJson(),
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
  Future<List<Asset>> getAssetList({required int userId}) async {
    print('#### getAssetList 시작');
    // 요청 헤더에 userId 추가
    print('userId in getAssetList: $userId');
    final Options options = Options(
      headers: {
        'userId': userId,
      },
    );

    Response response = await _dio.get(
      '$baseUrl/assets',
      options: options,
    );

    final jsonList = response.data['data'];
    print('### jsonList: $jsonList');

    // jsonList가 빈 리스트이거나 null일 경우 바로 빈 리스트 반환
    if (jsonList == null || jsonList.isEmpty) {
      return [];
    }

    // jsonList를 Asset 객체 리스트로 변환
    final List<Asset> assetList = jsonList.map<Asset>((json) => Asset.fromJson(json)).toList();

    // 정렬된 자산 리스트 반환
    final sortedAssets = assetList..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return sortedAssets;
  }

  @override
  Future<Asset> getAsset({required int assetId}) async {
    final doc = await _assetRef.doc('assetId').get();
    if (doc.exists) {
      return doc.data()!;
    } else {
      throw Exception('Asset not found');
    }
  }

  @override
  Future<void> updateAsset({required Asset asset}) async {
    await _assetRef.doc('asset.assetId').set(asset);
  }

  @override
  Future<void> chageActivatedAsset({required int assetId, required bool isActiveAsset}) async {
    await _assetRef.doc('assetId').update({'isActiveAsset': isActiveAsset});
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
