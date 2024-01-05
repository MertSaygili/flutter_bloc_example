import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/presentation/home/states/home_screen_state.dart';

final class HomeCubit extends Cubit<HomeScreenState> {
  HomeCubit() : super(const HomeScreenState());

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> fetchUsers() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        emit(state.copyWith(data: ['User 1', 'User 2', 'User 3']));
      },
    );
    emit(state.copyWith(isLoading: false));
  }

  Future<void> addUser() async {
    emit(state.copyWith(isLoading: true));
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        emit(state.copyWith(data: [...state.data, 'User ${state.data.length + 1}']));
      },
    );
    emit(state.copyWith(isLoading: false));
  }
}
