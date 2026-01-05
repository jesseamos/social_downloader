import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_downloader/core/config/colors_constant.dart';
import 'package:social_downloader/core/icons/vectors_icons.dart';
import 'package:social_downloader/core/widgets/svg_icon.dart';
import 'package:social_downloader/features/cat_download/presentation/screens/cat_download_detail.dart';
import 'package:social_downloader/features/dashboard/presentation/widget/custom_header.dart';
import 'package:social_downloader/features/dashboard/presentation/widget/sidebar.dart';

class CategoryDownloadScreen extends StatelessWidget {
  static const routeName = '/category-download';
  CategoryDownloadScreen({super.key});

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Sidebar(),
      backgroundColor: ColorsConstant.dashboardBg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              CustomHeader(
                title: "Category Download",
                toggleSidebar: () => _scaffoldKey.currentState?.openDrawer(),
              ),
              SizedBox(height: 30.h),

              // Grid of Categories
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 20.w,
                  childAspectRatio: 0.70,
                  children: [
                    _buildCategoryCard(
                      onTap: () {
                        context.push(CategoryDownloadDetailScreen.routeName);
                      },
                      icon: Icons.camera_alt_rounded,
                      color: Colors.orangeAccent,
                      name: "Instagram",
                      count: "120",
                    ),
                    _buildCategoryCard(
                      icon: Icons.music_note_rounded,
                      color: Colors.black,
                      name: "TikTok",
                      count: "36",
                    ),
                    _buildCategoryCard(
                      icon: Icons.alternate_email_rounded,
                      color: Colors.lightBlueAccent,
                      name: "Twitter",
                      count: "12",
                    ),
                    _buildCategoryCard(
                      icon: Icons.facebook_rounded,
                      color: const Color(0xff3B5998),
                      name: "Facebook",
                      count: "331",
                    ),
                    _buildCategoryCard(
                      icon: Icons.play_circle_fill_rounded,
                      color: Colors.red,
                      name: "Youtube",
                      count: "89", // Example count
                    ),
                    _buildCategoryCard(
                      icon: Icons.snapchat_rounded,
                      color: Colors.yellowAccent.shade700,
                      name: "Snapcat", // Matching the typo from the design
                      count: "45", // Example count
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required IconData icon,
    required Color color,
    required String name,
    required String count,
    Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(color: ColorsConstant.teal.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              margin: EdgeInsets.only(right: 15.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: ColorsConstant.teal.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: SvgIcon(svgPath: youtubeIcon, size: 20.sp),
            ),
            SizedBox(height: 15.h),
            Text(
              name,
              style: GoogleFonts.albertSans(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: ColorsConstant.primaryBlackText,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Total Download",
              style: GoogleFonts.albertSans(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                color: ColorsConstant.primaryGreyText,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              count,
              style: GoogleFonts.albertSans(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: ColorsConstant.primaryBlackText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
