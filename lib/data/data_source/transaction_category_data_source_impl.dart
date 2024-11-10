import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_category_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';

class TransactionCategoryDataSourceImpl implements TransactionCategoryDataSource {
  // Firestore 인스턴스 생성
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // TransactionRef 초기화
  CollectionReference<TransactionCategory> _transactionCategoryRef(String userId) {
    return _firestore.collection('users').doc(userId).collection('transactionCategory').withConverter<TransactionCategory>(
          fromFirestore: (snapshot, _) => TransactionCategory.fromJson(snapshot.data()!),
          toFirestore: (transactionCategory, _) {
            final transactionCategoryMap = transactionCategory.toJson();
            transactionCategoryMap['AssetType'] = transactionCategory.type.displayName;
            return transactionCategoryMap;
          },
        );
  }

  CollectionReference<TransactionCategory> _subTransactionCategoryRef(String userId, String categoryId) {
    return _firestore.collection('users').doc(userId).collection('transactionCategory').doc(categoryId).collection('subCategory').withConverter<TransactionCategory>(
      fromFirestore: (snapshot, _) {
        final data = snapshot.data();
        if (data == null) {
          throw Exception('문서가 존재하지 않거나 비어있습니다.');
        }
        return TransactionCategory.fromJson(data);
      },
      toFirestore: (transactionCategory, _) {
        final transactionCategoryMap = transactionCategory.toJson();
        transactionCategoryMap['AssetType'] = transactionCategory.type.displayName;
        return transactionCategoryMap;
      },
    );
  }

  @override
  Future<void> createTransactionCategory({required TransactionCategory transactionCategory, required String userId}) async {
    await _transactionCategoryRef(userId).add(transactionCategory).then((value) => _transactionCategoryRef(userId).doc(value.id).update({'categoryId': value.id}));
  }

  @override
  Future<List<TransactionCategory>> getTransactionCategoryList({required String userId}) async {
    final List<TransactionCategory> categories = await _transactionCategoryRef(userId).get().then((value) => value.docs.map((e) => e.data()).toList());
    return categories;
  }

  @override
  Future<void> updateTransactionCategory({required TransactionCategory transactionCategory, required String userId}) async {
    await _transactionCategoryRef(userId).doc(transactionCategory.categoryId).set(transactionCategory);
  }

  @override
  Future<void> deleteTransactionCategory({required String categoryId, required String userId}) async {
    await _transactionCategoryRef(userId).doc(categoryId).delete();
  }

  @override
  Future<void> createSubTransactionCategory({required TransactionCategory transactionCategory, required String userId, required String subCategoryId}) async {
    try {
      await _subTransactionCategoryRef(userId, transactionCategory.categoryId).doc(subCategoryId).set(transactionCategory);
    } catch (e) {
      print('하위 트랜잭션 카테고리 생성 중 오류 발생: $e');
      throw Exception('하위 트랜잭션 카테고리 생성에 실패했습니다.');
    }
  }

  @override
  Future<List<TransactionCategory>> getSubTransactionCategoryList({required String userId, required String categoryId}) async {
    final List<TransactionCategory> categories = await _subTransactionCategoryRef(userId, categoryId).get().then((value) => value.docs.map((e) => e.data()).toList());
    return categories;
  }

  @override
  Future<void> deleteSubTransactionCategory({required String categoryId, required String userId, required String subCategoryId}) {
    // TODO: implement deleteSubTransactionCategory
    throw UnimplementedError();
  }

  @override
  Future<void> updateSubTransactionCategory({required TransactionCategory transactionCategory, required String userId, required String subCategoryId}) {
    // TODO: implement updateSubTransactionCategory
    throw UnimplementedError();
  }
}
