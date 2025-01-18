import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:easyhire_app/features/auth/presentation/providers/text_field_provider.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/buttonWidgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/features/auth/presentation/pages/login_page.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/formWidget/form_field.dart';
import 'package:easyhire_app/core/services/get.dart';
import '../providers/auth_dependency_providers.dart';
import '../providers/key_provider.dart';

import '../widgets/specialWidgets/radio_button.dart';
import '../widgets/textWidgets/app_text.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(registerProvider);
    final usernameController = ref.watch(controller("signupusername"));
    final emailController = ref.watch(controller("signupemail"));
    final passwordController = ref.watch(controller("signuppassword"));
    final key = ref.read(formkey('register'));
    final nameValidator = ref.read(usernameValidator);
    final passValidator = ref.read(passwordValidator);
    final mailValidator = ref.read(emailValidator);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppText(
                    "SignUp Here",
                    style: Get.bodyLarge.px22.w900,
                  ),
                ),
              ),
              20.verticalGap,
              AppTextFormField(
                controller: usernameController,
                hintText: "username",
                validator: nameValidator.call,
              ),
              10.verticalGap,
              AppTextFormField(
                controller: emailController,
                hintText: "email",
                validator: mailValidator.call,
              ),
              10.verticalGap,
              AppTextFormField(
                controller: passwordController,
                hintText: "password",
                validator: passValidator.call,
              ),
              10.verticalGap,
              AppRadioButton(
                labels: ["Job Seeker", "Employer"],
                stateProvider: jobSeekerProvider,
              ),
              10.verticalGap,
              if (registerState.isLoading)
                const CircularProgressIndicator()
              else
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: AppButton(
                    onTap: () async {
                      final username = usernameController.text;
                      final email = emailController.text;
                      final password = passwordController.text;
                      final jobSeeker = ref.read(jobSeekerProvider);
                      final employer = ref.read(employerProvider);
                      final registerNotiProvider =
                          ref.read(registerProvider.notifier);
                      final isValidated = key.currentState!.validate();

                      if (isValidated) {
                        try {
                          await registerNotiProvider.register(
                            username: username,
                            email: email,
                            password: password,
                            isJobSeeker: jobSeeker,
                            isEmployer: employer,
                          );

                          Get.to(LoginPage());
                        } catch (e) {
                          Get.snackbar(e.toString());
                        }
                      } else {}
                    },
                    text: "Register",
                  ),
                ),
              10.verticalGap,
            ],
          ),
        ),
      ),
    );
  }
}

final jobSeekerProvider = StateProvider<bool>((ref) => false);
final employerProvider = StateProvider<bool>((ref) => false);
