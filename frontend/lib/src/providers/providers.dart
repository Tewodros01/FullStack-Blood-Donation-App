import 'package:frontend/src/api/api_services.dart';
import 'package:frontend/config.dart';
import 'package:frontend/src/features/core/models/recent_doner_model.dart';
import 'package:frontend/src/features/core/models/user_doner.dart';
import 'package:frontend/src/features/core/models/user_model.dart';
import 'package:frontend/src/features/core/notifiers/blood_request_notifier.dart';
import 'package:frontend/src/features/core/notifiers/blood_state_notifier.dart';
import 'package:frontend/src/features/core/notifiers/buttonTaped.notifier.dart';
import 'package:frontend/src/features/core/notifiers/donation.notifier.dart';
import 'package:frontend/src/features/core/notifiers/my_donation_notifier.dart';
import 'package:frontend/src/features/core/notifiers/my_request_notifier.dart';
import 'package:frontend/src/features/core/notifiers/recent_doner_notfier.dart';
import 'package:frontend/src/features/core/notifiers/sponser.notifier.dart';
import 'package:frontend/src/features/core/notifiers/token.notifier.dart';
import 'package:frontend/src/features/core/notifiers/user_notifier.dart';
import 'package:frontend/src/features/core/notifiers/users_notifier.dart';
import 'package:frontend/src/features/core/states/blood_request_state.dart';
import 'package:frontend/src/features/core/states/bloodstate.dart';
import 'package:frontend/src/features/core/states/buttontapd.state.dart';
import 'package:frontend/src/features/core/states/my_donation_state.dart';
import 'package:frontend/src/features/core/states/my_request_state.dart';
import 'package:frontend/src/features/core/states/recent_doner_state.dart';
import 'package:frontend/src/features/core/states/sponserstate.dart';
import 'package:frontend/src/features/core/states/token.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/features/core/states/users_state.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

final userProvider = StateNotifierProvider.autoDispose<UserNotifier, User>(
  (ref) => UserNotifier(
    ref.watch(apiService),
  ),
);

final recentDonersProvider =
    StateNotifierProvider<RecentDonerNotifier, RecentDonersState>(
        (ref) => RecentDonerNotifier(ref.watch(apiService)));

final bloodRequestProvider =
    StateNotifierProvider<BloodRequestNotifier, BloodRequestState>(
        (ref) => BloodRequestNotifier(ref.watch(apiService)));

final usersProvider = StateNotifierProvider<UsersNotifier, UsersState>(
    (ref) => UsersNotifier(ref.watch(apiService)));

final myDonationProvider =
    StateNotifierProvider<MyDonationNotifier, MyDonationState>(
        (ref) => MyDonationNotifier(ref.watch(apiService)));

final sponserProvider = StateNotifierProvider<SponserNotifier, SponserState>(
    ((ref) => SponserNotifier(ref.watch(apiService))));

final tokenValueProvider =
    StateNotifierProvider<TokenValueNotifier, TokenValueState>(
        ((ref) => TokenValueNotifier(ref.watch(apiService))));

final buttonTapedProvider =
    StateNotifierProvider<ButtonTapedNotifier, ButtonTapedState>((ref) {
  return ButtonTapedNotifier();
});
final myRequestsProvider =
    StateNotifierProvider<MyRequestsNotifier, MyRequestState>(
        (ref) => MyRequestsNotifier(ref.watch(apiService)));

final bloodFilterStateProvider =
    StateNotifierProvider<BloodStateNotifier, BloodState>(
        (ref) => BloodStateNotifier());

final donationProvider =
    StateNotifierProvider<DonationNotifier, List<UserDoner>>(
  (ref) => DonationNotifier(ref.watch(apiService)),
);
final socketProvider = Provider<IO.Socket>((ref) {
  final socket = IO.io(Config.url, <String, dynamic>{
    'transports': ['websocket'],
  });

  socket.on('userConnected', (data) {
    ref.read(onlineUsersProvider).add(data);
  });

  socket.on('messageReceived', (data) {
    final selectedUser = ref.read(selectedUserProvider.notifier).state;
    if (data['senderId'] == selectedUser) {
      ref.read(messagesProvider).add(data['message']);
    }
  });

  return socket;
});

final onlineUsersProvider = StateProvider<List<String>>((ref) => []);
final selectedUserProvider = StateProvider<String?>((ref) => null);
final messagesProvider = StateProvider<List<String>>((ref) => []);
