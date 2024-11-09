import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_detail_list.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_select_button.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryDetailScreen extends ConsumerStatefulWidget {
  const CategoryDetailScreen({super.key});

  @override
  ConsumerState<CategoryDetailScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryDetailScreen> {
  final categoryNameCreateController = TextEditingController();
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 16.h),
                  // CategoryList(
                  //   title: '수입',
                  //   icon: HugeIcons.strokeRoundedMoneyBag02,
                  //   assetType: AssetType.income,
                  //   categoryNameCreateController: categoryNameCreateController,
                  //   categoryNameEditController: categoryNameEditController,
                  // ),

                  SizedBox(height: 16.h),
                  CategoryDetailList(
                    title: '식비',
                    icon: HugeIcons.strokeRoundedWallet03,
                    assetType: AssetType.expense,
                    categoryNameCreateController: categoryNameCreateController,
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
