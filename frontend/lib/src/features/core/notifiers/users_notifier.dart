import 'package:frontend/src/api/api_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/src/features/core/states/users_state.dart';

class UsersNotifier extends StateNotifier<UsersState> {
  UsersNotifier(this._apiService)
      : super(UsersState(users: [], hasNext: true, isLoading: false));
  final ApiService _apiService;
  int page = 1;
  Future<void> getUsers() async {
    if (state.isLoading || !state.hasNext) {
      return;
    }
    Future.delayed(const Duration(microseconds: 1500), () {
      state = state.copyWith(isLoading: true);
    });
    // var filterModel = _filterModel.copyWith(
    //   paginationModel: PaginationModel(page: _page, pageSize: 10),
    // );

    final users = await _apiService.getAllUsers();
    final newUsers = [...state.users, ...users!];
    if (users.length % 10 != 0 || users.isEmpty) {
      state = state.copyWith(hasNext: false);
    }
    Future.delayed(
      const Duration(microseconds: 1500),
      () {
        state = state.copyWith(users: newUsers);
        page++;
      },
    );
    state = state.copyWith(isLoading: false);
  }
}
