
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:news_app/utils/app_color.dart';
import 'package:news_app/widgets/custom_text.dart';


class HomeScreenAppbar extends StatelessWidget {
  final String heading;


  const HomeScreenAppbar({
    Key? key,
    required this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 15.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [

                  CustomText(
                    text: heading,
                    size: 25,
                    maxLine: 1,
                    color: Palette.txtHeadingColor,
                    textAlign: TextAlign.start,
                    weight: FontWeight.w700,
                  ),
                ],
              ),

            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
    Divider(
    color: Palette.dividerColor.withOpacity(0.2),
    height: 0,
    ),
      ],
    );
  }
}
