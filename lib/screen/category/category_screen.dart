import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_list.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final queryTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16.h),
            const CategoryList(title: '수입', icon: HugeIcons.strokeRoundedMoneyBag02, assetType: AssetType.income),
            SizedBox(height: 16.h),
            const CategoryList(title: '지출', icon: HugeIcons.strokeRoundedWallet03, assetType: AssetType.expense),
          ],
        ),
      ),
    );
  }
}

// 예시 데이터
final List<TransactionCategory> transactionCategories = [
  TransactionCategory(
    categoryId: '1', // 고유 ID
    name: '식비', // 유형 이름
    imgUrl: picSum(201), // 이미지 URL
    type: AssetType.expense, // 자산 유형
  ),
  TransactionCategory(
    categoryId: '2',
    name: '교통비',
    imgUrl: picSum(201),
    type: AssetType.expense,
  ),
  TransactionCategory(
    categoryId: '3',
    name: '주거비',
    imgUrl: picSum(201),
    type: AssetType.expense,
  ),
  TransactionCategory(
    categoryId: '4',
    name: '문화생활',
    imgUrl: picSum(201),
    type: AssetType.expense,
  ),
  TransactionCategory(
    categoryId: '5', // 고유 ID
    name: '쇼핑', // 유형 이름
    imgUrl: picSum(201), // 이미지 URL
    type: AssetType.expense, // 자산 유형
  ),
  TransactionCategory(
    categoryId: '6',
    name: '여행',
    imgUrl: picSum(201),
    type: AssetType.expense,
  ),
  TransactionCategory(
    categoryId: '7',
    name: '교육비',
    imgUrl: picSum(201),
    type: AssetType.expense,
  ),
  TransactionCategory(
    categoryId: '8',
    name: '의료비',
    imgUrl: picSum(201),
    type: AssetType.expense,
  ),
  TransactionCategory(
    categoryId: '9', // 고유 ID
    name: '기타', // 유형 이름
    imgUrl: picSum(201), // 이미지 URL
    type: AssetType.expense, // 자산 유형
  ),
  TransactionCategory(
    categoryId: '10',
    name: '교통비1',
    imgUrl: picSum(201),
    type: AssetType.expense,
  ),
  TransactionCategory(
    categoryId: '11',
    name: '주거비1',
    imgUrl: picSum(201),
    type: AssetType.expense,
  ),
  TransactionCategory(
    categoryId: '12',
    name: '문화생활 중엔',
    imgUrl: picSum(201),
    type: AssetType.expense,
  ),
];
