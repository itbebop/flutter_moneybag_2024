import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    // ProviderScope를 포함하여 GoRouter를 사용한 앱 구조로 변경
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: ProviderScope(
        child: Consumer(
          builder: (context, ref, _) {
            final router = ref.watch(routerProvider);
            return MaterialApp.router(
                locale: const Locale('ko'),
                routerConfig: router, // GoRouter 설정
                theme: ThemeData(
                  scaffoldBackgroundColor: UiConfig.backgroundColor,
                ));
          },
        ),
      ),
    );
  }
}
