import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/asset_card_new.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/component/color_picker_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetCreateScreen extends ConsumerStatefulWidget {
  const AssetCreateScreen({super.key});

  @override
  ConsumerState<AssetCreateScreen> createState() => _AssetCreateScreenState();
}

class _AssetCreateScreenState extends ConsumerState<AssetCreateScreen> {
  final titleEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              AssetCardNew(
                titleEditController: titleEditController,
              ),
              const ColorPickerWidget(isFirst: true),
              const ColorPickerWidget(isFirst: false),
            ],
          ),
        ),
      ),
    );
  }
}
