import 'package:flutter/material.dart';

import '../../../../core/theme.dart';

class DividerWithText extends StatelessWidget {
  const DividerWithText({
    super.key,
    required this.colorProvider,
    required this.title,
  });

  final AppColor colorProvider;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Row(children: <Widget>[
        Expanded(
            child: Divider(
          thickness: 1,
          color: colorProvider.primaryLight.shade300,
        )),
        SizedBox(width: 9),
        Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(width: 9),
        Expanded(
            child: Divider(
          thickness: 1,
          color: colorProvider.primaryLight.shade300,
        )),
      ]),
    );
  }
}
