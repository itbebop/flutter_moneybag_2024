import 'package:flutter_moneybag_2024/domain/model/dummies.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';

Map<DateTime, List<TransactionDetail>> generateSampleTransactions() {
  DateTime now = DateTime.now();
  return {
    now: [],
    now.subtract(const Duration(days: 1)): [
      TransactionDetail(
        transactionId: '11',
        title: '커피 2잔',
        amount: -12000,
        imgUrl: 'https://picsum.photos/203',
        createdAt: now.subtract(const Duration(days: 1)),
        updatedAt: now.subtract(const Duration(minutes: 10)),
        user: [user1],
        category: transactionCategory4,
      ),
      TransactionDetail(
        transactionId: '12',
        title: '점심(피자)',
        amount: -30000,
        imgUrl: 'https://picsum.photos/204',
        createdAt: now.subtract(const Duration(days: 1)),
        updatedAt: now.subtract(const Duration(minutes: 10)),
        user: [user1],
        category: transactionCategory3,
      ),
      TransactionDetail(
        transactionId: '13',
        title: '파킹통장 이자',
        amount: 86000,
        imgUrl: 'https://picsum.photos/206',
        createdAt: now.subtract(const Duration(days: 1)),
        updatedAt: now.subtract(const Duration(minutes: 10)),
        user: [user1],
        category: transactionCategory1,
      ),
    ],
    now.subtract(const Duration(days: 2)): [
      TransactionDetail(
        transactionId: '14',
        title: '9월 월급',
        amount: 5600000,
        imgUrl: 'https://picsum.photos/206',
        createdAt: now.subtract(const Duration(days: 2)),
        updatedAt: now.subtract(const Duration(minutes: 10)),
        user: [user1, user2],
        category: transactionCategory2,
      ),
      TransactionDetail(
        transactionId: '15',
        title: '미용',
        amount: -20000,
        imgUrl: 'https://picsum.photos/206',
        createdAt: now.subtract(const Duration(days: 2)),
        updatedAt: now.subtract(const Duration(minutes: 10)),
        user: [user1],
        category: transactionCategory2,
      ),
    ],
  };
}
