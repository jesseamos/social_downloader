import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_downloader/core/config/colors_constant.dart';
import 'package:social_downloader/core/icons/vectors_icons.dart';
import 'package:social_downloader/core/widgets/svg_icon.dart';

class CustomHeader extends StatelessWidget {
  final Function() toggleSidebar;
  final String title;
  const CustomHeader({
    super.key,
    required this.toggleSidebar,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: toggleSidebar,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: ColorsConstant.iconGrey,
              shape: BoxShape.circle,
            ),
            child: SvgIcon(svgPath: dashboardIcon, size: 24.sp),
          ),
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 26.sp,
              color: ColorsConstant.primaryBlackText,
              height: 1.2,
            ),
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Positioned(
                      bottom: 10.h,
                      child: Container(
                        height: 14.h,
                        width: 500.w,
                        color: ColorsConstant.yellow,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorsConstant.primaryBlackText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Badge(
          backgroundColor: Colors.green,
          label: Text(
            "2",
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: SvgIcon(svgPath: notificationIcon, size: 26.sp),
        ),
      ],
    );
  }
}
