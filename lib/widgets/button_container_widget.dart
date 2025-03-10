import 'package:flutter/material.dart';
import 'package:flutter_linkedin_clone/theme/styles.dart';

class ButtonContainerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final String title;
  final VoidCallback? onTap;
  final bool? hasIcon;
  final IconData? icon;
  const ButtonContainerWidget(
      {super.key,
      this.width=double.infinity,
      this.height=45,
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
            color: linkedInBlue0077B5,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3),
                spreadRadius: 0.5,
                blurRadius: 4.5,
                color: linkedInLightGreyCACCCE,
              ),
            ]),
        child: Center(
          child: hasIcon == true
              ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: TextStyle(color: linkedInWhiteFFFFFF, fontWeight: FontWeight.bold),),
                  const SizedBox(width: 5),
                  Icon(icon, color: linkedInWhiteFFFFFF, size: 1.5,),
                ],
              )
              : Text(
                  title,
                  style: TextStyle(
                      color: linkedInWhiteFFFFFF, fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
