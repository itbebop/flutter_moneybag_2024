import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String imgUrl;
  final String createdAt;
  final double amount;
  const TransactionItem({super.key, required this.title, required this.imgUrl, required this.createdAt, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 255, 255, 255),
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
    );
  }
}
