import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/theme.dart';

class ToggleState extends StateNotifier<bool> {
  ToggleState() : super(true);

  void toggle() {
    state = !state;
  }
}

final toggleProvider =
    StateNotifierProvider<ToggleState, bool>((ref) => ToggleState());

class FormTextFieldWidget extends ConsumerWidget {
  const FormTextFieldWidget({
    required this.hintText,
    Key? key,
    this.callback,
    this.suffixIcon,
    this.onpress,
    required this.formControlName,
    this.label,
    required this.textInputAction,
    this.obscure = false,
    this.autofocus,
    this.readonly,
    this.minLengtherrorMessage,
    this.multiLines,
    this.validation,
    this.prefixText,
    this.keyboardType,
    required bool isBorder,
  }) : super(key: key);
  final String formControlName;
  final bool? multiLines;
  final String? label;
  final String hintText;

  final String? prefixText;

  final bool obscure;
  final bool? readonly;
  final bool? autofocus;
  final int? minLengtherrorMessage;
  final Function(FormControl<dynamic>)? callback;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;
  final void Function(FormControl<dynamic>)? onpress;
  final Map<String, String Function(Object)>? validation;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context, ref) {
    final appColor = ref.read(appColorLightProvider);

    return ReactiveFormConsumer(
      builder: (BuildContext context, FormGroup formGroup, Widget? child) {
        bool enable = ref.watch(toggleProvider);
        return ReactiveTextField(
          keyboardType: keyboardType,
          maxLines: multiLines == true ? 5 : 1,
          style: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: appColor.primaryLight.shade200),
          onChanged: callback,
          readOnly: readonly ?? false,
          formControlName: formControlName,
          obscureText: obscure ? enable : false,
          decoration: InputDecoration(
            enabled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 17),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: appColor.blueish),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: appColor.blueish),
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: hintText,
            counterStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: appColor.primaryLight.shade200,
                ),
            hintStyle: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: appColor.primaryLight.shade300),
            prefixText: prefixText,
            prefixStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 48,
                  color: Theme.of(context).colorScheme.shadow,
                ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            suffixIcon: obscure
                ? GestureDetector(
                    onTap: () {
                      ref.read(toggleProvider.notifier).state =
                          !ref.read(toggleProvider.notifier).state;
                    },
                    child: enable
                        ? Icon(Icons.visibility)
                        : Icon(Icons.visibility_off),
                  )
                : null,
            labelText: label,
            labelStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: appColor.primaryLight.shade200),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: appColor.blueish),
              borderRadius: BorderRadius.circular(5),
            ),
            fillColor: appColor.primaryLight,
            filled: true,
          ),
          validationMessages: {
            ValidationMessage.required: (error) => 'يرجى ادخال هذا الحقل',
            ValidationMessage.email: (error) =>
                'يرجى ادخال عنوان بريد إلكتروني صالح',
          },
          textInputAction: textInputAction,
          textAlign: TextAlign.start,
          onTap: onpress,
        );
      },
    );
  }
}
