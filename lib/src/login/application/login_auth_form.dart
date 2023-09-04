import 'package:reactive_forms/reactive_forms.dart';

final signInForm = FormGroup({
  'email': FormControl<String>(validators: [Validators.email, Validators.required]),
  'password': FormControl<String>(validators: [ Validators.required]),
});