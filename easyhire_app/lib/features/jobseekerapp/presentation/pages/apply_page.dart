import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:easyhire_app/features/auth/presentation/providers/text_field_provider.dart';
import 'package:easyhire_app/features/jobseekerapp/domain/entity/job_entity.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/providers/jobs_dependency_provider.dart';
import 'package:easyhire_app/features/jobseekerapp/presentation/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/services/get.dart';
import '../../../auth/presentation/providers/key_provider.dart';
import '../../../auth/presentation/widgets/buttonWidgets/button.dart';
import '../../../auth/presentation/widgets/formWidget/form_field.dart';
import '../../../auth/presentation/widgets/textWidgets/app_text.dart';

class JobApplyPage extends ConsumerWidget {
  final JobEntity job;
  const JobApplyPage({required this.job, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = ref.read(formkey('cvletter'));
    final cvletterValidator = ref.read(cvLetterValidator);
    final jobApplyNotifier = ref.read(jobApplyNotifierProvider.notifier);
    final applyState = ref.watch(jobApplyNotifierProvider);
    final cvLetterController = ref.watch(controller("cover_letter"));

    return Scaffold(
      appBar: commonAppBar(const Text("Apply")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.verticalSpace,
              AppText(job.title, style: Get.bodyLarge.px18),
              10.verticalSpace,
              AppText(job.description, style: Get.bodyMedium.px14),
              10.verticalSpace,
              AppText('Employer: ${job.employerName}',
                  style: Get.bodySmall.px12.copyWith(color: Colors.grey)),
              10.verticalSpace,
              AppText('Salary: ${job.salary}',
                  style: Get.bodySmall.px12.copyWith(color: Colors.grey)),
              20.verticalSpace,
              AppText('Cover Letter', style: Get.bodyLarge),
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
              20.verticalSpace,
              Center(
                child: applyState.when(
                  loading: () => const CircularProgressIndicator(),
                  data: (message) {
                    if (message != null) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(message)),
                        );
                        if (message == "Successfully applied!") {
                          Navigator.pop(context);
                        }
                      });
                    }
                    return AppButton(
                      onTap: () {
                        final isValidated = formKey.currentState!.validate();
                        if (isValidated) {
                          jobApplyNotifier.applyJob(
                              job.id, cvLetterController.text);
                        }
                      },
                      text: "Apply",
                    );
                  },
                  error: (error, _) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(error.toString())),
                      );
                    });
                    return AppButton(
                      onTap: () {
                        final isValidated = formKey.currentState!.validate();
                        if (isValidated) {
                          jobApplyNotifier.applyJob(
                              job.id, cvLetterController.text);
                        }
                      },
                      text: "Retry",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
