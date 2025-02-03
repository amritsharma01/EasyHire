import 'package:easyhire_app/core/extensions/padding.dart';

import 'package:easyhire_app/features/auth/presentation/providers/text_field_provider.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/entity/job_entity.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/providers/jobs_dependency_provider.dart';

import 'package:easyhire_app/features/jobseekerapp/presentation/widgets/job_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/services/get.dart';
import '../../../auth/presentation/providers/key_provider.dart';
import '../../../auth/presentation/widgets/buttonWidgets/button.dart';
import '../../../auth/presentation/widgets/formWidget/form_field.dart';
import '../../../auth/presentation/widgets/specialWidgets/progress_indicator.dart';

class JobApplyPage extends ConsumerWidget {
  final JobEntity job;
  const JobApplyPage({required this.job, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.read(formkey('cvletter'));
    final cvletterValidator = ref.read(emptyfieldValidator);
    final jobApplyNotifier = ref.read(jobApplyNotifierProvider.notifier);

    final cvLetterController = ref.watch(controller("cover_letter"));

    return Scaffold(
      appBar: AppBar(title: Text("Apply")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              JobCard(job),
              10.verticalSpace,
              Form(
                key: formKey,
                child: AppTextFormField(
                  validator: cvletterValidator.call,
                  controller: cvLetterController,
                  hintText: "Write your cover letter here.",
                  maxLine: 15,
                  radius: 30,
                ),
              ),
              10.verticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15).rt,
                child: AppButton(
                  radius: 30,
                  onTap: () async {
                    final isValidated = formKey.currentState!.validate();

                    if (isValidated) {
                      await jobApplyNotifier.applyJob(
                          job.id, cvLetterController.text);
                      final applyState = ref.read(jobApplyNotifierProvider);
                      if (applyState.isLoading) {
                        AppProgressIndicator;
                      } else if (applyState.hasError) {
                        Get.pop();
                        Get.snackbar(applyState.error.toString());
                      } else {
                        Get.banner("Applied Succesfully");
                        Get.pop();
                      }
                    }
                  },
                  text: "Apply",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
