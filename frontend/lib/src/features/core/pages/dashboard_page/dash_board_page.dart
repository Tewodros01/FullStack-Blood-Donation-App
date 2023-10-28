import 'package:flutter/material.dart';
import 'package:frontend/src/features/core/pages/add_blood_request/add_blood_requiest_page.dart';
import 'package:frontend/src/features/core/pages/book_doner/book_doner_page.dart';
import 'package:frontend/src/features/core/pages/chat_screen/chat_screen.dart';
import 'package:frontend/src/features/core/pages/home_page/home_page.dart';
import 'package:frontend/src/features/core/pages/profile/profile_page.dart';
import 'package:frontend/src/features/core/pages/sponser_page/sponser_page.dart';
import 'package:get/get.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final List<Widget> _pageList = [
    const BloodPage(),
    const BookDonorPage(),
    const SponsorPage(),
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
                child: Icon(Icons.discount),
              ),
              label: "sponser".tr,
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
