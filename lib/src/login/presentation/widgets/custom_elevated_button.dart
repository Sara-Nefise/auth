
import 'package:auth_login/core/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CustomElevatedButton extends ConsumerWidget {
  const CustomElevatedButton(
      {super.key,
      required this.title,
      required this.onPreesed,
      required this.formGroup});
  final String title;
  final FormGroup formGroup;
  final VoidCallback onPreesed;
  @override
  Widget build(BuildContext context, ref) {
    final appColor = ref.read(appColorLightProvider);
    return SizedBox(
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: appColor.blueish,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: formGroup.valid ? onPreesed : null,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.white, fontSize: 20),
          ),
        ));
  }
}
