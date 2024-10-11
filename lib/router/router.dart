import 'package:flutter_moneybag_2024/screen/login/login_screen.dart';
import 'package:flutter_moneybag_2024/screen/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// 현재 경로를 제공하는 Provider
// final currentRouteProvider = Provider<String>((ref) {
//   final router = ref.watch(routerProvider); // GoRouter를 가져옴
//   return router.; // 현재 경로를 반환
// });
final routeInformationProvider = ChangeNotifierProvider<GoRouteInformationProvider>((ref) {
  final router = ref.watch(routerProvider);
  return router.routeInformationProvider;
});

final currentRouteProvider = Provider((ref) {
  return ref.watch(routeInformationProvider).value.location;
});

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/main',
    routes: [
      GoRoute(
        path: '/main',
        name: 'main',
        builder: (context, state) => const MainScreen(), // MainPage를 경로로 설정
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
});
