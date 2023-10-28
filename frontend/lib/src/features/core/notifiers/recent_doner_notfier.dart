import 'package:frontend/src/api/api_services.dart';
import 'package:frontend/src/features/core/models/recent_doner_model.dart';
import 'package:frontend/src/features/core/controllers/update_profile_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/features/core/states/recent_doner_state.dart';

class RecentDonerNotifier extends StateNotifier<RecentDonersState> {
  RecentDonerNotifier(this._apiService)
      : super(RecentDonersState(
            recentDoners: [], hasNext: true, isLoading: false));
  final ApiService _apiService;
  int page = 1;
  Future<void> getRecentDoner() async {
    if (state.isLoading || !state.hasNext) {
      return;
    }
    Future.delayed(const Duration(microseconds: 1500), () {
      state = state.copyWith(isLoading: true);
    });
    // var filterModel = _filterModel.copyWith(
    //   paginationModel: PaginationModel(page: _page, pageSize: 10),
    // );

    final recentDoners = await _apiService.getRecentDoner();
    final newrecentDone = [...state.recentDoners, ...recentDoners!];
    if (recentDoners.length % 10 != 0 || recentDoners.isEmpty) {
      state = state.copyWith(hasNext: false);
    }
    Future.delayed(
      const Duration(microseconds: 1500),
      () {
        state = state.copyWith(recentDoners: newrecentDone);
        page++;
      },
    );
    state = state.copyWith(isLoading: false);
  }
}
