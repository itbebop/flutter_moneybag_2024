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
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(userStateProvier.notifier).fetchUser());
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = ref.watch(userStateProvier);

    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            userProvider.user != null
                ? UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      // 현재 계정 이미지 set
                      backgroundImage: NetworkImage(picSum(301)),
                      backgroundColor: Colors.white,
                    ),
                    accountName: Text(userProvider.user!.name),
                    accountEmail: Text(userProvider.user!.email),
                    onDetailsPressed: () {},
                    decoration: const BoxDecoration(
                      color: UiConfig.primaryColorSurface,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40.0), bottomRight: Radius.circular(40.0)),
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 100.h,
                        child: Center(
                            child: TextButton(
                                onPressed: () {
                                  context.push('/login');
                                },
                                child: const Text('로그인을 해주세요'))),
                      ),
                      const Divider(),
                    ],
                  ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: const Text('Home'),
              onTap: () {},
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: const Text('Setting'),
              onTap: () {},
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: const Text('Q&A'),
              onTap: () {},
              trailing: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
