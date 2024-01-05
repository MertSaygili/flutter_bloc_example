import 'package:flutter_bloc_state_management/application/bloc/base/base_cubit.dart';
import 'package:flutter_bloc_state_management/domain/fetch_data/fetch_network_data_repository.dart';
import 'package:flutter_bloc_state_management/domain/fetch_data/fetch_network_data_repository_impl.dart';
import 'package:flutter_bloc_state_management/presentation/fetch_data/states/fetch_data_states.dart';

final class FetchDataCubit extends BaseCubit<FetchDataStates> {
  FetchDataCubit({required this.fetchNetworkDataRepository})
      : super(const LoadingState(false));

  final FetchNetworkDataRepository fetchNetworkDataRepository;

  bool isLoading = false;

  void _changeLoading() {
    emit(LoadingState(!isLoading));
  }

  Future<void> fetchActivity() async {
    _changeLoading();
    final response = await FetchNetworkDataRepositoryImpl().fetchActivity();
    _changeLoading();

    if (response != null) {
      emit(DataLoadedState(response));
    } else {
      emit(const ErrorState('Error'));
    }
  }
}
