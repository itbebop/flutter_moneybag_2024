import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_list/category_list_item.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_select_button.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

class CategoryListScreen extends ConsumerStatefulWidget {
  const CategoryListScreen({super.key});
  @override
  ConsumerState<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends ConsumerState<CategoryListScreen> {
  final categorylistCreateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final categoryProvider = ref.watch(categoryStateProvider);
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
                      categoryProvider: categoryProvider,
                      categorylistCreateController: categorylistCreateController,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CategoryList(
                      title: '소득',
                      assetType: AssetType.income,
                      categoryProvider: categoryProvider,
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

class CategoryList extends ConsumerWidget {
  final String title;
  final AssetType assetType;
  final CategoryState categoryProvider;
  final TextEditingController categorylistCreateController;

  const CategoryList({
    super.key,
    required this.title,
    required this.assetType,
    required this.categoryProvider,
    required this.categorylistCreateController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final inComeTransactionCategories = ref.read(categoryStateProvider.notifier).getTransactionCategory(assetType);
    final expenseTransactionCategories = ref.read(categoryStateProvider.notifier).getTransactionCategory(assetType);
    return Column(
      children: [
        Row(
          children: [
            HugeIcon(
              icon: HugeIcons.strokeRoundedHome02,
              color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
            ),
            SizedBox(width: 8.w),
            Text(
              title,
              style: UiConfig.h3Style.copyWith(
                color: assetType == AssetType.expense ? UiConfig.secondaryTextColor : UiConfig.primaryColorSurface,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        StreamBuilder<List<TransactionCategory>>(
          stream: assetType == AssetType.income ? inComeTransactionCategories.asStream() : expenseTransactionCategories.asStream(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              // 에러 발생 시 Snackbar로 메시지 표시
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('잠시 후에 다시 시도해주세요')),
                );
              });
              return const Center(child: Text('데이터가 없습니다.')); // 기본 상태로 변경
            } else if (snapshot.hasData) {
              final categories = snapshot.data!;
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return Column(
                          children: [
                            CategoryListItem(
                              assetType: assetType,
                              title: category.name,
                            ),
                            SizedBox(height: 8.h),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}
