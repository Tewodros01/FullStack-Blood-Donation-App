import 'package:frontend/src/features/core/models/user_model.dart';

class UsersState {
  List<User> users;
  final bool hasNext;
  bool isLoading;

  UsersState({
    required this.users,
    required this.hasNext,
    required this.isLoading,
  });

  factory UsersState.initial() {
    return UsersState(
      users: <User>[],
      hasNext: true,
      isLoading: false,
    );
  }

  UsersState copyWith({
    List<User>? users,
    bool? hasNext,
    bool? isLoading,
  }) {
    return UsersState(
      users: users ?? this.users,
      hasNext: hasNext ?? this.hasNext,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UsersState &&
          runtimeType == other.runtimeType &&
          users == other.users &&
          hasNext == other.hasNext &&
          isLoading == other.isLoading;

  @override
  int get hashCode => users.hashCode ^ hasNext.hashCode ^ isLoading.hashCode;

  @override
  String toString() {
    return 'BloodRequestState{BloodRequests: $users, hasNext: $hasNext, isLoading: $isLoading}';
  }
}
