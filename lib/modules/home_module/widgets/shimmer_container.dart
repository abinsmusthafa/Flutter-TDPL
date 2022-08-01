import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({Key? key,required this.height,required this.width}) : super(key: key);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: height.h,
      width: width.h,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        boxShadow: [
          BoxShadow(
            color: Color(0xff506E7B).withOpacity(0.2),
            blurRadius: 3,
            offset: Offset(.24, 2),
          )
        ],
      ),
    );
  }
}
