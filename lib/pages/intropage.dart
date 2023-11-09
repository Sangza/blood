import 'package:blood/pages/criteria.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingPage extends StatefulWidget {
  final bool? isDoneOrskip;
  OnBoardingPage({
    Key? key,
    this.isDoneOrskip,
  }) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();
  User? user = FirebaseAuth.instance.currentUser;

  void _onIntroEnd(context) async {
    bool doneOrskip = true;
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('doneOrskip : ${user?.uid}', doneOrskip);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const Criteria()),
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('asset/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.only(top: 60),
    );

    return IntroductionScreen(
      key: introKey,

      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              child: Container(
                color: Colors.white,
              )),
        ),
      ),

      pages: [
        PageViewModel(
          title: "Donate Blood",
          body: "Save a life today by giving blood",
          image: _buildImage('donate.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Donate from anywhere",
          body: "Donate blood from the comfort of your home",
          image: _buildImage('from the comfort of your home.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "In need of urgent transfusion",
          body: "Find an available donor in your location",
          image: _buildImage('find a donor.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Find a compactiable donor",
          body: "Find a compactiable donor that match your blood group",
          image: _buildImage('blood type.jpg'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.white,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
