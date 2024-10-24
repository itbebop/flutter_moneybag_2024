import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DrawerWidget extends ConsumerStatefulWidget {
  static const minHeightForScrollView = 380;

  const DrawerWidget({
    super.key,
  });

  @override
  ConsumerState<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends ConsumerState<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final userState = ref.watch(userStateProvider); // 상태를 watch하여 UI에 반영

    return SafeArea(
      child: Material(
        color: Colors.transparent,
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
                            backgroundImage: NetworkImage(picSum(301)), // 사용자 이미지
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
                  leading: Icon(Icons.home, color: Colors.grey[850]),
                  title: const Text('카테고리 관리'),
                  onTap: () {
                    context.push('/category');
                  },
                  trailing: const Icon(Icons.add),
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.grey[850]),
                  title: const Text('로그인'),
                  onTap: () async {
                    context.push('/login');
                  },
                  trailing: const Icon(Icons.add),
                ),
                ListTile(
                  leading: Icon(Icons.logout, color: Colors.grey[850]),
                  title: const Text('로그아웃'),
                  onTap: () async {
                    await ref.read(userStateProvider.notifier).logout();
                  },
                  trailing: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
