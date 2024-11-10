import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_list/category_list.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_select_button.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryListScreen extends ConsumerStatefulWidget {
  const CategoryListScreen({super.key});
  @override
  ConsumerState<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends ConsumerState<CategoryListScreen> {
  final categorylistCreateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CategoryList(
                      title: '지출',
                      assetType: AssetType.expense,
                      categorylistCreateController: categorylistCreateController,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CategoryList(
                      title: '소득',
                      assetType: AssetType.income,
                      categorylistCreateController: categorylistCreateController,
                    ),
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
