import 'package:frontend/src/features/core/models/recent_doner_model.dart';

class RecentDonersState {
  List<RecentDoner> recentDoners;
  final bool hasNext;
  bool isLoading;

  RecentDonersState({
    required this.recentDoners,
    required this.hasNext,
    required this.isLoading,
  });

  factory RecentDonersState.initial() {
    return RecentDonersState(
      recentDoners: <RecentDoner>[],
      hasNext: true,
      isLoading: false,
    );
  }

  RecentDonersState copyWith({
    List<RecentDoner>? recentDoners,
    bool? hasNext,
    bool? isLoading,
  }) {
    return RecentDonersState(
      recentDoners: recentDoners ?? this.recentDoners,
      hasNext: hasNext ?? this.hasNext,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentDonersState &&
          runtimeType == other.runtimeType &&
          recentDoners == other.recentDoners &&
          hasNext == other.hasNext &&
          isLoading == other.isLoading;

  @override
  int get hashCode =>
      recentDoners.hashCode ^ hasNext.hashCode ^ isLoading.hashCode;

  @override
  String toString() {
    return 'BloodRequestState{BloodRequests: $recentDoners, hasNext: $hasNext, isLoading: $isLoading}';
  }
}
