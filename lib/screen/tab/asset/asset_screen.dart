import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/counter_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AssetScreen extends ConsumerStatefulWidget {
  const AssetScreen({super.key});

  @override
  ConsumerState<AssetScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends ConsumerState<AssetScreen> {
  @override
  Widget build(BuildContext context) {
    return const TweenDemo();
  }
}
