import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/transaction_item.dart';
import 'package:flutter_moneybag_2024/domain/model/dummies.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      primary: false,
      children: [
        TransactionItem(
          title: transaction1.title,
          imgUrl: transaction1.imgUrl,
          createdAt: transaction1.createdAt,
          amount: transaction1.amount,
        ),
        const SizedBox(height: 16),
        TransactionItem(
          title: transaction2.title,
          imgUrl: transaction2.imgUrl,
          createdAt: transaction2.createdAt,
          amount: transaction2.amount,
        ),
        const SizedBox(height: 16),
        TransactionItem(
          title: transaction3.title,
          imgUrl: transaction3.imgUrl,
          createdAt: transaction3.createdAt,
          amount: transaction3.amount,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
