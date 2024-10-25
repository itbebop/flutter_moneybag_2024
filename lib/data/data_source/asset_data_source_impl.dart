import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/data/data_source/asset_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';

class AssetDataSourceImpl implements AssetDataSource {
  // Firestore 인스턴스 생성
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // TransactionRef 초기화
  final _assetRef = FirebaseFirestore.instance.collection('assets').withConverter<Asset>(
        fromFirestore: (snapshot, _) => Asset.fromJson(snapshot.data()!),
        toFirestore: (snapshot, _) => snapshot.toJson(),
      );

  @override
  Future<void> createAsset({Asset? asset, required String userId}) async {
    final userDoc = await _firestore.collection('users').doc(userId).get();

    if (userDoc.exists) {
      // activatedAssetId가 비어있는지 확인
      final activatedAssetId = userDoc.data()?['activatedAssetId'] as String? ?? '';

      if (activatedAssetId.isEmpty) {
        // activatedAssetId가 비어있으면 기본 asset 생성
        final newAssetRef = await _assetRef.add(
          Asset(
            assetId: '0',
            assetName: '첫 자산',
            totalAmount: 0,
            totalExpense: 0,
            totalIncome: 0,
            currency: 'KRW',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            assetColor: 'ECB159',
            userIdList: [userId],
          ),
        );
        // assetId 업데이트
        await _assetRef.doc(newAssetRef.id).update({'assetId': newAssetRef.id});

        // user 문서의 assetIdList에 새 asset 추가
        await _firestore.collection('users').doc(userId).update({
          'assetIdList': FieldValue.arrayUnion([newAssetRef.id])
        });
      } else {
        // asset이 이미 존재하는 경우 새로운 asset 추가 (asset이 주어졌을 때)
        if (asset != null) {
          final newAssetRef = await _assetRef.add(asset);
          await _assetRef.doc(newAssetRef.id).update({'assetId': newAssetRef.id});

          // user 문서의 assetIdList에 새 asset 추가
          await _firestore.collection('users').doc(userId).update({
            'assetIdList': FieldValue.arrayUnion([newAssetRef.id])
          });
        }
      }
    }
  }

  @override
  Future<List<Asset>> getAssetList({required List<String> assetIdList}) async {
    // assetIdList에 있는 assetId로 자산 선택
    final assets = await Future.wait(assetIdList.map((assetId) async {
      final doc = await _assetRef.doc(assetId).get();
      return doc.data();
    }));

    // assets를 updatedAt 기준으로 정렬
    final sortedAssets = assets.whereType<Asset>().toList()..sort((a, b) => b.updatedAt.compareTo(a.updatedAt)); // updatedAt 기준 내림차순 정렬

    return sortedAssets; // 정렬된 Asset 반환
  }

  @override
  Future<Asset> getAsset({required String assetId}) async {
    final doc = await _assetRef.doc(assetId).get();
    if (doc.exists) {
      return doc.data()!;
    } else {
      throw Exception('Asset not found');
    }
  }

  @override
  Future<void> updateAsset({required Asset asset}) async {
    await _assetRef.doc(asset.assetId).set(asset);
  }

  @override
  Future<void> chageActivatedAsset({required String assetId}) {
    // TODO: implement chageActivatedAsset
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAsset({required String assetId}) async {
    await _assetRef.doc(assetId).delete();
  }
}
