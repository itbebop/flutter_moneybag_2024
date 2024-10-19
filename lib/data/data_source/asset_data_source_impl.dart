import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/data/data_source/asset_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';

class AssetDataSourceImpl implements AssetDataSource {
  // Firestore 인스턴스 생성
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // TransactionRef 초기화
  CollectionReference<Asset> _assetRef(String userId) {
    return _firestore.collection('users').doc(userId).collection('assets').withConverter<Asset>(
          fromFirestore: (snapshot, _) => Asset.fromJson(snapshot.data()!),
          toFirestore: (snapshot, _) => snapshot.toJson(),
        );
  }

  @override
  Future<void> createAsset({Asset? asset, required String userId}) async {
    // asset collection 있는지 확인
    final assetsSnapshot = await _firestore.collection('users').doc(userId).collection('assets').get();

    if (assetsSnapshot.docs.isEmpty) {
      // 기본 asset이 없는 경우 생성
      await _assetRef(userId)
          .add(Asset(assetId: '0', assetName: '첫 자산', imgUrl: picSum(301), totalAmount: 0, currency: 'kr', createdAt: DateTime.now(), assetColor: 'ECB159'))
          .then((value) => _assetRef(userId).doc(value.id).update({'assetId': value.id}));
    } else {
      if (asset != null) {
        await _assetRef(userId).add(asset).then((value) => _assetRef(userId).doc(value.id).update({'assetId': value.id}));
      }
    }
  }

  @override
  Future<List<Asset>> getAssetList({required String userId, required String assetId}) async {
    return await _assetRef(userId).get().then((value) => value.docs.map((e) => e.data()).toList());
  }

  @override
  Future<void> updateAsset({required Asset asset, required String userId}) async {
    await _assetRef(userId).doc(asset.assetId).set(asset);
  }

  @override
  Future<void> deleteAsset({required String userId, required String assetId}) async {
    await _assetRef(userId).doc(assetId).delete();
  }
}
