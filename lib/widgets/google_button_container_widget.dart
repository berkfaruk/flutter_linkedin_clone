import 'package:flutter/material.dart';
import 'package:flutter_linkedin_clone/theme/styles.dart';

class GoogleButtonContainerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final String title;
  final VoidCallback? onTap;
  final bool? hasIcon;
  final Widget? icon;
  const GoogleButtonContainerWidget(
      {super.key,
      this.width = double.infinity,
      this.height = 45,
      required this.title,
      this.onTap,
      this.hasIcon,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: hasIcon == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon!,
                    const SizedBox(width: 5),
                    Text(
                      title,
                      style: TextStyle(
                          color: linkedInBlack000000,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              : Text(
                  title,
                  style: TextStyle(
                      color: linkedInBlack000000, fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
