import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_moneybag_2024/data/data_source/transaction_data_source.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';

class TransactionDataSourceImpl implements TransactionDataSource {
  // Firestore 인스턴스 생성
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final baseUrl = dotenv.get('Base_URL');
  final Dio _dio;

  TransactionDataSourceImpl({Dio? dio}) : _dio = dio ?? Dio();

  // TransactionRef 초기화
  CollectionReference<TransactionDetail> _transactionRef(String assetId, String userId) {
    return _firestore.collection('assets').doc(assetId).collection(userId).withConverter<TransactionDetail>(
          fromFirestore: (snapshot, _) => TransactionDetail.fromJson(snapshot.data()!),
          toFirestore: (transaction, _) {
            final transactionMap = transaction.toJson();
            // transactionMap['category'] = transaction.category.toJson();
            return transactionMap;
          },
        );
  }

  @override
  Future<void> createTransaction({required TransactionDetail transaction}) async {
    try {
      Response response = await _dio.post(
        '$baseUrl/transactions',
        data: transaction.toJson(),
      );

      if (response.statusCode == 201) {
        debugPrint("Transaction created successfully: ${response.data}");
      } else {
        debugPrint("Failed to create Transaction: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint('Error in create Transaction: $e');
    }
  }

  @override
  Future<List<TransactionDetail>> getTransactionList({required int userId}) async {
    try {
      final Options options = Options(
        headers: {
          'userId': userId,
        },
      );
      Response response = await _dio.get(
        '$baseUrl/transactions',
        options: options,
      );

      // final Map<String, dynamic> responseData = response.data['data'];
      // final List<dynamic> transactionJson = responseData['rows'];
      final Map<String, dynamic> responseData = response.data['data'];
      final results = responseData['results'];
      final List<TransactionDetail> transactionList;
      if (results is List) {
        transactionList = results.map((data) => TransactionDetail.fromJson(data)).toList();
      } else if (results is Map<String, dynamic>) {
        transactionList = [TransactionDetail.fromJson(results)];
      } else {
        return [];
      }
      return transactionList;
    } catch (e) {
      debugPrint('Error in create Transaction: $e');
      return [];
    }
  }

  @override
  Future<void> updateTransaction({required TransactionDetail transaction, required int assetId, required int userId}) async {
    await _transactionRef('assetId', 'userId').doc(transaction.transactionId.toString()).set(transaction);
  }

  @override
  Future<void> deleteTransaction({required int transactionId, required int assetId, required int userId}) async {
    await _transactionRef('assetId', 'userId').doc('transactionId').delete();
  }
}
