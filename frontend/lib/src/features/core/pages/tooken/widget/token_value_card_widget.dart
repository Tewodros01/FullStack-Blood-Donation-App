import 'package:flutter/material.dart';

import 'package:frontend/src/features/core/models/accesToken_model.dart';
import 'package:frontend/src/features/core/models/token.model.dart';
import 'package:frontend/src/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TokenValueCardWidget extends StatelessWidget {
  const TokenValueCardWidget({
    super.key,
    required this.tokenValues,
    required this.sponsorId,
  });
  final List<TokenValue> tokenValues;
  final String sponsorId; // Add this parameter

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          double.infinity, // Set an appropriate height or use double.infinity
      child: ListView.builder(
        itemCount: tokenValues.length,
        itemBuilder: (context, index) {
          return SponserListWidget(
            tokenValues: tokenValues[index],
            sponsorId: sponsorId,
          );
        },
      ),
    );
  }
}

class SponserListWidget extends ConsumerWidget {
  const SponserListWidget(
      {super.key, required this.tokenValues, required this.sponsorId});
  final TokenValue tokenValues;
  final String sponsorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tokenValuesViewModel = ref.read(tokenValueProvider.notifier);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            const Icon(
              Icons.diamond_outlined,
              color: Colors.red,
            ),
            const SizedBox(width: 8.0),
            Text(
              tokenValues.value!,
              style: const TextStyle(color: Colors.red),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: tokenValues.used ? Colors.grey : Colors.red,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: GestureDetector(
                onTap: tokenValues.used
                    ? null
                    : () async {
                        var accessToken = AccessToken(
                            sponserId: sponsorId, token: tokenValues.value);

                        // Call the createSponserToken method from apiService
                        final success = await ref
                            .read(tokenValueProvider.notifier)
                            .createSponserToken(accessToken);

                        if (success) {
                          // tokenValuesViewModel.getTokenValue();
                          ref.invalidate(tokenValueProvider);
                          // Handle success, e.g., show a success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Access Token created successfully',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.green,
                            ),
                          );
                        } else {
                          // Handle failure, e.g., show an error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Failed to create Access Token',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                child: Padding(
                  padding: const EdgeInsets.all(13.0), // Add padding here
                  child: Text(
                    'Access Token',
                    style: TextStyle(
                      color: Colors.white,
                      decoration:
                          tokenValues.used ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
