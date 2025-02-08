import 'package:easyhire_app/core/extensions/color_extensions.dart';
import 'package:easyhire_app/core/extensions/int.dart';
import 'package:easyhire_app/core/extensions/padding.dart';
import 'package:easyhire_app/core/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/services/get.dart';
import '../../../auth/presentation/widgets/buttonWidgets/button.dart';
import '../../../auth/presentation/widgets/formWidget/form_field.dart';
import '../../../auth/presentation/widgets/textWidgets/app_text.dart';
import '../provider/search_provider.dart';
import '../../../jobseekerapp/presentation/providers/jobs_dependency_provider.dart';

Future<void> applyFilter(WidgetRef ref) async {
  final TextEditingController locationController = TextEditingController();
  final ValueNotifier<String?> salaryNotifier = ValueNotifier(null);

  await showModalBottomSheet(
    backgroundColor: Get.scaffoldBackgroundColor,
    isScrollControlled: true,
    showDragHandle: true,
    useSafeArea: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20).r),
    ),
    context: Get.context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          right: 16,
          left: 16,
          top: 12,
        ).rt,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel("Salary Range"),
            _buildSalaryOptions(salaryNotifier),
            15.verticalSpace,
            _buildLabel("Location"),
            10.verticalSpace,
            AppTextFormField(
              controller: locationController,
              hintText: "Enter location",
              radius: 50,
            ),
            22.verticalSpace,
            _buildActionButtons(ref, locationController, salaryNotifier),
            15.verticalSpace,
          ],
        ),
      );
    },
  );
}

Widget _buildLabel(String text) {
  return AppText(text, style: Get.bodyMedium.disabledO5.w600.px14);
}

Widget _buildSalaryOptions(ValueNotifier<String?> salaryNotifier) {
  const List<String> salaryRanges = [
    "Any",
    "0-10k",
    "10k-20k",
    "20k-30k",
    "30k-40k",
    "40k-50k",
    "50k+"
  ];

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: SizedBox(
      height: 30.ht,
      child: ValueListenableBuilder(
        valueListenable: salaryNotifier,
        builder: (context, selectedSalary, child) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: salaryRanges.length,
            itemBuilder: (context, index) {
              final salary = salaryRanges[index];
              final isSelected = salary == selectedSalary;
              return GestureDetector(
                onTap: () => salaryNotifier.value = salary,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 8)
                          .rt,
                  margin: const EdgeInsets.only(right: 5).rt,
                  decoration: BoxDecoration(
                    color: isSelected ? Get.primaryColor : Get.disabledColor.o2,
                    borderRadius: BorderRadius.circular(20).r,
                  ),
                  child: AppText(salary, style: Get.bodySmall.w600.px14),
                ),
              );
            },
          );
        },
      ),
    ),
  );
}

Widget _buildActionButtons(
    WidgetRef ref,
    TextEditingController locationController,
    ValueNotifier<String?> salaryNotifier) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      AppTextButton(
        text: "Cancel",
        onPressed: () => Get.pop(),
      ),
      10.horizontalGap,
      SizedBox(
        width: 90.wt,
        height: 35.ht,
        child: AppButton(
          onTap: () {
            final salaryRange = _convertSalary(salaryNotifier.value);
            ref.read(filterProvider.notifier).state = {
              "location": locationController.text.trim(),
              "salaryMin": salaryRange["min"],
              "salaryMax": salaryRange["max"],
            };
            ref.read(filteredJobNotifierProvider.notifier).fetchJobs(
                  location: locationController.text.trim(),
                  salaryMin: salaryRange["min"],
                  salaryMax: salaryRange["max"],
                );

            Get.pop();
            Get.snackbar("Filter Applied!", color: Colors.green);
          },
          text: "Apply",
          radius: 40.r,
        ),
      ),
    ],
  );
}

Map<String, String?> _convertSalary(String? salary) {
  if (salary == null || salary == "Any") return {"min": null, "max": null};

  const Map<String, Map<String, String?>> salaryRangeMap = {
    "0-10k": {"min": "0", "max": "10000"},
    "10k-20k": {"min": "10000", "max": "20000"},
    "20k-30k": {"min": "20000", "max": "30000"},
    "30k-40k": {"min": "30000", "max": "40000"},
    "40k-50k": {"min": "40000", "max": "50000"},
    "50k+": {"min": "50000", "max": "10000000"},
  };

  return salaryRangeMap[salary] ?? {"min": null, "max": null};
}
