import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/common/common_component/transaction/riverpod/transaction_state_notifier.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/domain/enums/asset_types.dart';
import 'package:flutter_moneybag_2024/domain/model/asset.dart';
import 'package:flutter_moneybag_2024/screen/category/riverpod/category_state_notifier.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class DrawerWidget extends ConsumerStatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const DrawerWidget({
    super.key,
    required this.scaffoldKey,
  });

  @override
  ConsumerState<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends ConsumerState<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userStateProvider); // 상태를 watch하여 UI에 반영
    // final assetProvider = ref.watch(assetStateProvier);
    return SafeArea(
      child: Material(
        color: const Color.fromARGB(0, 110, 42, 42),
        child: Column(
          children: [
            SizedBox(
              height: 200.h,
              child: userState.user == null
                  ? const SizedBox()
                  : ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        UserAccountsDrawerHeader(
                          currentAccountPicture: CircleAvatar(
                            backgroundImage: NetworkImage(userState.user!.imgUrl), // 사용자 이미지
                            backgroundColor: Colors.white,
                          ),
                          accountName: Text(userState.user!.name),
                          accountEmail: Text(userState.user!.email),
                          onDetailsPressed: () {},
                          decoration: const BoxDecoration(
                            color: UiConfig.primaryColorSurface,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40.0),
                              bottomRight: Radius.circular(40.0),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            Column(
              children: [
                ListTile(
                  leading: const HugeIcon(
                    icon: HugeIcons.strokeRoundedFile02,
                    color: UiConfig.black,
                  ),
                  title: const Text('카테고리 관리'),
                  onTap: () async {
                    await ref.read(categoryStateProvider.notifier).getTransactionCategoriesByAssetType(AssetType.expense);
                    context.push('/category_list');
                  },
                ),
                if (userState.user == null)
                  ListTile(
                    leading: const HugeIcon(
                      icon: HugeIcons.strokeRoundedLogin01,
                      color: UiConfig.black,
                    ),
                    title: const Text('로그인'),
                    onTap: () async {
                      context.push('/login');
                    },
                  ),
                const Divider(),
                StreamBuilder<List<Asset>>(
                    stream: ref.watch(assetStateProvier.notifier).getAssetList(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('잠시 후에 다시 시도해주세요')),
                          );
                        });
                        return const Center(child: Text('데이터가 없습니다.'));
                      }
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator()); // 로딩 상태 처리 추가
                      }
                      final assetList = snapshot.data!;
                      return SizedBox(
                        height: 200.h,
                        child: ListView.builder(
                            itemCount: assetList.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    leading: const HugeIcon(
                                      icon: HugeIcons.strokeRoundedMoneyBag02,
                                      color: UiConfig.black,
                                    ),
                                    title: Text(
                                      assetList[index].assetName,
                                    ),
                                    trailing: Checkbox(
                                        value: assetList[index].isActivated == 1 ? true : false,
                                        onChanged: (value) async {
                                          await ref.read(assetStateProvier.notifier).tapCheckBox(assetList[index].assetId, value!);
                                          // 1초 후에 다른 함수 실행
                                          await ref.read(userStateProvider.notifier).fetchUser();
                                          await ref.read(assetStateProvier.notifier).fetchAsset();
                                        }),
                                  ),
                                ],
                              );
                            }),
                      );
                    }),
                const Divider(),
                if (userState.user != null)
                  ListTile(
                    leading: const HugeIcon(
                      icon: HugeIcons.strokeRoundedLogoutSquare01,
                      color: UiConfig.black,
                    ),
                    title: const Text('로그아웃'),
                    onTap: () async {
                      ref.read(assetStateProvier.notifier).logout();
                      await ref.read(userStateProvider.notifier).logout();
                      ref.read(transactionStateProvider.notifier).clearTransactions(); // 트랜잭션 초기화
                      widget.scaffoldKey.currentState!.closeDrawer();
                      // if (mounted) ref.read(userStateProvider.notifier).showLogoutSnackbar(context);
                    },
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
