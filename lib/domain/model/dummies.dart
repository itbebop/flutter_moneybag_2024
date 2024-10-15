import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/enums/user_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/domain/model/user.dart';

final user1 = User(
  userId: '1',
  name: '캐시옹',
  imgUrl: picSum(200),
  language: 'ko',
  userType: UserType.paid,
  email: 'abc@naver.com',
);
final user2 = User(
  userId: '2',
  name: '빌라동',
  imgUrl: picSum(300),
  language: 'ko',
  userType: UserType.free,
  email: 'abc@naver.com',
);
final user3 = User(
  userId: '3',
  name: '택시옹',
  imgUrl: picSum(400),
  language: 'ko',
  userType: UserType.free,
  email: 'abc@naver.com',
);
final user4 = User(
  userId: '4',
  name: '뤈배',
  imgUrl: picSum(500),
  language: 'ko',
  userType: UserType.free,
  email: 'abc@naver.com',
);

final transactionIncome1 = TransactionCategory(id: '1', name: '이자', type: AssetType.income, imgUrl: picSum(201), userId: 'kpbwsziudRcomCD9mLx0o4QUHQq1');
final transactionIncome2 = TransactionCategory(id: '2', name: '월급', type: AssetType.income, imgUrl: picSum(202), userId: 'kpbwsziudRcomCD9mLx0o4QUHQq1');
final transactionIncome3 = TransactionCategory(id: '3', name: '임대료', type: AssetType.income, imgUrl: picSum(202), userId: 'kpbwsziudRcomCD9mLx0o4QUHQq1');
final transactionExpense1 = TransactionCategory(id: '4', name: '식비', type: AssetType.expense, imgUrl: picSum(202), userId: 'kpbwsziudRcomCD9mLx0o4QUHQq1');
final transactionExpense2 = TransactionCategory(id: '5', name: '주거비', type: AssetType.expense, imgUrl: picSum(202), userId: 'kpbwsziudRcomCD9mLx0o4QUHQq1');
final transactionExpense3 = TransactionCategory(id: '6', name: '쇼핑', type: AssetType.expense, imgUrl: picSum(202), userId: 'kpbwsziudRcomCD9mLx0o4QUHQq1');
DateTime now = DateTime.now();
final transactionCategory1 = TransactionCategory(id: '1', name: '이자', type: AssetType.income, imgUrl: picSum(202), userId: 'kpbwsziudRcomCD9mLx0o4QUHQq1');
final transactionCategory2 = TransactionCategory(id: '1', name: '월급', type: AssetType.income, imgUrl: picSum(202), userId: 'kpbwsziudRcomCD9mLx0o4QUHQq1');
final transactionCategory3 = TransactionCategory(id: '1', name: '식비', type: AssetType.expense, imgUrl: picSum(202), userId: 'kpbwsziudRcomCD9mLx0o4QUHQq1');
final transactionCategory4 = TransactionCategory(id: '1', name: '기타', type: AssetType.expense, imgUrl: picSum(202), userId: 'kpbwsziudRcomCD9mLx0o4QUHQq1');

final transaction1 = TransactionDetail(
  transactionId: '1',
  title: '장보기',
  amount: -86000,
  createdAt: now,
  updatedAt: now.subtract(10.minutes),
  userId: ['kpbwsziudRcomCD9mLx0o4QUHQq1'],
  category: transactionCategory3,
);
final transaction2 = TransactionDetail(
  transactionId: '2',
  title: '빌려준 돈',
  amount: 360000,
  createdAt: now,
  updatedAt: now.subtract(10.minutes),
  userId: ['kpbwsziudRcomCD9mLx0o4QUHQq1'],
  category: transactionCategory4,
);
final transaction3 = TransactionDetail(
  transactionId: '3',
  title: '커피 2잔',
  amount: -12000,
  createdAt: now.subtract(1.days),
  updatedAt: now.subtract(10.minutes),
  userId: ['kpbwsziudRcomCD9mLx0o4QUHQq1'],
  category: transactionCategory4,
);
final transaction4 = TransactionDetail(
  transactionId: '4',
  title: '점심(피자)',
  amount: -30000,
  createdAt: now.subtract(1.days),
  updatedAt: now.subtract(10.minutes),
  userId: ['kpbwsziudRcomCD9mLx0o4QUHQq1'],
  category: transactionCategory3,
);
final transaction5 = TransactionDetail(
  transactionId: '5',
  title: '파킹통장 이자',
  amount: 86000,
  createdAt: now.subtract(1.days),
  updatedAt: now.subtract(10.minutes),
  userId: ['kpbwsziudRcomCD9mLx0o4QUHQq1'],
  category: transactionCategory1,
);
final transaction6 = TransactionDetail(
  transactionId: '6',
  title: '9월 월급',
  amount: 5600000,
  createdAt: now.subtract(2.days),
  updatedAt: now.subtract(10.minutes),
  userId: ['kpbwsziudRcomCD9mLx0o4QUHQq1'],
  category: transactionCategory2,
);
final transaction7 = TransactionDetail(
  transactionId: '7',
  title: '미용',
  amount: -20000,
  createdAt: now.subtract(2.days),
  updatedAt: now.subtract(10.minutes),
  userId: ['kpbwsziudRcomCD9mLx0o4QUHQq1'],
  category: transactionCategory4,
);
final transaction8 = TransactionDetail(
  transactionId: '8',
  title: '이자',
  amount: 210000,
  createdAt: now.subtract(3.days),
  updatedAt: now.subtract(10.minutes),
  userId: ['kpbwsziudRcomCD9mLx0o4QUHQq1'],
  category: transactionCategory1,
);
final transaction9 = TransactionDetail(
  transactionId: '9',
  title: '9월 월급',
  amount: 5600000,
  createdAt: now.subtract(5.days),
  updatedAt: now.subtract(10.minutes),
  userId: ['kpbwsziudRcomCD9mLx0o4QUHQq1'],
  category: transactionCategory2,
);
final transaction10 = TransactionDetail(
  transactionId: '10',
  title: '9월 월급',
  amount: 5600000,
  createdAt: now.subtract(6.days),
  updatedAt: now.subtract(10.minutes),
  userId: ['kpbwsziudRcomCD9mLx0o4QUHQq1'],
  category: transactionCategory2,
);
final transactionList = [
  transaction1,
  transaction2,
  transaction3,
  transaction4,
  transaction5,
  transaction6,
  transaction7,
  transaction8,
  transaction9,
  transaction10,
];
