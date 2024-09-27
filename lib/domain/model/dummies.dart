import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/enums/user_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:intl/intl.dart';

String picSum(int id) => 'https://picsum.photos/id/$id/200/200';

final user1 = User(userId: 1, name: '캐시옹', imgUrl: picSum(200), language: 'ko', userType: UserType.paid);
final user2 = User(userId: 2, name: '빌라동', imgUrl: picSum(300), language: 'ko', userType: UserType.free);
final user3 = User(userId: 3, name: '택시옹', imgUrl: picSum(400), language: 'ko', userType: UserType.free);
final user4 = User(userId: 4, name: '뤈배', imgUrl: picSum(500), language: 'ko', userType: UserType.free);

const transactionIncome1 = TransactionCategory(id: 1, name: '이자', type: AssetType.income);
const transactionIncome2 = TransactionCategory(id: 2, name: '월급', type: AssetType.income);
const transactionIncome3 = TransactionCategory(id: 3, name: '임대료', type: AssetType.income);
const transactionExpense1 = TransactionCategory(id: 4, name: '식비', type: AssetType.expense);
const transactionExpense2 = TransactionCategory(id: 5, name: '주거비', type: AssetType.expense);
const transactionExpense3 = TransactionCategory(id: 6, name: '쇼핑', type: AssetType.expense);
DateTime now = DateTime.now();

final transaction1 = TransactionDetail(
  title: '장보기',
  amount: -86000,
  imgUrl: picSum(201),
  createdAt: dateFormat.format(now),
  updatedAt: dateFormat.format(now.subtract(10.minutes)),
  user: [user1],
  assetType: AssetType.expense,
);
final transaction2 = TransactionDetail(
  title: '꽁치기에 빌려준 돈',
  amount: 360000,
  imgUrl: picSum(202),
  createdAt: dateFormat.format(now),
  updatedAt: dateFormat.format(now.subtract(10.minutes)),
  user: [user1],
  assetType: AssetType.expense,
);
final transaction3 = TransactionDetail(
  title: '커피 2잔',
  amount: -12000,
  imgUrl: picSum(203),
  createdAt: dateFormat.format(now),
  updatedAt: dateFormat.format(now.subtract(10.minutes)),
  user: [user1],
  assetType: AssetType.expense,
);
final transaction4 = TransactionDetail(
  title: '점심(피자)',
  amount: -30000,
  imgUrl: picSum(204),
  createdAt: dateFormat.format(now),
  updatedAt: dateFormat.format(now.subtract(10.minutes)),
  user: [user1],
  assetType: AssetType.expense,
);
final transaction5 = TransactionDetail(
  title: '파킹통장 이자',
  amount: 86000,
  imgUrl: picSum(205),
  createdAt: dateFormat.format(now),
  updatedAt: dateFormat.format(now.subtract(10.minutes)),
  user: [user1],
  assetType: AssetType.income,
);
final transaction6 = TransactionDetail(
  title: '9월 월급',
  amount: 5600000,
  imgUrl: picSum(206),
  createdAt: dateFormat.format(now),
  updatedAt: dateFormat.format(now.subtract(10.minutes)),
  user: [user1],
  assetType: AssetType.income,
);
