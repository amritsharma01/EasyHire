import 'package:easyhire_app/core/extensions/border_radius.dart';
import 'package:easyhire_app/core/extensions/color_extensions.dart';
import 'package:easyhire_app/core/extensions/int.dart';
import 'package:flutter/material.dart';

import '../../../../core/services/get.dart';
import '../../../../core/utils/app_icons.dart';
import '../../../auth/presentation/widgets/buttonWidgets/appicon.dart';

// ignore: must_be_immutable
class EditIcon extends StatelessWidget {
  void Function()? ontap;
  EditIcon({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 15,
      child: Container(
          height: 24.wt,
          width: 24.wt,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50).rt,
              border: Border.all(color: Get.disabledColor.o3, width: 1.rt)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: AppIcon(AppIcons.edit,
                size: 14, color: Get.primaryColor, onTap: ontap),
          ))),
    );
  }
}
