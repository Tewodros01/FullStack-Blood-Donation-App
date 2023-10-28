import 'package:flutter/material.dart';
import 'package:frontend/src/features/core/models/sponser.dart';
import 'package:frontend/src/features/core/pages/tooken/tooken_page.dart';
import 'package:get/get.dart';

class SponsorCardWidget extends StatelessWidget {
  const SponsorCardWidget({super.key, required this.sponsors});
  final List<Sponser> sponsors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          double.infinity, // Set an appropriate height or use double.infinity
      child: ListView.builder(
        itemCount: sponsors.length,
        itemBuilder: (context, index) {
          return SponserListWidget(sponsors: sponsors[index]);
        },
      ),
    );
  }
}

class SponserListWidget extends StatelessWidget {
  const SponserListWidget({super.key, required this.sponsors});
  final Sponser sponsors;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the TookenPage when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  TokenValuePage(sponsorId: sponsors.sponserId)),
        );
      },
      child: Card(
        elevation: 4, // Add shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0), // Add border radius
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  const Icon(
                    Icons.person,
                    color: Colors.red, // Set text color to red
                  ),
                  const SizedBox(width: 8.0), // Add space here
                  Expanded(
                    child: Text(
                      'SponserName:'.tr,
                      style: const TextStyle(
                          color: Colors.red), // Set text color to red
                    ),
                  ),
                  Text(
                    sponsors.sponserName,
                    style: const TextStyle(
                        color: Colors.red), // Set text color to red
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  const Icon(
                    Icons.email,
                    color: Colors.red, // Set text color to red
                  ),
                  const SizedBox(width: 8.0), // Add space here
                  Expanded(
                    child: Text(
                      'Email:'.tr,
                      style: const TextStyle(
                          color: Colors.red), // Set text color to red
                    ),
                  ),
                  Text(
                    sponsors.email,
                    style: const TextStyle(
                        color: Colors.red), // Set text color to red
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  const Icon(
                    Icons.phone,
                    color: Colors.red, // Set text color to red
                  ),
                  const SizedBox(width: 8.0), // Add space here
                  Expanded(
                    child: Text(
                      'PhoneNumber:'.tr,
                      style: const TextStyle(
                          color: Colors.red), // Set text color to red
                    ),
                  ),
                  Text(
                    sponsors.phoneNo,
                    style: const TextStyle(
                        color: Colors.red), // Set text color to red
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
