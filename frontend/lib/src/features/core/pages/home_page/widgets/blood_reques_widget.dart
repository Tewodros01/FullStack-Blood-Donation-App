import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/config.dart';
import 'package:frontend/src/api/api_services.dart';
import 'package:frontend/src/constants/colors.dart';
import 'package:frontend/src/constants/image_strings.dart';
import 'package:frontend/src/features/core/models/blood_request_model.dart';
import 'package:frontend/src/features/core/pages/home_page/widgets/card_container.dart';
import 'package:frontend/src/providers/providers.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class BloodRequestWidget extends ConsumerWidget {
  const BloodRequestWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloodRequestViewModel = ref.read(bloodRequestProvider.notifier);
    final bloodRequestState = ref.watch(bloodRequestProvider);

    if (bloodRequestState.hasNext && !bloodRequestState.isLoading) {
      bloodRequestViewModel.getBloodRequest();
    }
    if (bloodRequestState.bloodRequests.isEmpty) {
      if (!bloodRequestState.hasNext && !bloodRequestState.isLoading) {
        return const SliverToBoxAdapter(
          child: Center(
            child: Text("No Data"),
          ),
        );
      }
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return listBloodRequest(bloodRequestState.bloodRequests);
  }

  SliverList listBloodRequest(List<BloodRequest> bloodRequests) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: bloodRequests.length,
        (BuildContext context, int index) {
          return bloodRequest(context, bloodRequests[index]);
        },
      ),
    );
  }

  Widget bloodRequest(BuildContext context, BloodRequest bloodRequest) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.red.shade100, Colors.white],
            ),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 4,
                left: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage(cProfileImage),
                    ),
                    SizedBox(width: 10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        TextWidget(
                          "Tewodros Misawoy",
                          18,
                          cPrimaryColor,
                          FontWeight.bold,
                          letterSpace: 0,
                        ),
                        SizedBox(height: 5.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextWidget(
                              "Reason \n",
                              15,
                              cPrimaryColor,
                              FontWeight.normal,
                              letterSpace: 0,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: 80,
                left: 10,
                right: 20,
                child: SizedBox(
                  width: 400,
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                'Hospital:      '.tr,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: cPrimaryColor,
                                ),
                              ),
                              Text(
                                bloodRequest.hospital,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: cPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Deadline:     '.tr,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: cPrimaryColor,
                                ),
                              ),
                              Text(
                                bloodRequest.deadLine,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: cPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Contact:      '.tr,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: cPrimaryColor,
                                ),
                              ),
                              Text(
                                bloodRequest.contactNumber,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: cPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Required Unit:      '.tr,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: cPrimaryColor,
                                ),
                              ),
                              Text(
                                bloodRequest.unitRequired.toString(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: cPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        children: [
                          Text(
                            bloodRequest.bloodType,
                            style: const TextStyle(
                              color: cPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          Text(
                            "Type".tr,
                            style: const TextStyle(
                              fontSize: 16,
                              color: cPrimaryColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        // handle phone icon click
                        print("Cliked");
                        final Uri url = Uri(
                            scheme: 'tel', path: bloodRequest.contactNumber);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          print('cannot launch this url');
                        }
                      },
                      child: const Icon(
                        Icons.phone,
                        color: cPrimaryColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () async {
                        // handle message icon click
                        print("Cliked");
                        final Uri url = Uri(
                            scheme: 'sms', path: bloodRequest.contactNumber);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        } else {
                          print('cannot launch this url');
                        }
                      },
                      child: const Icon(
                        Icons.message,
                        color: cPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 5,
                bottom: 5,
                child: Container(
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: cPrimaryColor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Material(
                          color:
                              cPrimaryColor, // set a different background color here
                          borderRadius: BorderRadius.circular(8.0),
                          child: InkWell(
                            onTap: () async {
                              final ApiService apiService = ApiService();
                              bool response = await apiService.donateNow(
                                bloodRequest.requestId!,
                              );
                              if (response) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text(Config.appName),
                                      content: Text("SuccessfulyDonated".tr),
                                      actions: [
                                        TextButton(
                                          child: const Text("Ok"),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            // Navigator.of(context)
                                            //     .pushNamedAndRemoveUntil(
                                            //   "/login",
                                            //   (route) => false,
                                            // );
                                            // Get.to(() => const HomePage());
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("BloodDonation".tr),
                                      content: Text("AlreadyDonated".tr),
                                      actions: [
                                        TextButton(
                                          child: Text("Ok".tr),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            // Navigator.of(context)
                                            //     .pushNamedAndRemoveUntil(
                                            //   "/login",
                                            //   (route) => false,
                                            // );
                                            // Get.to(() => const HomePage());
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'DonateNow'.tr,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
