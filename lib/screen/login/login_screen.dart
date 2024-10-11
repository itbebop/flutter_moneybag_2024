import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/core/enum/login_platform.dart';
import 'package:flutter_moneybag_2024/screen/login/login_screen_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
// ignore: unused_import
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
// ignore: library_prefixes, unused_import
import 'package:firebase_auth/firebase_auth.dart' as Auth;

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final userProvider = context.watch<UserProvider>();

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
                          // await viewModel.login(platform: LoginPlatform.kakao);
                          // await userProvider.fetchUser();
                          // if (viewModel.user == null) return;
                          // if (viewModel.isNewUser) {
                          //   if (context.mounted)
                          //     context.go('/signUp', extra: viewModel.user);
                          // } else {
                          //   if (context.mounted) context.go('/');
                          // }
                          ref.read(loginScreenStateProvider.notifier).login(platform: LoginPlatform.kakao);
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
                          ref.read(loginScreenStateProvider.notifier).login(platform: LoginPlatform.google);
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
