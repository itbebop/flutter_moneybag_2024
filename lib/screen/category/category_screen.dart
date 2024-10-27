import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_list.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_select_button.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  final queryTextEditingController = TextEditingController();
  final categoryNameEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 16.h),
                  CategoryList(title: '수입', icon: HugeIcons.strokeRoundedMoneyBag02, assetType: AssetType.income, categoryNameEditController: categoryNameEditController),
                  SizedBox(height: 16.h),
                  CategoryList(
                    title: '지출',
                    icon: HugeIcons.strokeRoundedWallet03,
                    assetType: AssetType.expense,
                    categoryNameEditController: categoryNameEditController,
                  ),
                ],
              ),
            ),
          ),
          ref.watch(categoryStateProvider).isVisibleButton
              ? const AnimatedOpacity(
                  opacity: 1,
                  duration: Duration(microseconds: 300),
                  child: CategorySelectButton(),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

// 예시 데이터
final List<TransactionCategory> transactionCategories = [
  TransactionCategory(
    categoryId: '1', // 고유 ID
    name: '식비', // 유형 이름
    iconKey: picSum(201), // 이미지 URL
    type: AssetType.expense, // 자산 유형
  ),
  TransactionCategory(
    categoryId: '2',
    name: '교통비',
    iconKey: picSum(201),
    type: AssetType.expense,
  ),
  TransactionCategory(
    categoryId: '3',
    name: '주거비',
    iconKey: picSum(201),
    type: AssetType.expense,
  ),
  TransactionCategory(
    categoryId: '4',
    name: '문화생활',
    iconKey: picSum(201),
    type: AssetType.expense,
  ),
  TransactionCategory(
    categoryId: '5', // 고유 ID
    name: '쇼핑', // 유형 이름
    iconKey: picSum(201), // 이미지 URL
    type: AssetType.expense, // 자산 유형
  ),
  TransactionCategory(
    categoryId: '6',
    name: '여행',
    iconKey: picSum(201),
    type: AssetType.expense,
  ),
  TransactionCategory(
    categoryId: '7',
    name: '교육비',
    iconKey: picSum(201),
    type: AssetType.expense,
  ),
  TransactionCategory(
    categoryId: '8',
    name: '의료비',
    iconKey: picSum(201),
    type: AssetType.expense,
  ),
  TransactionCategory(
    categoryId: '9', // 고유 ID
    name: '기타', // 유형 이름
    iconKey: picSum(201), // 이미지 URL
    type: AssetType.expense, // 자산 유형
  ),
  TransactionCategory(
    categoryId: '10',
    name: '교통비1',
    iconKey: picSum(201),
    type: AssetType.expense,
  ),
];
