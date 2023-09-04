import 'package:auth_login/core/theme.dart';
import 'package:auth_login/src/login/domain/user_domain.dart';
import 'package:auth_login/src/login/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../auth/auth_notifier.dart';
import '../../application/login_auth_form.dart';
import '../components/social_media_auth.dart';
import '../widgets/divider_with_text.dart';
import '../widgets/text_feild_widget.dart';

// email : mcht@mcht.net
// password : 1
class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColor = ref.read(appColorLightProvider);

    return Scaffold(
      backgroundColor: appColor.primaryLight,
      body: SingleChildScrollView(
        child: ReactiveForm(
          formGroup: signInForm,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  Text(
                    'Sign In',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Email Address',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const FormTextFieldWidget(
                    formControlName: 'email',
                    hintText: 'test@gmail.com',
                    isBorder: true,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Password',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const FormTextFieldWidget(
                    formControlName: 'password',
                    hintText: 'password',
                    isBorder: true,
                    obscure: true,
                    textInputAction: TextInputAction.done,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ReactiveFormConsumer(
                    builder: (BuildContext context, FormGroup formGroup,
                        Widget? child) {
                      return CustomElevatedButton(
                        formGroup: formGroup,
                        onPreesed: () {
                          final AppUser user = AppUser(
                            email: (formGroup.control("email")
                                    as FormControl<String>)
                                .value,
                            password: (formGroup.control("password")
                                    as FormControl<String>)
                                .value,
                          );
                          ref.read(authNotifierProvider.notifier).loginUser(
                              email: user.email!, password: user.password!);
                        },
                        title: 'Sign In',
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DividerWithText(
                    colorProvider: appColor,
                    title: 'Or',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SocialMediaAuth(appColor: appColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: <TextSpan>[
                          TextSpan(
                              text: "Don't have an account?, ",
                              style: Theme.of(context).textTheme.bodyLarge),
                          TextSpan(
                            text: "Sign Up",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                    decoration: TextDecoration.underline,
                                    color: appColor.redish.shade300),
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
