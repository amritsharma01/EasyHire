import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../auth/presentation/widgets/buttonWidgets/button.dart';
import '../../../auth/presentation/widgets/textWidgets/app_text.dart';

class ErrorButton extends ConsumerWidget {
  const ErrorButton({super.key, this.provider});

  final ProviderOrFamily? provider;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(children: [
        10.verticalSpace,
        AppText("Unexpected Error Occur"),
        5.verticalSpace,
        AppButton(
            onTap: () {
              if (provider != null) {
                ref.invalidate(provider!);
              }
            },
            text: "Reload")
      ]),
    );
  }
}
