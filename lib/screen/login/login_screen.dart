import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:flutter_moneybag_2024/core/enum/login_platform.dart';
import 'package:flutter_moneybag_2024/core/provider/user_state_notifier.dart';
import 'package:flutter_moneybag_2024/screen/login/login_screen_state_notifier.dart';
import 'package:flutter_moneybag_2024/screen/tab/asset/riverpod/asset_state_notifier.dart';
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
      appBar: AppBar(),
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
                      '',
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
                          await ref.read(userStateProvier.notifier).fetchUser();
                          await ref.read(assetStateProvier.notifier).fetchAsset();
                          final assetgList = ref.read(assetStateProvier).assetIdList;
                          if (ref.read(loginScreenStateProvider).user == null || assetgList == []) {
                            return;
                          } else {
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
                          await ref.read(userStateProvier.notifier).fetchUser();
                          await ref.read(assetStateProvier.notifier).fetchAsset();
                          final assetgList = ref.read(assetStateProvier).assetIdList;
                          if (ref.read(loginScreenStateProvider).user == null || assetgList == []) {
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
