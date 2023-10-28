import 'package:flutter/material.dart';
import 'package:frontend/src/features/core/pages/profile/widget/profile_widget.dart';
import 'package:frontend/src/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _userData(context),
        ],
      ),
    );
  }

  Widget _userData(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final user = ref.watch(userProvider);
        if (user.userId == null) {
          // Fetch user data
          ref.read(userProvider.notifier).getUser();
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          // Show user profile page
          return ProfileWidget(user: user);
        }
      },
    );
  }
}
