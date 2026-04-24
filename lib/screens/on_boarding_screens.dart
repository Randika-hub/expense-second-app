import 'package:expenseapp/models%20and%20data/data/on_boarding_screens_data.dart';
import 'package:expenseapp/screens/onboarding_first_screen/on_board_firs_screen.dart';
import 'package:expenseapp/screens/user_input_data.dart';
import 'package:expenseapp/widgets/on_boarding_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({super.key});

  @override
  State<OnBoardingScreens> createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  final OnBoardingScreensData onBoardingScreensData = OnBoardingScreensData();

  final PageController _controller = PageController();

  bool showforPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      showforPage = index == 3;
                    });
                  },
                  children: [
                    onboardingFirstScreen(),
                    // OnboardingScreen(
                    //   name: OnBoardingScreensData
                    //       .onBoardingScreensData[0]
                    //       .screenTitle,
                    //   subname: OnBoardingScreensData
                    //       .onBoardingScreensData[0]
                    //       .screensubTitle,
                    //   imagerul: OnBoardingScreensData
                    //       .onBoardingScreensData[0]
                    //       .screenImageurl,
                    // ),

                    // OnboardingScreen(
                    //   name: OnBoardingScreensData
                    //       .onBoardingScreensData[1]
                    //       .screenTitle,
                    //   subname: OnBoardingScreensData
                    //       .onBoardingScreensData[1]
                    //       .screensubTitle,
                    //   imagerul: OnBoardingScreensData
                    //       .onBoardingScreensData[1]
                    //       .screenImageurl,
                    // ),

                    // OnboardingScreen(
                    //   name: OnBoardingScreensData
                    //       .onBoardingScreensData[2]
                    //       .screenTitle,
                    //   subname: OnBoardingScreensData
                    //       .onBoardingScreensData[2]
                    //       .screensubTitle,
                    //   imagerul: OnBoardingScreensData
                    //       .onBoardingScreensData[2]
                    //       .screenImageurl,
                    // ),
                    ...OnBoardingScreensData.onBoardingScreensData.map((data) {
                      return OnboardingScreen(
                        imagerul: data.screenImageurl,
                        name: data.screenTitle,
                        subname: data.screensubTitle,
                      );
                    }),
                  ],
                ),
                Container(
                  alignment: const AlignmentGeometry.xy(0, 0.69),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count:
                        OnBoardingScreensData.onBoardingScreensData.length + 1,
                    effect: const WormEffect(
                      activeDotColor: Colors.blueAccent,
                      dotColor: Colors.grey,
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  left: 20,
                  top: 650,
                  bottom: 27,
                  child: GestureDetector(
                    onTap: () {
                      !showforPage
                          ? _controller.animateToPage(
                              _controller.page!.toInt() + 1,
                              duration: const Duration(milliseconds: 800),
                              curve: Curves.decelerate,
                            )
                          : Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UserInputData(),
                              ),
                            );
                    },
                    child: OnBoardingButton(
                      buttonColor: const Color.fromARGB(255, 160, 40, 235),
                      buttonName: showforPage ? 'get started' : 'next',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //create a class for onbording screen

  Widget onboardingFirstScreen() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/logo.png", fit: BoxFit.cover, width: 150),
        const Text(
          'Expense',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ],
    );
  }
}
