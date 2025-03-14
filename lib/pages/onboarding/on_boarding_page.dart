import 'package:flutter/material.dart';
import 'package:flutter_linkedin_clone/pages/auth/sign_in_page.dart';
import 'package:flutter_linkedin_clone/pages/auth/sign_up_page.dart';
import 'package:flutter_linkedin_clone/pages/onboarding/on_boarding_entity.dart';
import 'package:flutter_linkedin_clone/theme/styles.dart';
import 'package:flutter_linkedin_clone/widgets/button_container_widget.dart';
import 'package:flutter_linkedin_clone/widgets/google_button_container_widget.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  List<OnBoardingEntity> onBoardingData = OnBoardingEntity.onBoardingData;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          itemCount: onBoardingData.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/app_logo_svg.svg",
                  width: 50,
                  height: 50,
                ),
                const SizedBox(height: 20),
                Image.asset("assets/${onBoardingData[index].image}"),
                Center(
                  child: Text(
                    "${onBoardingData[index].title}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: index == 0
                              ? linkedInDarkGrey313335
                              : linkedInWhiteFFFFFF,
                          border: Border.all(width: 1),
                          shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: index == 1
                              ? linkedInDarkGrey313335
                              : linkedInWhiteFFFFFF,
                          border: Border.all(width: 1),
                          shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: index == 2
                              ? linkedInDarkGrey313335
                              : linkedInWhiteFFFFFF,
                          border: Border.all(width: 1),
                          shape: BoxShape.circle),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ButtonContainerWidget(
                    title: "Join now",
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                          (route) => false);
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: GoogleButtonContainerWidget(
                    title: "Join with Google",
                    hasIcon: true,
                    icon: SvgPicture.asset(
                      "assets/google_logo_svg.svg",
                      width: 30,
                      height: 30,
                    ),
                    onTap: () {},
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                          (route) => false);
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: linkedInBlue0077B5),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
