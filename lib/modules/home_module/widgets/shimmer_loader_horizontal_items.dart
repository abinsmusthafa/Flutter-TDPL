import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shipyard_customer_mobile/utils/const.dart';
import 'package:shipyard_customer_mobile/widgets/heading_with_subheading.dart';
import 'package:shipyard_customer_mobile/widgets/list_view_size_box.dart';
import 'package:shipyard_customer_mobile/widgets/shimmer_container.dart';

class ShimmerHorizontalItem extends StatelessWidget {
  const ShimmerHorizontalItem({Key? key, this.isLiquorStore = false}) : super(key: key);
  final bool isLiquorStore;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Properties.commonHorizontalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerContainer(
                  height: 5,
                  width: 0.5.sw,
                ),
                SizedBox(height: 5.h,),
                ShimmerContainer(
                  height: 4,
                  width: 0.4.sw,
                ),
                SizedBox(height: 5.h,),
            ListViewHeightContainer(
            child: MediaQuery.removePadding(
            context: context,
              removeBottom: true,
              removeTop: true,
              removeLeft: true,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                padding: EdgeInsets.only(
                    bottom: 10),
                itemBuilder: (BuildContext _context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 6.w, top: 2.h, bottom: 2.h),
                    child: Container(
                      width: 160.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6.8.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff000C35).withOpacity(.3),
                              offset: Offset(0, 6.5),
                              blurRadius: 6),
                        ],
                        color: Palette.white,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                    ),
                  );
                },
              ),
            ),
          ),
              ],
            ),
          ),
        ],
      ),
      baseColor: Color.fromARGB(255, 212, 210, 210),
      highlightColor: Color.fromARGB(255, 165, 164, 164),
    );
  }
}
