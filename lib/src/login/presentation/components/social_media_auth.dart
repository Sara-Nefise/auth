import 'package:flutter/material.dart';

import '../../../../core/theme.dart';
import '../widgets/social_media_container.dart';

class SocialMediaAuth extends StatelessWidget {
  const SocialMediaAuth({
    super.key,
    required this.appColor,
  });

  final AppColor appColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SocialMediaContainer(appColor: appColor, icon: Icon(Icons.facebook)),
        const SizedBox(
          width: 7,
        ),
        SocialMediaContainer(appColor: appColor, icon: Icon(Icons.g_mobiledata))
      ],
    );
  }
}
