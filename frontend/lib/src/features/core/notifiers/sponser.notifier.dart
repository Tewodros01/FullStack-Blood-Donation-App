import 'package:frontend/src/api/api_services.dart';
import 'package:frontend/src/features/core/states/sponserstate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SponserNotifier extends StateNotifier<SponserState> {
  SponserNotifier(this._apiService)
      : super(SponserState(hasNext: true, sponser: [], isLoading: false));
  final ApiService _apiService;
  int page = 1;
  Future<void> getSponsers() async {
    if (state.isLoading || !state.hasNext) {
      return;
    }
    Future.delayed(const Duration(microseconds: 1500), () {
      state = state.copyWith(isLoading: true);
    });
    // var filterModel = _filterModel.copyWith(
    //   paginationModel: PaginationModel(page: _page, pageSize: 10),
    // );

    final sponsers = await _apiService.getSponser();
    final newsponsers = [...state.sponser, ...sponsers!];
    if (sponsers.length % 10 != 0 || sponsers.isEmpty) {
      state = state.copyWith(hasNext: false);
    }
    Future.delayed(
      const Duration(microseconds: 1500),
      () {
        state = state.copyWith(sponser: newsponsers);
        page++;
      },
    );
    state = state.copyWith(isLoading: false);
  }
}
