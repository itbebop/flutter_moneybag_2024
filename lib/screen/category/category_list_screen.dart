import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_list/category_list_fragment.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_select_button.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoryListScreen extends HookConsumerWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categorylistCreateController = TextEditingController();
    final categorylistEditController = TextEditingController();
    final tabController = useTabController(initialLength: 2);

    return Material(
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
                child: SizedBox(
              height: MediaQuery.of(context).size.height * .8,
              child: Column(
                children: [
                  TabBar(
                    controller: tabController,
                    indicatorColor: ref.watch(categoryStateProvider).assetType == AssetType.income ? UiConfig.primaryColorSurface : UiConfig.secondaryTextColor,
                    padding: const EdgeInsets.all(8),
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelPadding: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
                    labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    splashBorderRadius: BorderRadius.circular(10),
                    onTap: (value) {
                      if (value == 0) {
                        ref.read(categoryStateProvider.notifier).getTransactionCategoryByAssetType(AssetType.expense);
                      } else {
                        ref.read(categoryStateProvider.notifier).getTransactionCategoryByAssetType(AssetType.income);
                      }
                    },
                    tabs: [
                      Text(
                        '지출',
                        style: UiConfig.h4Style,
                      ),
                      Text(
                        '수입',
                        style: UiConfig.h4Style,
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        CategoryListFragment(
                          title: '지출',
                          assetType: AssetType.expense,
                          categorylistCreateController: categorylistCreateController,
                          categorylistEditController: categorylistEditController,
                        ),
                        CategoryListFragment(
                          title: '수입',
                          assetType: AssetType.income,
                          categorylistCreateController: categorylistCreateController,
                          categorylistEditController: categorylistEditController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
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
