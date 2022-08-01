import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Center(
              child: SizedBox(
                height: 80.h,
                width: 220.w,
                child: Image.asset(Assets.splashIcon),
              ),
            ),
            SizedBox(
              width: 25.w,
              height: 25.w,
              child: const CircularProgressIndicator(strokeWidth: 3, color: Palette.txtHeadingColor),
            ),
          ],
        ),
      ),
    );
  }
}
