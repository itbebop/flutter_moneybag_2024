import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:go_router/go_router.dart';

class DrawerWidget extends StatefulWidget {
  static const minHeightForScrollView = 380;

  const DrawerWidget({
    super.key,
  });

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLogin = false;
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            isLogin
                ? UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      // 현재 계정 이미지 set
                      backgroundImage: NetworkImage(picSum(301)),
                      backgroundColor: Colors.white,
                    ),
                    accountName: const Text('GANGPRO'),
                    accountEmail: const Text('gangpro@email.com'),
                    onDetailsPressed: () {
                      print('arrow is clicked');
                    },
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
                                  context.go('/login');
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
              onTap: () {
                print('Home is clicked');
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: const Text('Setting'),
              onTap: () {
                print('Setting is clicked');
              },
              trailing: const Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: const Text('Q&A'),
              onTap: () {
                print('Q&A is clicked');
              },
              trailing: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
