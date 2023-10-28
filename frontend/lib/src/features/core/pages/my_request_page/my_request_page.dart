import 'package:flutter/material.dart';
import 'package:frontend/src/features/core/pages/my_request_page/widget/my_request_widget.dart';
import 'package:frontend/src/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyRequestPage extends ConsumerWidget {
  const MyRequestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Requests",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Customize the title color
          ),
        ),
        backgroundColor:
            Colors.white, // Set your preferred app bar background color
      ),
      body: _buildMyRequestData(context, ref),
    );
  }

  Widget _buildMyRequestData(BuildContext context, WidgetRef ref) {
    final myRequestsViewModel = ref.read(myRequestsProvider.notifier);
    final myRequestState = ref.watch(myRequestsProvider);

    if (myRequestState.hasNext && !myRequestState.isLoading) {
      myRequestsViewModel.getMyRequests();
    }

    if (myRequestState.myRequests.isEmpty) {
      if (!myRequestState.hasNext && !myRequestState.isLoading) {
        return const Center(
          child: Text("No requests found"),
        );
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return MyRequestCardWidget(
      myRequest: myRequestState.myRequests,
    );
  }
}
