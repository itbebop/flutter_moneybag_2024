import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/theme/ui_config.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String createdAt;
  final double amount;
  final TransactionCategory category;
  const TransactionItem({super.key, required this.title, required this.imgUrl, required this.createdAt, required this.amount, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: UiConfig.secondaryColorSurface,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)),
            ),
            height: 16,
            width: 70,
            child: Center(
                child: Text(
              category.name,
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
                          child: Image.network(imgUrl),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title, style: UiConfig.h4Style),
                          Text(createdAt,
                              style: UiConfig.smallStyle.copyWith(
                                color: UiConfig.color[700],
                              )),
                        ],
                      ),
                    ],
                  ),
                  Text(amount.toString())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
