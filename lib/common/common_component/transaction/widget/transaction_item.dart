import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/data/icon_map.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_detail.dart';
import 'package:hugeicons/hugeicons.dart';

class TransactionItem extends StatelessWidget {
  final TransactionDetail transaction;
  const TransactionItem({
    super.key,
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
              color: transaction.amount < 0 ? UiConfig.secondaryColor : UiConfig.incomeTagColor,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
            ),
            height: 16,
            width: 70,
            child: Center(
                child: Text(
              transaction.category!.categoryName,
              style: UiConfig.extraSmallStyle.copyWith(color: UiConfig.whiteColor),
            )),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
              color: UiConfig.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.08),
                  spreadRadius: 0,
                  blurRadius: 5.0,
                  offset: const Offset(10, 10), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: HugeIcon(icon: iconMap[transaction.category?.iconKey], color: transaction.amount < 0 ? UiConfig.secondaryTextColor : UiConfig.primaryColor)),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(transaction.memo, style: UiConfig.h4Style),
                          Text(detailDateFormat.format(transaction.createdAt),
                              style: UiConfig.smallStyle.copyWith(
                                color: UiConfig.color[700],
                              )),
                        ],
                      ),
                    ],
                  ),
                  Text(transaction.amount.toComma())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
