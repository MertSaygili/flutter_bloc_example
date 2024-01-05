import 'package:flutter/material.dart';
import 'package:flutter_bloc_state_management/domain/fetch_list/fetch_list_repository_impl.dart';
import 'package:flutter_bloc_state_management/presentation/fetch_list/cubit/fetch_list_cubit.dart';
import 'package:flutter_bloc_state_management/presentation/fetch_list/view/fetch_list_screen.dart';

mixin FetchListScreenMixin on State<FetchListScreen> {
  late final FetchListCubit _fetchListCubit;

  @override
  void initState() {
    super.initState();
    _fetchListCubit =
        FetchListCubit(fetchListRepository: FetchListRepositoryImpl());
    _fetchData();
  }

  Future<void> _fetchData() async {
    await _fetchListCubit.fetchData();
  }

  FetchListCubit get fetchListCubit => _fetchListCubit;
}
