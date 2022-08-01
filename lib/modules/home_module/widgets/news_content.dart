import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/modules/home_module/model/News.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/widgets/custom_text.dart';

class NewsContent extends StatelessWidget {
  const NewsContent({Key? key, required this.newsData}) : super(key: key);
  final Data? newsData;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(6.r),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(6.8.r),
                ),
                boxShadow: [
                  BoxShadow(color: const Color(0xff000C35).withOpacity(.3), offset: const Offset(0, 6.5), blurRadius: 6),
                ],
                color: Palette.white,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6.r),
                      child: CachedNetworkImage(
                        imageUrl: newsData?.imageUrl ?? "",
                        imageBuilder: (context, imageProvider) => Container(
                          height: 150.w,
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
                      size: 15,
                      maxLine: 2,
                      color: Palette.txtHeadingColor,
                      textAlign: TextAlign.start,
                      weight: FontWeight.w700,
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
          )),
    );
  }
}
