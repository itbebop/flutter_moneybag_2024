import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/core/enum/login_platform.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/screen/login/login_screen_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
// ignore: unused_import
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
// ignore: library_prefixes, unused_import
import 'package:firebase_auth/firebase_auth.dart' as Auth;

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(minHeight: 1.sh),
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      '로그인하여 다양한 여행정보를\n 탐색해 보세요',
                      textAlign: TextAlign.center,
                      style: UiConfig.h4Style.copyWith(color: UiConfig.black.shade700),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Card(
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      elevation: 2,
                      child: InkWell(
                        onTap: () async {
                          await ref.read(loginScreenStateProvider.notifier).login(platform: LoginPlatform.kakao);
                          ref.read(userStateProvier.notifier).fetchUser();
                          if (ref.read(loginScreenStateProvider).user == null) {
                            return;
                          } else {
                            // 유저 정보 있으면 main으로 이동
                            if (context.mounted) context.go('/main');
                          }
                        },
                        child: Image.asset(
                          'assets/image/login/kakao_login_icon.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Card(
                      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      elevation: 2,
                      child: InkWell(
                        onTap: () async {
                          await ref.read(loginScreenStateProvider.notifier).login(platform: LoginPlatform.google);
                          ref.read(userStateProvier.notifier).fetchUser();
                          if (ref.read(loginScreenStateProvider).user == null) {
                            return;
                          } else {
                            if (context.mounted) context.go('/main');
                          }
                        },
                        child: Image.asset(
                          'assets/image/login/google_login_icon.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // viewModel.isLoading ? Container(
              //   color: UiConfig.black.shade900.withOpacity(0.5),
              //   child: const Center(
              //       child: SpinKitFadingCircle(
              //         color: UiConfig.primaryColor,
              //       )
              //   ),
              // ) : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
