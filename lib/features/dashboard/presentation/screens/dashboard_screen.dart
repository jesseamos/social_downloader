import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_downloader/core/config/colors_constant.dart';
import 'package:social_downloader/core/icons/vectors_icons.dart';
import 'package:social_downloader/core/widgets/svg_icon.dart';
import 'package:social_downloader/features/dashboard/presentation/widget/custom_header.dart';
import 'package:social_downloader/features/dashboard/presentation/widget/download_bottom_modal.dart';
import 'package:social_downloader/features/dashboard/presentation/widget/sidebar.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _blurAnimation;
  late Animation<Offset> _sidebarAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _blurAnimation = Tween<double>(begin: 0.0, end: 10.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _sidebarAnimation =
        Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleSidebar() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  void _showDownloadModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      barrierColor: Colors.black.withOpacity(0.15),
      builder: (context) {
        return Stack(
          children: [
            // 🔥 Fullscreen blur
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(color: Colors.black.withOpacity(0.1)),
              ),
            ),

            // ⬇️ Bottom-anchored modal
            Align(
              alignment: Alignment.bottomCenter,
              child: const DownloadBottomModal(),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstant.dashboardBg,
      body: Stack(
        children: [
          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),

                  // Custom Header
                  CustomHeader(
                    title: "Social Downloader",
                    toggleSidebar: _toggleSidebar,
                  ),
                  SizedBox(height: 30.h),
                  // Paste Link Section
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 48.h,
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.r),
                            border: Border.all(
                              color: Colors.teal.withOpacity(0.2),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              SvgIcon(svgPath: linkIcon, size: 24.sp),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Paste link here...",
                                    hintStyle: GoogleFonts.albertSans(
                                      color: ColorsConstant.primaryGreyText,
                                      fontSize: 16.sp,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      GestureDetector(
                        onTap: _showDownloadModal,
                        child: Container(
                          height: 48.h,
                          width: 48.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsConstant.teal,
                            boxShadow: [
                              BoxShadow(
                                color: ColorsConstant.teal.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.file_download_outlined,
                            color: Colors.white,
                            size: 28.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  // History By Applications
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "History By Applications",
                        style: GoogleFonts.albertSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsConstant.primaryBlackText,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            width: 0 == index ? 10 : 3,
                            height: 4,
                            decoration: BoxDecoration(
                              color: 0 == index
                                  ? ColorsConstant.teal
                                  : ColorsConstant.teal.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 60.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildPlatformIcon(
                          Icons.camera_alt_rounded,
                          Colors.orangeAccent,
                        ),
                        _buildPlatformIcon(
                          Icons.alternate_email_rounded,
                          Colors.lightBlueAccent,
                        ),
                        _buildPlatformIcon(
                          Icons.facebook_rounded,
                          const Color(0xff3B5998),
                        ),
                        _buildPlatformIcon(
                          Icons.music_note_rounded,
                          Colors.black,
                        ),
                        _buildPlatformIcon(
                          Icons.play_circle_fill_rounded,
                          Colors.red,
                        ),
                        _buildPlatformIcon(
                          Icons.play_circle_fill_rounded,
                          Colors.red,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Downloads",
                        style: GoogleFonts.albertSans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsConstant.primaryBlackText,
                        ),
                      ),
                      Text(
                        "31 Files",
                        style: GoogleFonts.albertSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsConstant.primaryGreyText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  _buildDownloadCard(
                    "assets/images/sample_download_1.png",
                    "Elijah M. Henderson",
                    "@elijahhenderson",
                    "emh.",
                  ),
                  SizedBox(height: 20.h),
                  _buildDownloadCard(
                    "assets/images/sample_download_2.png",
                    "Julian R. Manning",
                    "@julianmanning",
                    "jrm.",
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),

          // Blur Overlay
          AnimatedBuilder(
            animation: _blurAnimation,
            builder: (context, child) {
              if (_blurAnimation.value == 0) return const SizedBox.shrink();
              return GestureDetector(
                onTap: _toggleSidebar,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: _blurAnimation.value,
                    sigmaY: _blurAnimation.value,
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(
                      0.1 * (_blurAnimation.value / 10),
                    ),
                  ),
                ),
              );
            },
          ),

          // Sidebar
          SlideTransition(
            position: _sidebarAnimation,
            child: Sidebar(onClose: _toggleSidebar),
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformIcon(IconData icon, Color color) {
    return Container(
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
    );
  }

  Widget _buildDownloadCard(
    String image,
    String name,
    String username,
    String initials,
  ) {
    return Container(
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(
              image,
              width: 1.sw,
              height: 200.h,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: const Color(0xff3B5998),
                  child: Text(
                    initials,
                    style: TextStyle(color: Colors.white, fontSize: 10.sp),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.albertSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                          color: ColorsConstant.primaryBlackText,
                        ),
                      ),
                      Text(
                        username,
                        style: GoogleFonts.albertSans(
                          fontSize: 10.sp,
                          color: ColorsConstant.primaryGreyText,
                        ),
                      ),
                    ],
                  ),
                ),
                SvgIcon(
                  svgPath: shareIcon,
                  size: 22.sp,
                  color: ColorsConstant.primaryGreyText,
                ),
                SizedBox(width: 15.w),
                SvgIcon(
                  svgPath: trashIcon,
                  color: ColorsConstant.primaryGreyText,
                  size: 22.sp,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
