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
        createdAt: now.subtract(const Duration(days: 1)),
        updatedAt: now.subtract(const Duration(minutes: 10)),
        userId: [
          'kpbwsziudRcomCD9mLx0o4QUHQq1',
        ],
        category: transactionCategory4,
      ),
      TransactionDetail(
        transactionId: '12',
        title: '점심(피자)',
        amount: -30000,
        createdAt: now.subtract(const Duration(days: 1)),
        updatedAt: now.subtract(const Duration(minutes: 10)),
        userId: [
          'kpbwsziudRcomCD9mLx0o4QUHQq1',
        ],
        category: transactionCategory3,
      ),
      TransactionDetail(
        transactionId: '13',
        title: '파킹통장 이자',
        amount: 86000,
        createdAt: now.subtract(const Duration(days: 1)),
        updatedAt: now.subtract(const Duration(minutes: 10)),
        userId: [
          'kpbwsziudRcomCD9mLx0o4QUHQq1',
        ],
        category: transactionCategory1,
      ),
    ],
    now.subtract(const Duration(days: 2)): [
      TransactionDetail(
        transactionId: '14',
        title: '9월 월급',
        amount: 5600000,
        createdAt: now.subtract(const Duration(days: 2)),
        updatedAt: now.subtract(const Duration(minutes: 10)),
        userId: [
          'kpbwsziudRcomCD9mLx0o4QUHQq1',
        ],
        category: transactionCategory2,
      ),
      TransactionDetail(
        transactionId: '15',
        title: '미용',
        amount: -20000,
        createdAt: now.subtract(const Duration(days: 2)),
        updatedAt: now.subtract(const Duration(minutes: 10)),
        userId: [
          'kpbwsziudRcomCD9mLx0o4QUHQq1',
        ],
        category: transactionCategory2,
      ),
    ],
  };
}