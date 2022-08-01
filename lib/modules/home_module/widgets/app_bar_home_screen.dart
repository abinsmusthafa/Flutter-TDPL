import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shipyard_customer_mobile/click_stream/controller/click_stream_controller.dart';
import 'package:shipyard_customer_mobile/modules/cart/controller/cart_screen_controller.dart';
import 'package:shipyard_customer_mobile/utils/const.dart';
import 'package:shipyard_customer_mobile/widgets/text_button_with_image.dart';
import 'package:shipyard_customer_mobile/widgets/custom_text.dart';
import 'package:shipyard_customer_mobile/widgets/divider.dart';

class CartScreenAppbar extends StatelessWidget {
  final String heading;
  final Function? onTapBackButton;

  const CartScreenAppbar({
    Key? key,
    required this.heading,
    this.onTapBackButton,
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
          padding: EdgeInsets.symmetric(horizontal: Properties.commonHorizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ExpandTapWidget(
                    tapPadding: EdgeInsets.all(30.w),
                    onTap: () {
                      if (onTapBackButton == null) {
                        CartScreenController().resetTipAndTotal(isFromBackButton: true);
                        Get.back();
                      } else {
                        onTapBackButton!();
                        Get.back();
                      }
                    },
                    child: SvgPicture.asset(
                      Assets.backArrowIcon,
                      width: 7.w,
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  CustomText(
                    text: heading,
                    size: 16,
                    maxLine: 1,
                    color: Palette.txtHeadingColor,
                    textAlign: TextAlign.start,
                    weight: FontWeight.w700,
                  ),
                ],
              ),

              // Spacer(),
              GetBuilder<CartScreenController>(
                init: CartScreenController(), // INIT IT ONLY THE FIRST TIME
                builder: (_) => Visibility(
                  visible: (((CartScreenController().cartProductList?.length ?? 0) > 0 && (CartScreenController().getCartCount()) > 0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButtonWithImage(
                        onClick: () {
                          ClickStreamController().eventBus.fire( ["Cart Items", "Clear"]);
                          CartScreenController().clearCartItems();
                        },
                        text: "clear".tr,
                        image: Assets.closeIcon,
                      ),
                      CustomText(
                        text: '${(CartScreenController().getCartCount().toString() ?? "").toString()} ${"items-in-cart".tr} ',
                        size: 11,
                        color: Palette.txtHeadingColor,
                        weight: FontWeight.w400,
                        maxLine: 1,
                        isItalic: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        DividerWidget()
      ],
    );
  }
}
