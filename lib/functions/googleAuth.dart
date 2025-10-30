import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  static const String _serverClientId = 'YOUR_WEB_SERVER_CLIENT_ID.apps.googleusercontent.com';

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId: _serverClientId,
    scopes: <String>[
      'email',
      // Add other required scopes if you need to access Google APIs
    ],
  );

  Future<String?> signInWithGoogle() async {
    try {
      // 1. Start the sign-in process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final String? idToken = googleAuth.idToken;

      if (idToken != null) {
        print('✅ Google ID Token successfully obtained: $idToken');
        return idToken;
      } else {
        print('❌ Failed to retrieve ID Token.');
        return null;
      }
    } catch (error) {
      print('❌ Error during Google Sign-In: $error');
      return null;
    }
  }

  /// Example of how to sign the user out.
  Future<void> signOutGoogle() async {
    await _googleSignIn.signOut();
    print('User signed out from Google.');
  }
}