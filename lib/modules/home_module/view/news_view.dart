import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/modules/home_module/model/News.dart';
import 'package:news_app/modules/home_module/widgets/app_bar_home_screen.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/widgets/custom_text.dart';

class NewsView extends StatelessWidget {
  const NewsView({Key? key, required this.newsData}) : super(key: key);
  final Data? newsData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Palette.txtHeadingColor,
                      )),
                ),
                const HomeScreenAppbar(
                  heading: "News Detail",
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(6.r),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.r),
                      child: CachedNetworkImage(
                        imageUrl: newsData?.imageUrl ?? "",
                        imageBuilder: (context, imageProvider) => Container(
                          height: 250.w,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomText(
                      text: newsData?.title ?? "",
                      size: 18,
                      maxLine: 2,
                      color: Palette.txtHeadingColor,
                      textAlign: TextAlign.start,
                      weight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CustomText(
                      text: newsData?.content ?? "",
                      size: 12,
                      maxLine: 20,
                      color: Palette.txtHeadingColor,
                      textAlign: TextAlign.start,
                      weight: FontWeight.w700,
                      opacity: 0.9,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: newsData?.author ?? "",
                          size: 10,
                          maxLine: 2,
                          opacity: 0.5,
                          color: Palette.txtHeadingColor,
                          textAlign: TextAlign.start,
                          weight: FontWeight.w700,
                        ),
                        CustomText(
                          text: newsData?.date ?? "",
                          size: 10,
                          maxLine: 2,
                          color: Palette.txtHeadingColor,
                          textAlign: TextAlign.start,
                          weight: FontWeight.w700,
                          opacity: 0.5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
