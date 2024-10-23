import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/transaction_category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String base64Image =
        'data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgZmlsbC1ydWxlPSJldmVub2RkIiBjbGlwLXJ1bGU9ImV2ZW5vZGQiPjxwYXRoIGQ9Ik0xNy43NjEgMTAuNDkxYy0xLjIxMi4wMDgtMi4xMzctLjEyNi0yLjg5OC44NDlsLTIuNDI0IDMuMDI2LS42MzUtLjgxIDIuMjczLTIuODM3Yy43NTItLjk2My40LTEuODQzLjEyNS0zLjAxNS0uMjY4LTEuMTM2LjM0Mi0xLjYwNC43OS0yLjA2OWw0LjYwNyAzLjU5OWMtLjM0Ni41NjUtLjYzNCAxLjI0OS0xLjgzOCAxLjI1N3ptLS41NjkgMTIuNDA2Yy0uMTI0LjA5Ny0uNDcxLjIwOS0uNzAyLS4wODZsLTguMjItMTAuMzg2LTEuODM5IDEuNDM3Yy0yLjk5Ni01LjEzNC01LjQyNS0xMC44OTItNS40OTktMTIuNTExbDE2LjM0NyAyMC44NDRjLjE3LjIxOC4xMzEuNTMyLS4wODcuNzAyem0tMTEuNTIyLS4wOTRjLS4xNy4yMTctLjQ4NS4yNTUtLjcwNi4wODMtLjIxOC0uMTcyLS4yNTMtLjQ4Mi0uMDgzLS43bDQuOTU2LTYuMTcyLjYzOS44MDQtNC44MDYgNS45ODV6bTE3LjYzMS0xOS41NmwtMy4xNjMgNS4xNDYtMS4wNTUtLjgyNyAzLjY5Mi00LjczLS43ODgtLjYxNi0zLjY5NCA0LjcyOS0uNzkxLS42MTggMy42OTctNC43MjctLjc4OS0uNjE1LTMuNjk4IDQuNzI1LTEuMDE3LS43OTUgNC4xNjMtNC4zNTktLjcxNS0uNTYycy0zLjU4MiAzLjU5NS01LjM0MyA1LjQzOWMtLjYxNi42NDYtLjc3NiAxLjYyOS0uNTcxIDIuNS4yNzcgMS4xNzcuNDg1IDEuNjI2LjA2IDIuMTdsLTIuMTE5IDIuNjQ3Yy00LjQyMS01LjYyNy05LjIyNi0xMS43MzYtOS43NDgtMTIuMzkzLS4xODEtLjIyOC0uNDI4LS4zNDQtLjY3My0uMzQ0LS44MjQgMC0uNzM5Ljk1Mi0uNzM5Ljk3OSAwIDIuNDE1IDIuOTg1IDkuMTkyIDYuMTQzIDE0LjM1M2wxLjk0My0xLjUxOSAxLjEwMiAxLjM4NS01LjEwNSA2LjM2Yy0uNTEuNjUyLS4zOTkgMS41OTEuMjU2IDIuMTAzLjI3Ni4yMTUuNjAzLjMyLjkyNy4zMi40NDYgMCAuODg3LS4xOTggMS4xODItLjU3Nmw0LjY1Ni01Ljc5OCA0LjU4OSA1LjgwNmMuMjguMzYuNjU1LjUzNSAxLjAzMS41NjguMzkzLjAzNS43ODctLjA4NCAxLjA3NC0uMzA5LjY1My0uNTEuNzY5LTEuNDUzLjI1OS0yLjEwNi0uOTYxLTEuMjMxLTIuODI2LTMuNjQ2LTQuOTkzLTYuNDA2bDIuNTc3LTMuMjE4Yy40MzItLjU1My45MDYtLjQ1NyAyLjExNy0uNDY0LjkwOC0uMDA2IDEuODU1LS4zOTYgMi4zMzQtMS4xNjcgMS4zNDgtMi4xNzUgMy44OTgtNi41MzUgMy44OTgtNi41MzVsLS42OTktLjU0NnoiIGZpbGw9IiMwMzA0MDUiLz48L3N2Zz4='; // Base64 문자열
    final String base64Str = base64Image.split(',').last;
    final Uint8List bytes = base64.decode(base64Str);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearchBar(),
            SizedBox(height: 16.h),
            const Text('수입'),
            SizedBox(height: 16.h),
            // TransactionCategory 타입의 GridView.builder 추가
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 열의 개수
                  childAspectRatio: 1, // 아이템 비율
                ),
                itemCount: transactionCategories.length + 1, // '추가' 버튼을 포함하기 위해 1 증가
                itemBuilder: (context, index) {
                  if (index < transactionCategories.length) {
                    final category = transactionCategories[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 40,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(20)),
                                child: Image.network(category.imgUrl),
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              category.name,
                              style: UiConfig.bodyStyle,
                            ),
                            Text(
                              '총 20개',
                              style: UiConfig.smallStyle.copyWith(
                                color: UiConfig.greyColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    // '추가' 버튼
                    return Card(
                      color: UiConfig.primaryColorSurface, // 색상 변경
                      child: InkWell(
                        onTap: () {
                          // 추가 버튼 클릭 시 동작
                          // 예: 카테고리 추가 화면으로 이동
                        },
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: UiConfig.whiteColor,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 예시 데이터
final List<TransactionCategory> transactionCategories = [
  TransactionCategory(
    categoryId: '1', // 고유 ID
    name: '식비', // 유형 이름
    imgUrl: picSum(201), // 이미지 URL
    type: AssetType.expense, // 자산 유형
  ),
  TransactionCategory(
    categoryId: '2',
    name: '교통비',
    imgUrl: picSum(201),
    type: AssetType.expense,
  ),
  TransactionCategory(
    categoryId: '3',
    name: '주거비',
    imgUrl: picSum(201),
    type: AssetType.expense,
  ),
  TransactionCategory(
    categoryId: '4',
    name: '문화생활',
    imgUrl: picSum(201),
    type: AssetType.expense,
  ),
];
