import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_field_validator/form_field_validator.dart';

final formkey =
    Provider.autoDispose.family<GlobalKey<FormState>, String>((ref, arg) {
  return GlobalKey<FormState>();
});

final validator = StateProvider.autoDispose<AutovalidateMode>(
    (ref) => AutovalidateMode.disabled);

//////////////////////////Validator Provider//////////////////////////////////////

final emailValidator = Provider<MultiValidator>((ref) => MultiValidator([
      RequiredValidator(errorText: 'Email is required'),

      PatternValidator(r'(?=.*?[@])' r"(?=.*?[.com])",
          errorText: 'email must be of correct format'),
      // PatternValidator(r'(?=.*?[1234567890])',
      //     errorText: 'passwords must have at least one neumeric character'),
      // PatternValidator(r'(?=.*?[QWERTYUIOPASDFGHJKLZXCVBNM])',
      //     errorText: 'passwords must have at least one Capital Letter')
    ]));

final passwordValidator = Provider<MultiValidator>((ref) => MultiValidator([
      RequiredValidator(errorText: 'password is required'),
      MinLengthValidator(8,
          errorText: 'password must be at least 8 digits long'),
      // PatternValidator(r'(?=.*?[@#$%^&*()!])',
      //     errorText: 'Password must be of correct format'),
      // PatternValidator(r'(?=.*?[1234567890])',
      //     errorText: 'passwords must have at least one neumeric character'),
      // PatternValidator(r'(?=.*?[QWERTYUIOPASDFGHJKLZXCVBNM])',
      //     errorText: 'passwords must have at least one Capital Letter')
    ]));

final emptyfieldValidator = Provider<MultiValidator>((ref) => MultiValidator([
      RequiredValidator(errorText: 'required..'),
      // MinLengthValidator(8,
      //     errorText: 'password must be at least 8 digits long'),
      // PatternValidator(r'(?=.*?[@#$%^&*()!])',
      //     errorText: 'Password must be of correct format'),
      // PatternValidator(r'(?=.*?[1234567890])',
      //     errorText: 'passwords must have at least one neumeric character'),
      // PatternValidator(r'(?=.*?[QWERTYUIOPASDFGHJKLZXCVBNM])',
      //     errorText: 'passwords must have at least one Capital Letter')
    ]));

final salaryValidator = Provider<MultiValidator>((ref) => MultiValidator([
      RequiredValidator(errorText: 'required..'),
      // MinLengthValidator(8,
      //     errorText: 'password must be at least 8 digits long'),
      //PatternValidator(r'(?=.*?[@#$%^&*()!])',
      //errorText: 'salary must be of correct format'),
      // PatternValidator(r'(?=.*?[1234567890])',
      //     errorText: 'passwords must have at least one neumeric character'),
      PatternValidator(r'(?=.*?[1234567890])',
          errorText: 'salary must be completely numeric')
    ]));
