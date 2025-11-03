import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _isInitialized = false;

  // 1. Define all necessary scopes here
  static const List<String> requiredScopes = <String>[
    'email', 
  ];

  Future<void> initializeGoogleSignIn() async {
    if (!_isInitialized) {
      try {
        await _googleSignIn.initialize(
          serverClientId: '440250374541-02k400s59a3ea96vcmkio9gdircf58k7.apps.googleusercontent.com',
        );
        _isInitialized = true;
        print("Google Sign-In Initialized successfully.");
      } catch (error) {
        print('Initialization failed: $error');
      }
    }
  }

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    await initializeGoogleSignIn(); 

    try {
      final GoogleSignInAccount? account = await _googleSignIn.authenticate(
          scopeHint: requiredScopes,
      );  
      print("message");
      if (account != null) {
        print("Sign-in successful for user: ${account.email}"); // Use a String property for logging
      }   
      return account;
    } catch (error) {
      print('Google Sign-In Error: $error');
      return null;
    }
  }
}