import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:news_app/modules/home_module/controller/home_screen_controller.dart';
import 'package:news_app/modules/home_module/widgets/app_bar_home_screen.dart';
import 'package:news_app/modules/home_module/widgets/news_content.dart';
import 'package:news_app/modules/home_module/widgets/shimmer_loader_horizontal_items.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(), // INIT IT ONLY THE FIRST TIME
      builder: (_) => Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const HomeScreenAppbar(
                heading: "News",
              ),
              HomeScreenController().isLoading.value
                  ? const ShimmerItem()
                  : Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          return HomeScreenController().onInit();
                        },
                        child: GetBuilder<HomeScreenController>(
                          init: HomeScreenController(),
                          // INIT IT ONLY THE FIRST TIME
                          builder: (_) => SingleChildScrollView(
                            child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: HomeScreenController().newsList?.length ?? 0,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (BuildContext _context, int index) {
                                  return NewsContent(
                                    newsData: HomeScreenController().newsList?[index],
                                  );
                                }),
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
