import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/common_widgets/app_bar/app_bar.dart';
import 'package:frontend/src/constants/colors.dart';
import 'package:frontend/src/features/core/models/user_model.dart';
import 'package:frontend/src/features/core/pages/add_blood_request/add_blood_requiest_page.dart';
import 'package:frontend/src/providers/providers.dart';
import 'package:get/get.dart';

class BookDonorPage extends ConsumerStatefulWidget {
  const BookDonorPage({Key? key}) : super(key: key);

  @override
  ConsumerState<BookDonorPage> createState() => _BookDonorPageState();
}

class _BookDonorPageState extends ConsumerState<BookDonorPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Book Doner", context),
      body: _buildGetData(context),
    );
  }

  Widget _buildGetData(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final usersState = ref.watch(usersProvider);
        if (usersState.users.isEmpty) {
          ref.watch(usersProvider.notifier).getUsers();
          if (!usersState.hasNext && !usersState.isLoading) {
            return const Center(
              child: Text("No Users Found"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return _buildUserList(usersState.users);
        }
      },
    );
  }

  Widget _buildUserList(List<User> users) {
    return Column(
      children: [
        SizedBox(height: 20),
        _buildAddRequestBox(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return GestureDetector(
                  onTap: () {
                    // Implement booking functionality here
                  },
                  child: Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: UserListItem(user: user),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddRequestBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Best Place to \nFind a Blood Donor",
            style: TextStyle(
              fontSize: 22,
              color: cDarkColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => AddBloodRequestPage());
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: cPrimaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "+ Add Request",
                  style: TextStyle(color: cWhiteColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserListItem extends StatelessWidget {
  final User user;

  const UserListItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        user.fullImagePath.isNotEmpty
            ? CircleAvatar(
                backgroundImage: NetworkImage(user.fullImagePath),
                radius: 25,
              )
            : const Icon(Icons.person),
        Expanded(
          child: ListTile(
            title: Text(user.fullName),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: cPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            // Implement booking functionality here
          },
          child: const Text("Book Donor"),
        ),
      ],
    );
  }
}
