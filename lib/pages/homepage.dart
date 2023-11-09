import 'package:blood/auth/signin.dart';
import 'package:blood/constant.dart';
import 'package:blood/pages/donate.dart';
import 'package:blood/pages/searchdonor.dart';
import 'package:blood/pages/viewschedule.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final auth = FirebaseAuth.instance;
  final googleIn = GoogleSignIn();

  Future<void> signOut() async {
    try {
      await auth.signOut();
      await googleIn.signOut();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => const Signin())));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          leading: const Icon(Icons.menu),
          backgroundColor: kbackground,
          shadowColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  signOut();
                },
                icon: Icon(Icons.cancel))
          ],
        ),
        body: Container(
          decoration: const ShapeDecoration(
              gradient: LinearGradient(
                  begin: Alignment(0.00, -1),
                  end: Alignment(0, 1),
                  colors: [Colors.red, Colors.white, Colors.white]),
              shape: RoundedRectangleBorder()),
          child: Column(
            children: [
              // Stack(
              //   children: [
              //     Container(
              //       height: MediaQuery.of(context).size.height / 15,
              //       decoration: const BoxDecoration(color: kbackground),
              //     ),
              //     // Padding(
              //     //   padding: const EdgeInsets.only(top: 15, left: 20),
              //     //   child: Container(
              //     //     height: 70,
              //     //     width: 85,
              //     //     decoration: BoxDecoration(
              //     //         border: Border.all(color: Colors.black),
              //     //         borderRadius: BorderRadius.circular(15)),
              //     //   ),
              //     // ),
              //     // Padding(
              //     //   padding: const EdgeInsets.only(left: 150, top: 15),
              //     //   child: Row(
              //     //     children: [
              //     //       Column(
              //     //         children: const [
              //     //           Text(
              //     //             'Welcome',
              //     //             style: TextStyle(fontSize: 20),
              //     //           ),
              //     //           Text(
              //     //             'Uche Okenyi',
              //     //             style: TextStyle(fontSize: 22),
              //     //           )
              //     //         ],
              //     //       )
              //     //     ],
              //     //   ),
              //     // )
              //   ],
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 35),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.only(left: 20),
              //         child: Container(
              //           height: 50,
              //           width: 140,
              //           decoration: BoxDecoration(
              //               border: Border.all(
              //                   color: Color.fromARGB(255, 248, 238, 238)),
              //               borderRadius: BorderRadius.circular(15),
              //               color: kbackground),
              //           child: Padding(
              //             padding: const EdgeInsets.only(top: 4),
              //             child: Column(
              //               children: const [
              //                 Text(
              //                   'Rank',
              //                   style: TextStyle(
              //                       color: Color.fromARGB(255, 100, 99, 99)),
              //                 ),
              //                 Text(
              //                   '600',
              //                   style: TextStyle(
              //                       color: Color.fromARGB(255, 100, 99, 99)),
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(right: 20),
              //         child: Container(
              //           height: 50,
              //           width: 140,
              //           decoration: BoxDecoration(
              //               border: Border.all(
              //                   color: Color.fromARGB(255, 248, 238, 238)),
              //               borderRadius: BorderRadius.circular(15),
              //               color: kbackground),
              //           child: Padding(
              //             padding: const EdgeInsets.only(top: 4),
              //             child: Column(
              //               children: const [
              //                 Text(
              //                   'Wallet',
              //                   style: TextStyle(
              //                       color: Color.fromARGB(255, 100, 99, 99)),
              //                 ),
              //                 Text(
              //                   '#15,600',
              //                   style: TextStyle(
              //                       color: Color.fromARGB(255, 100, 99, 99)),
              //                 )
              //               ],
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 35),
              //   child: Container(
              //     width: 300,
              //     height: 53,
              //     decoration: BoxDecoration(
              //         border: Border.all(color: kbackground),
              //         borderRadius: BorderRadius.circular(10)),
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: const [
              //           Text(
              //             'Check your schedule for next donation',
              //             style: TextStyle(
              //                 color: Color.fromARGB(255, 100, 99, 99)),
              //           ),
              //           CircleAvatar(
              //             backgroundColor: kbackground,
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Row(
                  children: const [
                    Text('Active Campaign'),
                  ],
                ),
              ),
              const Divider(
                color: kbackground,
                endIndent: 5,
                indent: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: CarouselSlider(
                  items: item,
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      autoPlay: true),
                ),
              ),
              const Divider(
                color: kbackground,
                endIndent: 5,
                indent: 5,
              ),
              InkWell(
                child: Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: const [
                        Icon(Icons.insert_invitation),
                        Text('Invite a friend')
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    colors = background;
                  });
                },
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Donate()));
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                        color: colors,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text('Donate'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: myNavigationBar(context, 1),
      ),
    );
  }
}

Widget myNavigationBar(BuildContext context, int index) => CurvedNavigationBar(
      items: navIcons,
      backgroundColor: Colors.transparent,
      color: kbackground,
      index: index,
      height: 60,
      onTap: (index) {
        if (index == 0) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Search()));
        } else if (index == 1) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomePage()));
        } else if (index == 2) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const Schedule()));
        }
      },
    );

var colors = kbackground;
List<Widget> item = [
  Container(
    decoration: const BoxDecoration(color: Colors.red),
  ),
  Container(
    decoration: const BoxDecoration(color: Colors.blue),
  ),
  Container(
    decoration: const BoxDecoration(color: Colors.black),
  ),
];

List<Widget> navIcons = [
  const Icon(Icons.search),
  const Icon(Icons.bloodtype_outlined),
  const Icon(Icons.schedule_outlined),
];
