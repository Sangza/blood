import 'package:blood/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../pages/homepage.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

String _email = '';
String _password = '';

class _SigninState extends State<Signin> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Future<void> signin() async {
      final formstate = formKey.currentState;
      if (formstate!.validate()) {
        formstate.save();
        try {
          UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: _email, password: _password);
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        } catch (e) {
          print('${e}');
        }
      }
    }

    Future<void> signinGoogle() async {
      try {
        GoogleSignInAccount? google = await GoogleSignIn().signIn();
        GoogleSignInAuthentication? googleAuth = await google?.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        if (userCredential.user != null) {
          // ignore: use_build_context_synchronously
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => const HomePage())));
        }
      } catch (e) {
        print(e);
      }
    }

    return Form(
      key: formKey,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 50, right: 50),
              height: 100,
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an email';
                  }
                },
                onChanged: (value) {
                  _email = value;
                },
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Enter your email',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 70, right: 70),
              height: 100,
              child: TextFormField(
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Please enter correct password';
                  }
                },
                obscureText: true,
                onChanged: (value) {
                  _password = value;
                },
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Enter your password',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.blueAccent, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 2.0),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: signin,
              child: Container(
                height: 50,
                width: 300,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: const Center(
                  child: Text(
                    'Log in',
                    style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account '),
                const SizedBox(
                  width: 100,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Signup()));
                    },
                    child: const Text('Sign up'))
              ],
            ),
            TextButton(
                onPressed: signinGoogle,
                child: const Text('Login using Google'))
          ],
        ),
      ),
    );
  }
}
