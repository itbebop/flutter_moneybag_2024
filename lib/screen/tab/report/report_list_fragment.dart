import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/transaction_list.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReportListFragment extends HookConsumerWidget {
  const ReportListFragment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(children: const [
      Row(
        children: [],
      ),
      TransactionList()
    ]);
  }
}
