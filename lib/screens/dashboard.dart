// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:lottie/lottie.dart';
import 'package:pinkgirl/screens/quiz/start_screen.dart';
import 'package:pinkgirl/screens/splash_screen.dart';
import 'package:pinkgirl/utilities/methods.dart';

import '../models/imageslist.dart';
import '../utilities/Mytheme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import 'auth/loginPage.dart';
import 'cancerscreens/consultation.dart';
import 'cancerscreens/excerise.dart';
import 'cancerscreens/intro.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'cancerscreens/symptoms.dart';

import 'chat/chathome.dart';

class DashBoard extends StatefulWidget {
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.all(20),
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 50,
                child: Image(image: AssetImage('Assets/user.png')),
              ),
            ],
          ),
          Text(
            "Account",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            "Muhammad",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
          ),
          Divider(
            thickness: 2,
          ),
          ListTile(
            onTap: () {
              logOut(context);
            },
            leading: CircleAvatar(
              backgroundImage: AssetImage('Assets/logout.png'),
            ),
            title: Text(
              " Logout to Account",
              style: TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            onTap: () {
              logOut(context);
            },
            leading: CircleAvatar(
              backgroundImage: AssetImage('Assets/settings.png'),
            ),
            title: Text(
              " Settings",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      )),
      //  Drawer(
      //   backgroundColor: Colors.white,
      //   child: ElevatedButton(
      //       onPressed: () {
      //         FirebaseAuth.instance.signOut();
      //       },
      //       child: Text("Signout")),

      appBar: AppBar(
        iconTheme: IconThemeData(color: CustomTheme.pinkthemecolor),
        title: Text(
          "Pink Girl",
          style: TextStyle(fontSize: 24, color: CustomTheme.pinkthemecolor),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // bottomNavigationBar: makeBottom,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Lottie.asset(
              'Assets/map.json',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Text(
                          "Breast Cancer \nStatistics Worldwide",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: CustomTheme.pinkthemecolor),
                        ),
                        Expanded(
                          child: Lottie.asset(
                            'Assets/pinkribbon.json',
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "In 2020, about 2.3 million women were diagnosed with breast cancer worldwide and 685,000 died. Every 14 seconds, somewhere in the world, a woman is diagnosed with breast cancer.",
                      style: TextStyle(fontSize: 17, color: CustomTheme.black),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(0),
                    child: CarouselSlider.builder(
                      itemCount: imageList.length,
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        height: 200,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        reverse: false,
                        aspectRatio: 5.0,
                      ),
                      itemBuilder: (context, i, id) {
                        //for onTap to redirect to another screen
                        return GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: Colors.white,
                                )),
                            //ClipRRect for image border radius
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                imageList[i],
                                width: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          onTap: () {
                            var url = imageList[i];
                            print(url.toString());
                          },
                        );
                      },
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    color: Colors.grey.shade200,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Ways to Prevent Breast Cancer",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: CustomTheme.pinkthemecolor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          MyCard(
                            title: 'Introduction',
                            desc: "Get to Know About Breast\nCancer",
                            image: "Assets/intro.png",
                            onTap: () {
                              Get.to(Intro());
                            },
                          ),
                          MyCard(
                            title: 'Symtoms',
                            desc: "Read about Symptoms",
                            image: "Assets/2.png",
                            onTap: () {
                              Get.to(Symtoms());
                            },
                          ),
                          MyCard(
                            title: 'Self Examination',
                            desc: "Read about Symptoms",
                            image: "Assets/4.png",
                            onTap: () {
                              Get.to(StartQuiz());
                            },
                          ),
                          MyCard(
                            title: 'Excercise',
                            desc: "Read about Symptoms",
                            image: "Assets/6.png",
                            onTap: () {
                              Get.to(Exercise());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     backgroundColor: Color.fromARGB(255, 245, 50, 137),
      //     icon: Icon(Icons.healing_outlined),
      //     onPressed: () {
      //       showModalBottomSheet(
      //         backgroundColor: Colors.grey.shade100,
      //         enableDrag: true,
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.only(
      //                 topRight: Radius.circular(20),
      //                 topLeft: Radius.circular(20))),
      //         context: context,
      //         builder: (context) {
      //           return Wrap(
      //             children: [
      //               Container(
      //                 height: 600,
      //                 width: MediaQuery.of(context).size.width,
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Center(
      //                       child: Lottie.asset(
      //                         'Assets/auth.json',
      //                         width: 150,
      //                         height: 150,
      //                       ),
      //                     ),
      //                     Padding(
      //                       padding: const EdgeInsets.symmetric(horizontal: 20),
      //                       child: Divider(
      //                         thickness: 2,
      //                         height: 20,
      //                         color: Colors.grey,
      //                       ),
      //                     ),
      //                     Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                       children: [
      //                         InkWell(
      //                           onTap: () {
      //                             _launchURL();
      //                           },
      //                           child: Column(
      //                             children: [
      //                               Image.asset(
      //                                 "Assets/hsp.png",
      //                                 height: 100,
      //                                 width: 100,
      //                               ),
      //                               Text(
      //                                 "Check Near by \nHospital",
      //                                 style: TextStyle(fontSize: 18),
      //                                 textAlign: TextAlign.center,
      //                               )
      //                             ],
      //                           ),
      //                         ),
      //                         InkWell(
      //                           onTap: () {
      //                             Get.to(Doctor());
      //                           },
      //                           child: Column(
      //                             children: [
      //                               Image.asset(
      //                                 "Assets/doc.png",
      //                                 height: 100,
      //                                 width: 100,
      //                               ),
      //                               Text(
      //                                 "Consult with\n Doctor",
      //                                 style: TextStyle(fontSize: 18),
      //                                 textAlign: TextAlign.center,
      //                               )
      //                             ],
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                     SizedBox(
      //                       height: 20,
      //                     ),
      //                     Text(
      //                       "You are braver than you believe, stronger than you seem, smarter than you think, and twice as beautiful as you'd ever imagined.",
      //                       textAlign: TextAlign.center,
      //                       style: TextStyle(
      //                           fontSize: 17,
      //                           fontWeight: FontWeight.bold,
      //                           color: CustomTheme.pinkthemecolor),
      //                     ),
      //                   ],
      //                 ),
      //               )
      //             ],
      //           );
      //         },
      //       );
      //     },
      //     label: Text("Get Consultation")),
    );
  }
}

class MyCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  final String desc;

  const MyCard(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap,
      required this.desc});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Color.fromARGB(255, 252, 202, 220),
          child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              leading: Container(
                padding: EdgeInsets.only(right: 12.0),
                decoration: new BoxDecoration(
                    border: new Border(
                        right:
                            new BorderSide(width: 1.0, color: Colors.black))),
                child: Image(image: AssetImage(image)),
              ),
              title: Text(
                title,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

              subtitle: Row(
                children: <Widget>[
                  Text(desc,
                      style: TextStyle(color: Colors.black.withOpacity(0.5)))
                ],
              ),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 30.0)),
        ),
      ),
    );
  }
}
