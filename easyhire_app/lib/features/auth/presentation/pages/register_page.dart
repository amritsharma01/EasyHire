import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easyhire_app/features/auth/presentation/providers/text_field_provider.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/buttonWidgets/button.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/specialWidgets/progress_indicator.dart';
import 'package:easyhire_app/core/extensions/int.dart';

import 'package:easyhire_app/features/auth/presentation/widgets/formWidget/form_field.dart';
import 'package:easyhire_app/core/services/get.dart';
import '../../../../core/utils/assets_path.dart';
import '../providers/auth_dependency_providers.dart';
import '../providers/key_provider.dart';
import '../widgets/specialWidgets/app_switch.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerState = ref.watch(registerProvider);
    final usernameController = ref.watch(controller("signupusername"));
    final emailController = ref.watch(controller("signupemail"));
    final passwordController = ref.watch(controller("signuppassword"));
    final key = ref.read(formkey('register'));
    final nameValidator = ref.read(emptyfieldValidator);
    final passValidator = ref.read(passwordValidator);
    final mailValidator = ref.read(emailValidator);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: [
              Image.asset(
                Assets.images.logo,
                height: 50.ht,
              ),
              30.verticalGap,
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
              AppSwitch(
                label1: "Employer",
                label2: "JobSeeker",
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
                      final isJobSeeker =
                          ref.read(jobSeekerProvider); // Read the correct value
                      final registerNotiProvider =
                          ref.read(registerProvider.notifier);
                      final registerState = ref.read(registerProvider);
                      final isValidated = key.currentState!.validate();

                      if (isValidated) {
                        await registerNotiProvider.register(
                          username: username,
                          email: email,
                          password: password,
                          isJobSeeker: isJobSeeker,
                          isEmployer:
                              !isJobSeeker, // Correctly toggle based on isJobSeeker
                        );
                        if (registerState.isLoading) {
                          return AppProgressIndicator();
                        } else if (registerState.hasError) {
                          Get.snackbar("Unable to register");
                        } else {
                          Get.pop();
                        }
                      }
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

final jobSeekerProvider =
    StateProvider<bool>((ref) => true); // Default to Job Seeker
