import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/widget/transaction_item.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';

class HomeTransactionList extends StatelessWidget {
  const HomeTransactionList({
    super.key,
    required ValueNotifier<List<TransactionDetail>> selectedEvents,
  }) : _selectedEvents = selectedEvents;

  final ValueNotifier<List<TransactionDetail>> _selectedEvents;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<TransactionDetail>>(
      valueListenable: _selectedEvents,
      builder: (context, value, _) {
        return ListView.builder(
          shrinkWrap: true, // ListView의 크기를 제한
          physics: const NeverScrollableScrollPhysics(), // 스크롤 비활성화
          itemCount: value.length,
          itemBuilder: (context, index) {
            final transaction = value[index];

            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Column(
                children: [
                  TransactionItem(
                    title: transaction.title,
                    amount: transaction.amount,
                    imgUrl: transaction.category.imgUrl,
                    createdAt: detailDateFormat.format(transaction.updatedAt!),
                    category: TransactionCategory(
                      id: '1',
                      name: '이자',
                      type: AssetType.income,
                      imgUrl: picSum(201),
                      userId: transaction.userId.first, // TODO: List로 맞춰야하는지 확인
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}