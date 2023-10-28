import 'package:flutter/material.dart';
import 'package:frontend/src/features/core/pages/tooken/widget/token_value_card_widget.dart';
import 'package:frontend/src/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TokenValuePage extends ConsumerWidget {
  const TokenValuePage({Key? key, required this.sponsorId});

  final String sponsorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Token Value",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Customize the title color
          ),
        ),
        backgroundColor:
            Colors.white, // Set your preferred app bar background color
      ),
      body: _buildTokenValueData(context, ref),
    );
  }

  Widget _buildTokenValueData(BuildContext context, WidgetRef ref) {
    final tokenValueState = ref.watch(tokenValueProvider);
    final tokenValueViewModel = ref.watch(tokenValueProvider.notifier);

    if (tokenValueState.hasNext && !tokenValueState.isLoading) {
      tokenValueViewModel.getTokenValue();
    }

    if (tokenValueState.tokenValue.isEmpty) {
      if (!tokenValueState.hasNext && !tokenValueState.isLoading) {
        return Center(
          child: Text("No token values found"),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return TokenValueCardWidget(
      tokenValues: tokenValueState.tokenValue,
      sponsorId: sponsorId,
    );
  }
}
