import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/src/common_widgets/app_bar/app_bar.dart';
import 'package:frontend/src/constants/colors.dart';
import 'package:frontend/src/constants/image_strings.dart';
import 'package:frontend/src/features/core/models/recent_doner_model.dart';
import 'package:frontend/src/features/core/pages/home_page/widgets/blood_reques_widget.dart';
import 'package:frontend/src/features/core/pages/home_page/widgets/card_container.dart';
import 'package:frontend/src/features/core/pages/my_request_page/my_request_page.dart';
import 'package:frontend/src/providers/providers.dart';
import 'package:get/get.dart';

class BloodPage extends StatefulWidget {
  const BloodPage({super.key});

  @override
  State<BloodPage> createState() => _BloodPageState();
}

class _BloodPageState extends State<BloodPage> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Home", context),
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 10.h)),
          const CardContainer(),
          SliverToBoxAdapter(child: SizedBox(height: 10.h)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 15.0),
              child: TextWidget(
                "Recent Doner",
                17,
                Colors.black.withOpacity(.7),
                FontWeight.bold,
              ),
            ),
          ),
          _buildRecentDonerData(context),
          SliverToBoxAdapter(child: SizedBox(height: 10.h)),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 15.0),
              child: TextWidget(
                "Recent Request",
                17,
                Colors.black.withOpacity(.7),
                FontWeight.bold,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 10.h)),
          const BloodRequestWidget(),
        ],
      ),
    );
  }

  Widget customeAppBar() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  "Hello , ",
                  17,
                  Colors.black.withOpacity(.7),
                  FontWeight.bold,
                ),
                TextWidget(
                  "Tewodros",
                  17,
                  Colors.black,
                  FontWeight.bold,
                ),
              ],
            ),
            const Icon(Icons.phonelink_ring)
          ],
        ),
      ),
    );
  }

  Widget categoryRow(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        height: 170.h,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            category(cWelcomeScreenImage, "A+", 5),
            category(cWelcomeScreenImage, "A-", 5),
            category(cWelcomeScreenImage, "B+", 5),
            category(cWelcomeScreenImage, "B-", 5),
            category(cWelcomeScreenImage, "AB+", 5),
            category(cWelcomeScreenImage, "AB-", 5),
            category(cWelcomeScreenImage, "O+", 5),
            category(cWelcomeScreenImage, "O-", 5),
          ],
        ),
      ),
    );
  }

  Widget category(String asset, String txt, double padding) {
    return Column(
      children: [
        InkWell(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.all(padding),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(asset),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 5.h),
        TextWidget(
          txt,
          16,
          Colors.black,
          FontWeight.bold,
          letterSpace: 1,
        ),
      ],
    );
  }

  Widget _buildCard(String title, String subtitle, IconData iconData,
      Color color, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed, // Use the provided onPressed callback
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: const BorderSide(
            color: Colors.red,
            width: 1.0,
          ),
        ),
        color: color,
        elevation: 3.0,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.0),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  iconData,
                  color: Colors.red,
                  size: 48,
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget myRequestWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the "My Request" page here
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const MyRequestPage(), // Replace with your page
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              color: Colors.red,
              width: 1.3,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "MyRequest".tr,
                style: const TextStyle(
                  color: cPrimaryColor,
                ),
              ),
              const Icon(
                color: cPrimaryColor,
                Icons.arrow_forward_sharp,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentDonerData(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final recentDonersState = ref.watch(recentDonersProvider);
        if (recentDonersState.recentDoners.isEmpty) {
          ref.watch(recentDonersProvider.notifier).getRecentDoner();
          if (!recentDonersState.hasNext && !recentDonersState.isLoading) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text("No Recent Doner"),
              ),
            );
          }
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return recentDoner(recentDonersState.recentDoners);
        }
      },
    );
  }

  Widget recentDoner(List<RecentDoner> recentDoners) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: SizedBox(
              width: double.infinity,
              height: 170.h,
              child: ListView.separated(
                padding: EdgeInsets.only(left: 10.w),
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 10.w,
                  );
                },
                itemCount: recentDoners.length,
                itemBuilder: (BuildContext context, index) {
                  var recentDoner = recentDoners[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => LocalExcerciseScreen(
                            //       excerciseCategory: exerciseCategory[index],
                            //     ),
                            //   ),
                            // );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Container(
                              width: 150.w,
                              height: 170.h,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                image: recentDoner.profilePicture == null
                                    ? const DecorationImage(
                                        image: AssetImage(
                                          cProfileImage,
                                        ),
                                        fit: BoxFit.cover,
                                      )
                                    : DecorationImage(
                                        image: NetworkImage(
                                          recentDoner.profilePicture!,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 30),
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 39.h,
                                      color: const Color(0xff525252),
                                      child: Center(
                                        child: Text(
                                          "Tewodrs",
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.white,
                                            fontStyle: FontStyle.normal,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
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
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
