import 'package:flutter/material.dart';
import 'package:frontend/src/api/api_services.dart';
import 'package:frontend/src/constants/colors.dart';
import 'package:frontend/src/features/core/models/blood_request_model.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDonationWidget extends StatelessWidget {
  const MyDonationWidget({super.key, required this.bloodRequest});
  final List<BloodRequest> bloodRequest;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bloodRequest.length,
      itemBuilder: (context, index) {
        return RequestListWidget(bloodRequest: bloodRequest[index]);
      },
    );
  }
}

class RequestListWidget extends StatelessWidget {
  const RequestListWidget({super.key, required this.bloodRequest});
  final BloodRequest bloodRequest;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(
            width: 600,
            height: 180,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: const BorderSide(color: cPrimaryColor)),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              bloodRequest.bloodType,
                              style: const TextStyle(
                                color: cPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
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
                        const SizedBox(
                          height: 50,
                          child: VerticalDivider(
                            color: cPrimaryColor,
                            thickness: 1,
                            width: 10,
                          ),
                        ),
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
                            // const SizedBox(height: 8),
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
                                  'RequiredUnit:      '.tr,
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                // handle phone icon click
                                print("Cliked");
                                final Uri url = Uri(
                                    scheme: 'tel',
                                    path: bloodRequest.contactNumber);
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
                                    scheme: 'sms',
                                    path: bloodRequest.contactNumber);
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
                      ],
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.end,
                  //   children: [
                  //     Container(
                  //       height: 30,
                  //       width: 150,
                  //       margin: const EdgeInsets.all(6.0),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(8.0),
                  //       ),
                  //       child: Material(
                  //         color:
                  //             cPrimaryColor, // set a different background color here
                  //         borderRadius: BorderRadius.circular(8.0),
                  //         child: InkWell(
                  //           onTap: () async {
                  //             final ApiService apiService = ApiService();
                  //             await apiService.donateNow(
                  //               bloodRequest.requestId!,
                  //             );
                  //           },
                  //           child: const Center(
                  //             child: Text(
                  //               'Donate Now',
                  //               style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: 19,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
