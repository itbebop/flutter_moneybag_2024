import 'package:cloud_firestore/cloud_firestore.dart';
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
      final List<String> assetIdList = (userDoc.data()?['assetIdList'] as List<dynamic>).map((item) => item as String).toList();

      if (assetIdList == []) {
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
            assetColor: [236, 177, 89, 1, 255, 197, 39, 1],
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
    final sortedAssets = assets.whereType<Asset>().toList()..sort((a, b) => a.createdAt.compareTo(b.createdAt)); // updatedAt 기준 내림차순 정렬

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

  // @override
  // Future<void> deleteAsset({required String assetId, required String userId}) async {
  //   // TODO: 완전 삭제가 아니라 복원가능한 삭제로 변경예정
  //   await _deleteDocumentWithSubcollections(_assetRef.doc(assetId));

  //   await _firestore.collection('users').doc(userId).update({
  //     'assetIdList': FieldValue.arrayRemove([assetId]) // 특정 assetId 제거);
  //   });
  // }

  // Future<void> _deleteDocumentWithSubcollections(DocumentReference docRef) async {
  //   // 먼저 모든 하위 컬렉션을 삭제
  //   final subcollections = await docRef.collection(docRef.id).get();
  //   for (final subDoc in subcollections.docs) {
  //     await _deleteDocumentWithSubcollections(subDoc.reference);
  //   }

  //   // 최종적으로 현재 문서를 삭제
  //   await docRef.delete();
  // }
  @override
  Future<void> deleteAsset({required String assetId, required String userId}) async {
    await _firestore.collection('users').doc(userId).update({
      'assetIdList': FieldValue.arrayRemove([assetId]) // 특정 assetId 제거);
    });
    // 최상위 asset 문서 참조
    final DocumentReference assetDocRef = _firestore.collection('assets').doc(assetId);

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
