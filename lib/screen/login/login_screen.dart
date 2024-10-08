import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_moneybag_2024/common/common.dart';
import 'package:google_sign_in/google_sign_in.dart';
// ignore: unused_import
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
// ignore: library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as Auth;

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final viewModel = context.watch<LoginViewModel>();
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
                          signInWithKakao();
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
                          // await viewModel.login(platform: LoginPlatform.google);
                          // await userProvider.fetchUser();
                          // if (viewModel.user == null) return;
                          // if (viewModel.isNewUser) {
                          //   if (context.mounted)
                          //     context.go('/signUp', extra: viewModel.user);
                          // } else {
                          //   if (context.mounted) context.go('/');
                          // }
                          signInWithGoogle();
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

  void signInWithKakao() async {
    var provider = Auth.OAuthProvider("oidc.moneybag");
    OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
    debugPrint('token: $token');
    var credential = provider.credential(
      accessToken: token.accessToken,
      idToken: token.idToken,
    );
    await Auth.FirebaseAuth.instance.signInWithCredential(credential);
    debugPrint('firebase sign in 완료');
    // 카카오 로그인 구현 예제
    // 카카오톡 실행 가능 여부 확인
    // 카카오톡 실행이 가능하면 카카오톡으로 로그인, 아니면 카카오계정으로 로그인
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk().then((value) {
          debugPrint('value from kakao $value');
        });
        debugPrint('카카오톡으로 로그인 성공');
      } catch (error) {
        debugPrint('카카오톡으로 로그인 실패 $error');

        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') {
          return;
        }
        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount().then((value) {
            debugPrint('value from kakao $value');
          });
          debugPrint('카카오계정으로 로그인 성공');
        } catch (error) {
          debugPrint('카카오계정으로 로그인 실패 $error');
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount().then((value) {
          debugPrint('value from kakao $value');
        });
        debugPrint('카카오계정으로 로그인 성공');
      } catch (error) {
        debugPrint('카카오계정으로 로그인 실패 $error');
      }
    }
  }
}
