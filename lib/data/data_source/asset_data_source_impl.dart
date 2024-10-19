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
    // user document의 assetIdList 확인
    final userDoc = await _firestore.collection('users').doc(userId).get();

    if (userDoc.exists) {
      // assetIdList가 비어있는지 확인
      final assetIdList = (userDoc.data()?['assetIdList'] as List<dynamic>?) ?? [];

      if (assetIdList.isEmpty) {
        // assetIdList가 비어있으면 기본 asset 생성
        final newAssetRef = await _assetRef.add(
          Asset(
            assetId: '0',
            assetName: '첫 자산',
            imgUrl: picSum(301),
            totalAmount: 0,
            currency: 'kr',
            createdAt: DateTime.now(),
            assetColor: 'ECB159',
            userIdList: [userId],
          ),
        );
        // assetId 업데이트
        await _assetRef.doc(newAssetRef.id).update({'assetId': newAssetRef.id});

        // user 문서의 assetIdList 업데이트
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
  Future<List<Asset>> getAssetList({required String userId, required String assetId}) async {
    return await _assetRef.get().then((value) => value.docs.map((e) => e.data()).toList());
  }

  @override
  Future<void> updateAsset({required Asset asset, required String userId}) async {
    await _assetRef.doc(asset.assetId).set(asset);
  }

  @override
  Future<void> deleteAsset({required String userId, required String assetId}) async {
    await _assetRef.doc(assetId).delete();
  }
}
