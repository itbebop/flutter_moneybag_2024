import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card_button.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card_new.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetScreen extends ConsumerStatefulWidget {
  const AssetScreen({super.key});

  @override
  ConsumerState<AssetScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends ConsumerState<AssetScreen> {
  final textEditingController = TextEditingController();
  FocusNode focusNode = FocusNode();
  final titleEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          AssetCard(),
          SizedBox(height: 16),
          // AssetCardNew(titleEditController: titleEditController),
          SizedBox(height: 16),
          AssetCardButton(),
        ],
      ),
    ));
  }
}
