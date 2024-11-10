import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_detail/category_detail_list.dart';
import 'package:flutter_moneybag_2024/screen/category/component/category_select_button.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoryDetailScreen extends ConsumerStatefulWidget {
  final TransactionCategory category;
  const CategoryDetailScreen(
    this.category, {
    super.key,
  });

  @override
  ConsumerState<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends ConsumerState<CategoryDetailScreen> {
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
              child: CategoryDetailList(
                subCategory: widget.category,
                categoryNameCreateController: categoryNameCreateController,
                categoryNameEditController: categoryNameEditController,
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
