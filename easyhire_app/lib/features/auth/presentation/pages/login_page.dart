// ignore_for_file: unused_local_variable
import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/features/auth/presentation/pages/register_page.dart';
import 'package:easyhire_app/features/auth/presentation/providers/key_provider.dart';
import 'package:easyhire_app/features/auth/presentation/providers/text_field_provider.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/buttonWidgets/button.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/formWidget/form_field.dart';
import 'package:easyhire_app/features/auth/presentation/widgets/specialWidgets/progress_indicator.dart';
import 'package:easyhire_app/features/user/presentation/provider/user_dependency_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/get.dart';
import '../../../../core/utils/assets_path.dart';
import '../../../user/presentation/pages/pages_controller.dart';
import '../providers/auth_dependency_providers.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = ref.watch(controller("username"));
    final passwordController = ref.watch(controller("password"));
    final key = ref.read(formkey('login'));
    final nameValidator = ref.read(emptyfieldValidator);
    final passValdator = ref.read(passwordValidator);
    // final TextEditingController usernameController = TextEditingController();
    // final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              80.verticalGap,
              Image.asset(
                Assets.images.logo,
                height: 50.ht,
              ),
              30.verticalGap,
              AppTextFormField(
                hintText: "username",
                controller: usernameController,
                validator: nameValidator.call,
              ),
              10.verticalGap,
              AppTextFormField(
                controller: passwordController,
                hintText: "password",
                validator: passValdator.call,
              ),
              10.verticalGap,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).rt,
                child: AppButton(
                  onTap: () async {
                    final username = usernameController.text;
                    final password = passwordController.text;
                    final loginNotiProvider = ref.read(loginProvider.notifier);

                    final isValidated = key.currentState!.validate();
                    if (isValidated) {
                      await loginNotiProvider.login(username, password);
                      // await loginNotiProvider.login("employer", "mypassword");
                      final loginState =
                          ref.read(loginProvider); // Read state after login
                      final userNotifier =
                          ref.watch(userNotifierProvider.notifier);
                      if (loginState.hasError) {
                        Get.snackbar("Invalid username or password.");
                      } else if (loginState.isLoading) {
                        return AppProgressIndicator();
                      } else {
                        await userNotifier.fetchUserProfile();
                        Get.off(PagesController());
                      }
                    }
                  },
                  text: "Login",
                ),
              ),
              // 10.verticalGap,
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20).rt,
              //   child: AppButton(
              //     onTap: () async {
              //       final username = usernameController.text;
              //       final password = passwordController.text;
              //       final loginNotiProvider = ref.read(loginProvider.notifier);

              //       final isValidated = key.currentState!.validate();
              //       if (!isValidated) {
              //         await loginNotiProvider.login("sharma", "11111111");
              //         final loginState =
              //             ref.read(loginProvider); // Read state after login
              //         final userNotifier =
              //             ref.watch(userNotifierProvider.notifier);

              //         if (loginState.hasError) {
              //           Get.snackbar("Invalid username or password.");
              //         } else if (loginState.isLoading) {
              //           return AppProgressIndicator();
              //         } else {
              //           await userNotifier.fetchUserProfile();
              //           Get.off(PagesController());
              //         }
              //       }
              //     },
              //     text: "Seeker Login",
              //   ),
              // ),
              AppTextButton(
                text: "Create new Account",
                onPressed: () {
                  Get.to(RegisterPage());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
