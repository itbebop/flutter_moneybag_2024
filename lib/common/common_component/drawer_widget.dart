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
    // userStateProvider는 이미 최상위에서 선언된 프로바이더이므로 다시 선언할 필요가 없음.
    final userState = ref.watch(userStateProvier); // 상태를 watch하여 UI에 반영

    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Column(
          children: [
            SizedBox(
              height: 200.h,
              child: userState.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(), // 로딩 중인 경우 Progress Indicator 표시
                ),
                error: (error, stackTrace) => Center(
                  child: Tap(
                    onTap: () {
                      context.go('/login');
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 36, right: 36),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: UiConfig.primaryColorSurface,
                      ),
                      child: Text(
                        '다시 로그인해주세요',
                        style: UiConfig.h4Style,
                      ),
                    ),
                  ),
                ),
                data: (user) => ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(picSum(301)), // 사용자 이미지
                        backgroundColor: Colors.white,
                      ),
                      accountName: Text(user.name),
                      accountEmail: Text(user.email),
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
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.grey[850]),
              title: const Text('로그인'),
              onTap: () => context.push('/login'),
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.grey[850]),
              title: const Text('카테고리 관리'),
              onTap: () {
                context.push('/category');
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color: Colors.grey[850]),
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
