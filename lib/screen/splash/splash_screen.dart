import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    // 상태를 마이크로 태스크로 처리
    Future.microtask(() async {
      await ref.read(userStateProvier.notifier).fetchUser();
      ref.read(assetStateProvier.notifier).fetchAsset();
    });

    // AnimationController 초기화
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this, // SingleTickerProviderStateMixin을 통해 'this' 사용 가능
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    // 애니메이션 완료 후에 Firebase Auth 상태 체크 및 라우팅
    _controller.forward().then((_) {
      // 빌드가 끝난 후에 상태 변경 처리
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _auth.authStateChanges().first.then((User? user) {
          if (user != null) {
            context.go('/main');
          } else {
            context.go('/login');
          }
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Image.network(
              picSum(401),
              width: 284,
              height: 226,
            ),
          ),
        ),
      ),
    );
  }
}
