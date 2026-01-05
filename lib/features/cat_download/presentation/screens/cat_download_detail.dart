import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_downloader/core/config/colors_constant.dart';
import 'package:social_downloader/core/icons/vectors_icons.dart';
import 'package:social_downloader/core/widgets/svg_icon.dart';

class CategoryDownloadDetailScreen extends StatelessWidget {
  static const routeName = '/category-download-detail';
  const CategoryDownloadDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConstant.dashboardBg,
      appBar: AppBar(
        backgroundColor: ColorsConstant.dashboardBg,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsConstant.primaryBlackText,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Instagram",
          style: GoogleFonts.albertSans(
            color: ColorsConstant.primaryBlackText,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
          ),
        ),
        centerTitle: true,
        actions: [
          SvgIcon(svgPath: shareIcon, size: 24.sp),
          SizedBox(width: 16.w),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 100.h),
            children: [
              _buildDownloadItem(
                thumbnail: 'https://picsum.photos/id/237/200/300',
                avatar: 'https://i.pravatar.cc/150?u=a',
                name: "Ray Potter",
                caption: "Behind the scene from..",
                size: "8.9MB",
                progress: 0.6,
                progressInfo: "4.6MB/8.9MB",
                isDownloading: true,
                duration: "01:08",
              ),
              _buildDownloadItem(
                thumbnail: 'https://picsum.photos/id/10/200/300',
                avatar: 'https://i.pravatar.cc/150?u=b',
                name: "Alvin Newton",
                caption: "Women Standing on focus..",
                size: "1.7MB",
                isDownloading: false,
                isImage: true,
              ),
              _buildDownloadItem(
                thumbnail: 'https://picsum.photos/id/20/200/300',
                avatar: 'https://i.pravatar.cc/150?u=c',
                name: "Jackson Townsend",
                caption: "Beware the lure of free",
                size: "2.3MB",
                isDownloading: false,
                isImage: true,
              ),
              _buildDownloadItem(
                thumbnail: 'https://picsum.photos/id/30/200/300',
                avatar: 'https://i.pravatar.cc/150?u=d',
                name: "Kyle Morales",
                caption: "Africa is calling",
                size: "12.7MB",
                isDownloading: false,
                duration: "01:15",
              ),
              _buildDownloadItem(
                thumbnail: 'https://picsum.photos/id/40/200/300',
                avatar: 'https://i.pravatar.cc/150?u=e',
                name: "Margaret Townsend",
                caption: "Beware the lure of free",
                size: "7.6MB",
                isDownloading: false,
                duration: "01:08",
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgIcon(svgPath: videoPlayIcon, size: 32.sp, color: Colors.amber),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: LinearProgressIndicator(
                      value: 0.6,
                      backgroundColor: ColorsConstant.greyBorder,
                      color: ColorsConstant.teal,
                      minHeight: 4.h,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "8.9MB",
                        style: GoogleFonts.albertSans(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsConstant.teal,
                        ),
                      ),
                      Text(
                        "4.6MB/8.9MB",
                        style: GoogleFonts.albertSans(
                          fontSize: 10.sp,
                          color: ColorsConstant.primaryGreyText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 15.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: ColorsConstant.teal,
                borderRadius: BorderRadius.circular(25.r),
              ),
              child: Text(
                "Private Folder",
                style: GoogleFonts.albertSans(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDownloadItem({
    required String thumbnail,
    required String avatar,
    required String name,
    required String caption,
    required String size,
    double progress = 0.0,
    String? progressInfo,
    bool isDownloading = false,
    String? duration,
    bool isImage = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thumbnail
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: Image.network(
                      thumbnail,
                      width: 110.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (duration != null)
                    Container(
                      margin: EdgeInsets.all(5.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        duration,
                        style: TextStyle(color: Colors.white, fontSize: 10.sp),
                      ),
                    ),
                  if (isImage)
                    Padding(
                      padding: EdgeInsets.all(5.w),
                      child: Icon(
                        Icons.image_outlined,
                        color: Colors.white.withOpacity(0.8),
                        size: 18.sp,
                      ),
                    ),
                ],
              ),
              SizedBox(width: 15.w),
              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10.r,
                          backgroundImage: NetworkImage(avatar),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          name,
                          style: GoogleFonts.albertSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            color: ColorsConstant.primaryBlackText,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      caption,
                      style: GoogleFonts.albertSans(
                        fontSize: 10.sp,
                        color: ColorsConstant.primaryGreyText,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8.h),
                    if (isDownloading) ...[
                      Row(
                        children: [
                          Text(
                            size,
                            style: GoogleFonts.albertSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorsConstant.teal,
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Text(
                            progressInfo ?? "",
                            style: GoogleFonts.albertSans(
                              fontSize: 12.sp,
                              color: ColorsConstant.primaryGreyText,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.pause_circle_outline_rounded,
                            size: 22.sp,
                            color: ColorsConstant.primaryBlackText,
                          ),
                          SizedBox(width: 10.w),
                          Icon(
                            Icons.more_vert_rounded,
                            size: 22.sp,
                            color: ColorsConstant.primaryGreyText,
                          ),
                        ],
                      ),
                      SizedBox(height: 5.h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: LinearProgressIndicator(
                          value: progress,
                          backgroundColor: ColorsConstant.greyBorder,
                          color: ColorsConstant.teal,
                          minHeight: 3.h,
                        ),
                      ),
                    ] else
                      Row(
                        children: [
                          Text(
                            size,
                            style: GoogleFonts.albertSans(
                              fontSize: 12.sp,
                              color: ColorsConstant.primaryGreyText,
                            ),
                          ),
                          const Spacer(),
                          if (!isImage) ...[
                            Icon(
                              Icons.play_circle_fill_rounded,
                              size: 24.sp,
                              color: ColorsConstant.primaryBlackText,
                            ),
                            SizedBox(width: 10.w),
                          ],
                          Icon(
                            Icons.more_vert_rounded,
                            size: 22.sp,
                            color: ColorsConstant.primaryGreyText,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(color: ColorsConstant.teal.withOpacity(0.2), thickness: 1),
        ],
      ),
    );
  }
}
