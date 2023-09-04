

import 'package:auth_login/core/theme.dart';
import 'package:flutter/material.dart';

class SocialMediaContainer extends StatelessWidget {
  const SocialMediaContainer({
    super.key,
    required this.appColor,
    required this.icon,
  });

  final AppColor appColor;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: appColor.primaryLight.shade300,
            width: 2,
          )),
      child: icon,
    );
  }
}
