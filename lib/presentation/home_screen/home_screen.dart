import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_cv/presentation/vistor_screens/cv_resume_screen/cv_resume.dart';
import 'package:smart_cv/widgets/appBar/custom_appbar.dart';
import 'package:smart_cv/core/app_export.dart';
import 'package:smart_cv/widgets/custom_drawer/drawer.dart';
import 'package:window_manager/window_manager.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    // Automatically slide after 500ms
    Timer.periodic(Duration(milliseconds: 2000), (timer) {
      if (_currentPageIndex < 2) {
        _pageController.nextPage(
          duration: Duration(milliseconds: 2000),
          curve: Curves.ease,
        );
      } else {
        _pageController.jumpToPage(0);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: customAppBar(
              context,
              "Smart CV Builder",
            ),
            drawer: drawer(context),
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height / 4,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPageIndex = index;
                            });
                          },
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return sliderPic(index, context);
                          },
                        ),
                      )),
                  SizedBox(height: 22.v),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.v),
                        Padding(
                          padding: EdgeInsets.only(left: 2, right: 2),
                          child: cvResumeTemplate(context),
                        ),
                        SizedBox(height: 30.v),
                        Padding(
                          padding: EdgeInsets.only(left: 12.h),
                          child: GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, AppRoutes.invitationCardScreen),
                              child: Text("Invitation Card Templates.",
                                  style: CustomTextStyles.bodyLarge17)),
                        ),
                        SizedBox(height: 10.v),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: invitationCardTemplate(context),
                        ),
                        SizedBox(height: 30.v),
                        Padding(
                          padding: EdgeInsets.only(left: 15.h),
                          child: GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, AppRoutes.coverLetterScreen),
                              child: Text("Cover Letter Templates.",
                                  style: CustomTextStyles.bodyLarge17)),
                        ),
                        SizedBox(height: 10.v),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: coverLetterTemplate(context),
                        ),
                      ]),
                  SizedBox(height: 30.v)
                ]))));
  }

  /// Section Widget
  Widget cvResumeTemplate(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 3.3,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: Image(
                image: AssetImage('assets/images/home/3.jpg'),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    child: RichText(
                        softWrap: true,
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: "CREATE SMART CV\n",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 255, 255, 255))),
                          TextSpan(
                            text: "Build your CV in minutes.\n",
                          ),
                          TextSpan(text: "AI analyzes for job improvement.\n"),
                          TextSpan(
                              text:
                                  "Personalized templates for professional CVs.\n"),
                          TextSpan(
                              text:
                                  "Effortless CV creation with AI assistance.\n"),
                        ]))),
                TextButton(
                  onPressed: () {
                    print("RESUME CLICKED.....");
                    Navigator.pushNamed(context, AppRoutes.cvResume);
                    CVResumePage();
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 3),
                    width: 180,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          appTheme.blueGray500C6,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                        color: Colors.blue,
                        width: 0.5,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "LET'S START",
                        style: TextStyle(
                          color: Color.fromARGB(255, 17, 92, 107),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }

// ListView.separated(
// padding: EdgeInsets.only(left: 15.h),
// scrollDirection: Axis.horizontal,
// separatorBuilder: (context, index) {
//   return SizedBox(width: 27.h);
// },
// itemCount: 3,
// itemBuilder: (context, index) {
//   return CvResumeTemplate();
// })
  /// Section Widget
  Widget invitationCardTemplate(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 3.3,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              child: Image(
                image: AssetImage('assets/images/home/1.jpg'),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    child: RichText(
                        softWrap: true,
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: "SMART INVITATION CARD\n",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 255, 255, 255))),
                          TextSpan(
                            text:
                                "Effortlessly create stunning invitation cards.\n",
                          ),
                          TextSpan(
                              text:
                                  "AI-generated content for unique invitations.\n"),
                          TextSpan(text: "Choose from AI-curated templates.\n"),
                          TextSpan(
                              text:
                                  "Personalized designs for every occasion.\n"),
                        ]))),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.invitationCard);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 3),
                    width: 180,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          appTheme.blueGray500C6,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "LET'S START",
                        style: TextStyle(
                          color: Color.fromARGB(255, 17, 92, 107),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }

  /// Section Widget
  Widget coverLetterTemplate(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 3.3,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              child: Image(
                image: AssetImage('assets/images/home/4.jpg'),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    child: RichText(
                        softWrap: true,
                        textAlign: TextAlign.center,
                        text: TextSpan(children: [
                          TextSpan(
                              text: "SMART COVER LETTER\n",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 255, 255, 255))),
                          TextSpan(
                            text:
                                "Generate professional cover letters instantly.\n",
                          ),
                          TextSpan(
                              text: "AI enhances your cover letter content.\n"),
                          TextSpan(
                              text: "Choose from AI-suggested templates.\n"),
                          TextSpan(
                              text:
                                  "Personalized cover letters for job applications.\n"),
                        ]))),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.coverLetter);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 3),
                    width: 180,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          theme.colorScheme.primary,
                          appTheme.blueGray500C6,
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 5), // changes position of shadow
                        ),
                      ],
                      border: Border.all(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "LET'S START",
                        style: TextStyle(
                          color: Color.fromARGB(255, 17, 92, 107),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }

  Widget getAppBarTitle(String title) {
    return DragToMoveArea(
      child: SizedBox(
        height: kToolbarHeight,
        child: Align(
            alignment: AlignmentDirectional.center,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primary,
                  appTheme.blueGray500C6,
                ],
              )),
            )),
      ),
    );
  }

  Widget sliderPic(int index, BuildContext context) {
    List<String> text = [
      "WE ARE PROVIDING EXPENSIVE APPS",
      "WE ARE PROVIDING CLEAN CODE ARCHITECTURES",
      "WE ARE PROVIDING AI SOLUTION"
    ];
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomImageView(
          imagePath: _getImagePath(index),
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: RichText(
              softWrap: true,
              text: TextSpan(
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  children: [TextSpan(text: text[index])])),
        )
      ],
    );
  }

  String _getImagePath(int index) {
    switch (index) {
      case 0:
        return ImageConstant.imgSlider1;
      case 1:
        return ImageConstant.imgSlider2;
      case 2:
        return ImageConstant.imgSlider3;
      default:
        return ImageConstant.imgSlider1;
    }
  }
}
