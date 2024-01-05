import 'package:flutter/material.dart';
import 'package:flutter_bloc_state_management/domain/fetch_data/fetch_network_data_repository_impl.dart';
import 'package:flutter_bloc_state_management/presentation/fetch_data/cubit/fetch_data_cubit.dart';
import 'package:flutter_bloc_state_management/presentation/fetch_data/view/fetch_data_screen.dart';

/// Manage your home view business logic
mixin FetchDataScreenMixin on State<FetchDataScreen> {
  late final FetchDataCubit _fetchDataCubit;

  @override
  void initState() {
    super.initState();
    _fetchDataCubit = FetchDataCubit(
        fetchNetworkDataRepository: FetchNetworkDataRepositoryImpl());
    _fetchData();
  }

  Future<void> _fetchData() async {
    await _fetchDataCubit.fetchActivity();
  }

  FetchDataCubit get fetchDataCubit => _fetchDataCubit;
}
