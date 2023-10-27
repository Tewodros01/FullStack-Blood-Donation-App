import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/src/constants/colors.dart';
import 'package:frontend/src/constants/image_strings.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.red.shade700,
                  Colors.red.shade800,
                  Colors.red.shade900,
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 25,
                  left: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          TextWidget(
                            "Donate blood",
                            20.h,
                            Colors.white,
                            FontWeight.bold,
                            letterSpace: 1,
                          ),
                          SizedBox(height: 5.h),
                          TextWidget(
                            "Save Life",
                            20.h,
                            Colors.white,
                            FontWeight.bold,
                            letterSpace: 1,
                          ),
                        ],
                      ),
                      SizedBox(width: 30.w),
                      Image(
                        height: 100.h,
                        width: 170.w,
                        fit: BoxFit.fill,
                        image: const AssetImage(
                          cOnBoardingImage1,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 5,
                  child: Container(
                    height: 40.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                      color: cDarkColor,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          TextWidget(
                            "How to use",
                            15.h,
                            Colors.white,
                            FontWeight.bold,
                            letterSpace: 1,
                          ),
                          SizedBox(width: 5.w),
                          Container(
                            decoration: const BoxDecoration(
                              color: cWhiteColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(
                                Icons.play_arrow,
                                size: 18.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String text;
  final double letterSpace;
  double size = 5.0;
  FontWeight fontWeight = FontWeight.normal;
  final Color color;

  TextWidget(this.text, this.size, this.color, this.fontWeight,
      {super.key, this.letterSpace = 3});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontWeight: fontWeight,
          letterSpacing: letterSpace),
    );
  }
}
