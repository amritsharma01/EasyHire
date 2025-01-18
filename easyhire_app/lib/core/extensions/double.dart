import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SizeExtensionsD on double {
  SizedBox get verticalGap {
    final height = this;
    return height.verticalSpace;
  }

  SizedBox get horizontalGap {
    final width = this;
    return width.horizontalSpace;
  }

  double get ht {
    final height = this;
    return height.h;
  }

  double get wt {
    final width = this;
    return width.w;
  }

  double get rt {
    final radius = this;
    return radius.r;
  }

  double get st {
    final spT = this;
    return spT.sp;
  }
}
