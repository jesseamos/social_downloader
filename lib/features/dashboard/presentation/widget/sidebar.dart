import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_downloader/core/config/colors_constant.dart';
import 'package:social_downloader/features/cat_download/presentation/screens/cat_download.dart';

class Sidebar extends StatelessWidget {
  final VoidCallback? onClose;
  const Sidebar({super.key, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 0.85.sw,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.r),
            bottomRight: Radius.circular(40.r),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Close Button
                IconButton(
                  onPressed: onClose,
                  icon: Icon(
                    Icons.close,
                    size: 28.sp,
                    color: ColorsConstant.primaryBlackText,
                  ),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                ),

                SizedBox(height: 20.h),

                // User Profile Card
                Container(
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.r),
                    border: Border.all(
                      color: ColorsConstant.teal.withOpacity(0.2),
                      width: 1.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),

                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: CircleAvatar(
                            radius: 25.r,
                            backgroundImage: const AssetImage(
                              'assets/images/profile_anastasya.png',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Anastasya",
                              style: GoogleFonts.albertSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                                color: ColorsConstant.primaryBlackText,
                              ),
                            ),
                            Text(
                              "Social Addict",
                              style: GoogleFonts.albertSans(
                                fontSize: 12.sp,
                                color: ColorsConstant.primaryGreyText,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: ColorsConstant.primaryBlackText,
                        size: 24.sp,
                      ),
                      SizedBox(width: 5.w),
                    ],
                  ),
                ),

                SizedBox(height: 40.h),

                // Menu Items
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _buildSidebarTile(
                        onTap: () {
                          onClose?.call();
                          context.push(CategoryDownloadScreen.routeName);
                        },
                        icon: Icons.inventory_2_outlined,
                        title: "Category Download",
                        subtitle: "See all category downloaded",
                      ),
                      _buildSidebarTile(
                        icon: Icons.lock_outline_rounded,
                        title: "Security Acces",
                        subtitle: "Set your security acces",
                      ),
                      _buildSidebarTile(
                        icon: Icons.folder_open_rounded,
                        title: "Storage Folder",
                        subtitle: "Internal storage / Dowloaded",
                      ),
                      _buildSidebarTile(
                        icon: Icons.notifications_none_rounded,
                        title: "Push Notification",
                        subtitle: "Set up your push notif",
                        trailing: Transform.scale(
                          scale: 0.7, // 👈 adjust (0.7–0.9 sweet spot)
                          child: Switch(
                            value: true,
                            onChanged: (val) {},
                            activeColor: ColorsConstant.teal,
                          ),
                        ),
                      ),
                      _buildSidebarTile(
                        icon: Icons.dark_mode_outlined,
                        title: "Dark Mode",
                        subtitle: "Theme for this app",
                        trailing: Transform.scale(
                          scale: 0.7, // 👈 adjust (0.7–0.9 sweet spot)
                          child: Switch(
                            value: true,
                            onChanged: (val) {},
                            activeColor: ColorsConstant.teal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Log out Button
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () {
                    onClose?.call();
                    // Action for Log out
                  },
                  borderRadius: BorderRadius.circular(50.r),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
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
                          "Log out",
                          style: GoogleFonts.albertSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: ColorsConstant.yellow,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.chevron_right,
                            color: ColorsConstant.primaryBlackText,
                            size: 17.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSidebarTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    Function()? onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none, // 👈 VERY IMPORTANT
              children: [
                Container(
                  width: 25.w,
                  height: 25.w,
                  decoration: BoxDecoration(
                    color: ColorsConstant.yellow.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                ),

                Positioned(
                  right: -4.w, // 👈 pushes icon outside
                  top: -8.w,
                  child: Icon(
                    icon,
                    size: 20.sp,
                    color: ColorsConstant.primaryBlackText,
                  ),
                ),
              ],
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.albertSans(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: ColorsConstant.primaryBlackText,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.albertSans(
                      fontSize: 12.sp,
                      color: ColorsConstant.primaryGreyText,
                    ),
                  ),
                ],
              ),
            ),
            if (trailing != null) trailing,
          ],
        ),
      ),
    );
  }
}
