import 'package:flutter/material.dart';
import 'package:frontend/src/features/core/pages/blood_request/blood_requiest_page.dart';
import 'package:frontend/src/features/core/pages/donate_blood_page/donate_blood_page.dart';
import 'package:frontend/src/features/core/pages/home_page/home_page.dart';
import 'package:frontend/src/features/core/pages/profile/profile_page.dart';
import 'package:get/get.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final List<Widget> _pageList = [
    const BloodPage(),
    const DonateBloodPage(),
    const BloodRequestPage(),
    const ProfilePage(),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomNavigationBar(
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          elevation: 8,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.home),
              ),
              label: "home".tr,
            ),
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.bloodtype_rounded),
              ),
              label: "bookDoner".tr,
            ),
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.message_outlined),
              ),
              label: "message".tr,
            ),
            // BottomNavigationBarItem(
            //   icon: const Padding(
            //     padding: EdgeInsets.only(top: 8.0),
            //     child: Icon(Icons.book),
            //   ),
            //   label: "book".tr,
            // ),
            BottomNavigationBarItem(
              icon: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(Icons.person),
              ),
              label: "profile".tr,
            ),
          ],
        ),
      ),
    );
  }
}
