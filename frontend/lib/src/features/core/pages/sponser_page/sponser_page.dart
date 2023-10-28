import 'package:flutter/material.dart';
import 'package:frontend/src/common_widgets/app_bar/app_bar.dart';
import 'package:frontend/src/features/core/pages/sponser_page/widget/sponser_widget.dart';
import 'package:frontend/src/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SponsorPage extends ConsumerWidget {
  const SponsorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: appBar("Sponsors", context),
      body: _buildGetData(context),
    );
  }

  Widget _buildGetData(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final sponsorState = ref.watch(sponserProvider);
        if (sponsorState.sponser.isEmpty) {
          ref.watch(sponserProvider.notifier).getSponsers();
          if (!sponsorState.hasNext && !sponsorState.isLoading) {
            return const Center(
              child: Text("No Users Found"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SponsorCardWidget(
            sponsors: sponsorState.sponser,
          );
        }
      },
    );
  }
}
