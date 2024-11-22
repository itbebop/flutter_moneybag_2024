import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_moneybag_2024/domain/enums/user_types.dart';
import 'package:flutter_moneybag_2024/domain/model/user.dart';
import 'package:flutter_moneybag_2024/domain/repository/auth/social_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuth implements SocialAuth {
  @override
  Future<User?> login() async {
    // Trigger the authentication flow
    await logout();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = auth.GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    try {
      final userCredential = await auth.FirebaseAuth.instance.signInWithCredential(credential);

      final user = User(
          uid: userCredential.user!.uid,
          name: userCredential.user!.displayName!,
          email: userCredential.user!.email!,
          imgUrl: userCredential.user!.photoURL ?? '',
          language: 'ko',
          userType: UserType.free,
          createAt: DateTime.now());
      return user;
    } catch (error) {
      return null;
    }
  }

  @override
  Future<void> logout() async {
    await GoogleSignIn().signOut();
  }
}
