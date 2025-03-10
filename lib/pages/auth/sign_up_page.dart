import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkedin_clone/pages/auth/sign_in_page.dart';
import 'package:flutter_linkedin_clone/pages/main/main_page/main_page.dart';
import 'package:flutter_linkedin_clone/theme/styles.dart';
import 'package:flutter_linkedin_clone/widgets/button_container_widget.dart';
import 'package:flutter_linkedin_clone/widgets/google_button_container_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isContinued = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 60),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: SvgPicture.asset(
                  "assets/app_logo_svg.svg",
                  width: 50,
                  height: 50,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Join LinkedIn",
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Email or Phone",
                      ),
                    ),
                    const SizedBox(height: 10),
                    _isContinued == true
                        ? TextFormField(
                            decoration: const InputDecoration(
                              hintText: "Password",
                            ),
                          )
                        : Container(),
                    _isContinued == true
                        ? const SizedBox(height: 15)
                        : const SizedBox(height: 0),
                    ButtonContainerWidget(
                      title: "Continue",
                      onTap: () {
                        if (_isContinued == false) {
                          setState(() {
                            _isContinued = true;
                          });
                          return;
                        }
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const MainPage()),
                            (route) => false);
                      },
                    ),
                    const SizedBox(height: 15),
                    GoogleButtonContainerWidget(
                      title: "Sign In with Google",
                      hasIcon: true,
                      icon: SvgPicture.asset(
                        "assets/google_logo_svg.svg",
                        width: 30,
                        height: 30,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const GoogleButtonContainerWidget(
                      title: "Sign In with Apple",
                      hasIcon: true,
                      icon: Icon(
                        FontAwesomeIcons.apple,
                        size: 22,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: RichText(
                        text: TextSpan(
                            text: "Already on LinkedIn? ",
                            style: TextStyle(
                                color: linkedInBlack000000, fontSize: 16),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignInPage()),
                                        (route) => false);
                                  },
                                text: "Sign in",
                                style: TextStyle(
                                    color: linkedInBlue0077B5,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
