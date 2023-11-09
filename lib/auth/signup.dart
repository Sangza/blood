import 'package:blood/auth/signin.dart';
import 'package:blood/pages/intropage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pages/homepage.dart';

class Signup extends StatefulWidget {
  Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

String _email = '';
String _password = '';

class _SignupState extends State<Signup> {
  bool? doneOrskip = false;

  @override
  void initState() {
    super.initState();
    checkDone();
  }

  Future<bool?> checkDone() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    User? user = FirebaseAuth.instance.currentUser;
    doneOrskip = pref.getBool('doneOrskip : ${user?.uid}') ?? false;
    return doneOrskip;
  }

  final _ormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Future<void> signup() async {
      final ormstate = _ormKey.currentState;
      if (ormstate!.validate()) {
        ormstate.save();
        try {
          UserCredential user = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: _email, password: _password);
          // ignore: use_build_context_synchronously
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OnBoardingPage()));
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
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OnBoardingPage()));
        }
      } catch (e) {
        print(e);
      }
    }

    return Form(
      key: _ormKey,
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
              onTap: signup,
              child: Container(
                height: 50,
                width: 300,
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: const Center(
                  child: Text(
                    'Sign up',
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
                const Text('Already have an account'),
                const SizedBox(
                  width: 100,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => const Signin())));
                    },
                    child: const Text('Sign in'))
              ],
            ),
            TextButton(
                onPressed: signinGoogle,
                child: const Text('Signin using Google'))
          ],
        ),
      ),
    );
  }
}

Future<UserCredential> signInGoogleWeb() async {
  GoogleAuthProvider googleProvider = GoogleAuthProvider();

  return await FirebaseAuth.instance.signInWithPopup(googleProvider);
}
