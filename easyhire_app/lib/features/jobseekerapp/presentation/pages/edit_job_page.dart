import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/get.dart';
import '../../../auth/presentation/providers/key_provider.dart';
import '../../../auth/presentation/providers/text_field_provider.dart';
import '../../../auth/presentation/widgets/buttonWidgets/button.dart';
import '../../../auth/presentation/widgets/formWidget/form_field.dart';
import '../../../auth/presentation/widgets/specialWidgets/progress_indicator.dart';
import '../../../auth/presentation/widgets/textWidgets/app_text.dart';
import '../../../employerapp/presentation/providers/emp_dependency_providers.dart';

class EditJobPage extends ConsumerWidget {
  const EditJobPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jobPostProvider = ref.read(jobPostNotifierProvider.notifier);
    final formKey = ref.read(formkey('post_job'));
    final emptyVal = ref.read(emptyfieldValidator);
    final salaryVal = ref.read(salaryValidator);
    final jobTitle = ref.watch(controller("jobtitle"));
    final jobDescription = ref.watch(controller("jobdescription"));
    final salary = ref.watch(controller("salary"));
    return Scaffold(
      appBar: AppBar(title: AppText("Edit  Job!")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15).rt,
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              10.verticalGap,
              _subtitle("Job Title"),
              AppTextFormField(
                controller: jobTitle,
                validator: emptyVal.call,
              ),
              _subtitle("Job Description"),
              AppTextFormField(
                controller: jobDescription,
                maxLine: 5,
                validator: emptyVal.call,
              ),
              _subtitle("Job Salary"),
              AppTextFormField(
                controller: salary,
                validator: salaryVal.call,
              ),
              10.verticalGap,
              AppButton(
                  onTap: () async {
                    final isValidated = formKey.currentState!.validate();

                    if (isValidated) {
                      await jobPostProvider.applyJob(jobTitle.text,
                          jobDescription.text, double.parse(salary.text));
                      final jobPostState = ref.watch(jobPostNotifierProvider);
                      if (jobPostState.isLoading) {
                        AppProgressIndicator;
                      } else if (jobPostState.hasError) {
                        Get.snackbar(jobPostState.error.toString());
                      } else {
                        ref.invalidate(empjobNotifierProvider);
                        Get.toast("Posted Succesfully");
                        Get.pop();
                      }
                    }
                  },
                  text: "Post")
            ],
          ),
        ),
      ),
    );
  }
}

Widget _subtitle(title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5).rt,
    child: AppText("\t$title", style: Get.bodyMedium.disabledO5.px14),
  );
}
