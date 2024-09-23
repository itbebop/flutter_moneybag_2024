import 'package:flutter_moneybag_2024/screen/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final bottomNavIndexProvider = StateProvider<int>((ref) => 0);

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/main',
    routes: [
      GoRoute(
        path: '/main',
        name: 'main',
        builder: (context, state) => const MainScreen(), // MainPage를 경로로 설정
      ),
    ],
  );
});
