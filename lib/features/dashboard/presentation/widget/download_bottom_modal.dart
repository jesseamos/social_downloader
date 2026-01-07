import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_downloader/core/config/colors_constant.dart';
import 'package:social_downloader/core/icons/vectors_icons.dart';
import 'package:social_downloader/core/widgets/svg_icon.dart';

class DownloadBottomModal extends StatefulWidget {
  const DownloadBottomModal({super.key});

  @override
  State<DownloadBottomModal> createState() => _DownloadBottomModalState();
}

class _DownloadBottomModalState extends State<DownloadBottomModal> {
  int _selectedOption = 1; // 0 for HD, 1 for SD (as per image default)

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          // Close Button
          Positioned(
            top: -26.h,
            child: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                width: 44.h,
                height: 44.h,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.85),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  margin: EdgeInsets.all(12.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.close, color: Colors.black, size: 10.sp),
                ),
              ),
            ),
          ),

          // Modal Content
          Container(
            margin: EdgeInsets.only(top: 25.h),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.h),
                Text(
                  "Video Found",
                  style: GoogleFonts.albertSans(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorsConstant.primaryBlackText,
                  ),
                ),
                SizedBox(height: 20.h),
                Divider(color: Colors.grey.withOpacity(0.2)),
                SizedBox(height: 20.h),

                // Video Info
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.asset(
                            "assets/images/sample_download_1.png",
                            width: 120.w,
                            height: 80.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 5.h,
                          right: 5.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 6.w,
                              vertical: 2.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Text(
                              "01:08",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ayu Puspa",
                            style: GoogleFonts.albertSans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorsConstant.primaryBlackText,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "Duh kangen musik asal timur yang selalu menemai vlog..",
                            style: GoogleFonts.albertSans(
                              fontSize: 12.sp,
                              color: ColorsConstant.primaryGreyText,
                              height: 1.4,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),
                Divider(color: Colors.grey.withOpacity(0.2)),
                SizedBox(height: 10.h),

                // HD Video Option
                _buildDownloadOption(
                  index: 0,
                  title: "HD Video",
                  size: "9.56MB",
                  icon: Icons.video_library_rounded,
                  iconColor: Colors.amber,
                ),

                // SD Video Option
                _buildDownloadOption(
                  index: 1,
                  title: "SD Video",
                  size: "2.2MB",
                  icon: Icons.video_library_rounded,
                  iconColor: Colors.amber,
                ),

                // Watch Video Option
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: SvgIcon(svgPath: videoTVIcon, size: 24.sp),
                  title: Text(
                    "Watch Video",
                    style: GoogleFonts.albertSans(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorsConstant.primaryBlackText,
                    ),
                  ),
                  trailing: Icon(
                    Icons.chevron_right_rounded,
                    color: ColorsConstant.primaryBlackText,
                    size: 20.sp,
                  ),
                  onTap: () {},
                ),

                SizedBox(height: 10.h),
                Divider(color: Colors.grey.withOpacity(0.2)),
                SizedBox(height: 25.h),

                // Actions
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          side: BorderSide(color: Colors.black, width: 1.2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.albertSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorsConstant.primaryBlackText,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsConstant.teal,
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                        child: Text(
                          "Download",
                          style: GoogleFonts.albertSans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDownloadOption({
    required int index,
    required String title,
    required String size,
    required IconData icon,
    required Color iconColor,
  }) {
    bool isSelected = _selectedOption == index;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedOption = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            SvgIcon(
              svgPath: videoPlayIcon,
              size: 24.sp,
              color: ColorsConstant.yellow,
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.albertSans(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorsConstant.primaryBlackText,
                ),
              ),
            ),
            Text(
              "Size $size",
              style: GoogleFonts.albertSans(
                fontSize: 12.sp,
                color: ColorsConstant.primaryGreyText,
              ),
            ),
            SizedBox(width: 10.w),
            Container(
              width: 18.h,
              height: 18.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                border: Border.all(
                  color: isSelected
                      ? ColorsConstant.teal
                      : Colors.grey.withOpacity(0.5),
                  width: 1.5,
                ),
                color: isSelected ? ColorsConstant.teal : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(Icons.check, color: Colors.white, size: 14.sp)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
