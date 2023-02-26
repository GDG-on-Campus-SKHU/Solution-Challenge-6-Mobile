import 'MainView/mainView.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'login_platform.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginPlatform _loginPlatform = LoginPlatform.none;

  GoogleSignInAccount? googleUser = null;
  void signInWithGoogle() async {
    googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      setState(() {
        _loginPlatform = LoginPlatform.google;
      });
    }
  }

  void signOut() async {
    switch (_loginPlatform) {
      case LoginPlatform.google:
        await GoogleSignIn().signOut();
        break;
      case LoginPlatform.apple:
        break;
      case LoginPlatform.none:
        break;
    }

    setState(() {
      _loginPlatform = LoginPlatform.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _loginPlatform != LoginPlatform.none && googleUser != null
            ? mainView(googleUser: googleUser!)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _loginButton(
                    'google_logo',
                    signInWithGoogle,
                  )
                ],
              ),
      ),
    );
  }

  Widget _loginButton(String path, VoidCallback onTap) {
    return Card(
        elevation: 5.0,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: SignInButton(
          Buttons.Google,
          text: "Sign up with Google",
          onPressed: onTap,
        ));
  }
}
