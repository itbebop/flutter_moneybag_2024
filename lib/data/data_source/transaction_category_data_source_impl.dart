import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_category_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';

class TransactionCategoryDataSourceImpl implements TransactionCategoryDataSource {
  // Firestore 인스턴스 생성
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final baseUrl = dotenv.get('Base_URL');
  final Dio _dio;

  TransactionCategoryDataSourceImpl({Dio? dio}) : _dio = dio ?? Dio();
  // TransactionRef 초기화
  CollectionReference<TransactionCategory> _transactionCategoryRef(String userId) {
    return _firestore.collection('users').doc(userId).collection('transactionCategory').withConverter<TransactionCategory>(
          fromFirestore: (snapshot, _) => TransactionCategory.fromJson(snapshot.data()!),
          toFirestore: (transactionCategory, _) {
            final transactionCategoryMap = transactionCategory.toJson();
            transactionCategoryMap['AssetType'] = transactionCategory.assetType.displayName;
            return transactionCategoryMap;
          },
        );
  }

  @override
  Future<void> createTransactionCategory({required TransactionCategory transactionCategory}) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/categories',
        data: transactionCategory.toJson(),
      );

      if (response.statusCode == 201) {
        debugPrint("Category created successfully: ${response.data}");
      } else {
        debugPrint("Failed to create Category: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint('Error in create Category: $e');
    }
  }

  @override
  Future<List<TransactionCategory>> getTransactionCategoryList({required int userId}) async {
    final List<TransactionCategory> categories = await _transactionCategoryRef('userId').get().then((value) => value.docs.map((e) => e.data()).toList());
    return categories;
  }

  @override
  Future<void> updateTransactionCategory({required TransactionCategory transactionCategory}) async {
    await _transactionCategoryRef('userId').doc('transactionCategory.categoryId').set(transactionCategory);
  }

  @override
  Future<void> deleteTransactionCategory({required int categoryId}) async {
    await _transactionCategoryRef('userId').doc('categoryId').delete();
  }
}
