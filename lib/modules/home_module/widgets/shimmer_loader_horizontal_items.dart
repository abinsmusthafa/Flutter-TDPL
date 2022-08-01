import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({Key? key, this.isLiquorStore = false}) : super(key: key);
  final bool isLiquorStore;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Shimmer.fromColors(
        child: MediaQuery.removePadding(
          context: context,
          removeBottom: true,
          removeTop: true,
          removeLeft: true,
          child: ListView.builder(
            itemCount: 10,
            padding: EdgeInsets.only(bottom: 10),
            itemBuilder: (BuildContext _context, int index) {
              return Padding(
                padding: EdgeInsets.only(right: 6.w, top: 10.h, bottom: 2.h, left: 6.w),
                child: Container(
                  width: 160.w,
                  height: 180.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.8.r),
                    ),
                    boxShadow: [
                      BoxShadow(color: Color(0xff000C35).withOpacity(.3), offset: Offset(0, 6.5), blurRadius: 6),
                    ],
                    color: Palette.white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                ),
              );
            },
          ),
        ),
        baseColor: Color.fromARGB(255, 212, 210, 210),
        highlightColor: Color.fromARGB(255, 165, 164, 164),
      ),
    );
  }
}
