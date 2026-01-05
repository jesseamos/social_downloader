import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_downloader/core/config/colors_constant.dart';
import 'package:social_downloader/features/dashboard/presentation/screens/dashboard_screen.dart';

class GetStartedScreen extends StatelessWidget {
  static const routeName = '/get-started';
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              'assets/images/get_started_bg.png',
              width: 1.sw,
              fit: BoxFit.fitWidth,
            ),
          ),

          // Content at the top
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Very fast and 100% free",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorsConstant.primaryGreyText,
                          ),
                        ),
                        Text(
                          "Supports",
                          style: TextStyle(
                            fontSize: 38.sp,
                            fontWeight: FontWeight.w700,
                            color: ColorsConstant.primaryBlackText,
                          ),
                        ),
                      ],
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
                              // Yellow highlight (half height)
                              Positioned(
                                top: 4.h, // controls vertical position
                                child: Container(
                                  height: 18.h, // half highlight height
                                  width: 500.w, // adjust to word width
                                  color: ColorsConstant.yellow,
                                ),
                              ),

                              // Text on top
                              Padding(
                                padding: EdgeInsets.only(left: 24.w),
                                child: Text(
                                  "multiple",
                                  style: TextStyle(
                                    fontSize: 30.sp,
                                    fontWeight: FontWeight.w500,
                                    color: ColorsConstant.primaryBlackText,
                                    height: 1.2,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextSpan(
                          text: " Source",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 38.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Text(
                      "Social Media Downloader is the easiest application to download videos from Facebook, Instagram, Twitter, Tik Tok and WhatsApp cases.",
                      style: GoogleFonts.albertSans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorsConstant.primaryGreyText,
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),

                  // Get Started Button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: InkWell(
                      onTap: () {
                        context.push(DashboardScreen.routeName);
                      },
                      borderRadius: BorderRadius.circular(50.r),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsConstant.teal,
                          borderRadius: BorderRadius.circular(50.r),
                          boxShadow: [
                            BoxShadow(
                              color: ColorsConstant.teal.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Get Started",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: ColorsConstant.yellow,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.chevron_right,
                                color: ColorsConstant.primaryBlackText,
                                size: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
