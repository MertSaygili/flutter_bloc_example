import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/presentation/fetch_data/cubit/fetch_data_cubit.dart';
import 'package:flutter_bloc_state_management/presentation/fetch_data/states/fetch_data_states.dart';
import 'package:flutter_bloc_state_management/presentation/fetch_data/view/mixin/fetch_data_screen_mixin.dart';

class FetchDataScreen extends StatefulWidget {
  const FetchDataScreen({super.key});

  @override
  State<FetchDataScreen> createState() => _FetchDataScreenState();
}

class _FetchDataScreenState extends State<FetchDataScreen>
    with FetchDataScreenMixin {
  final String _appbarTitle = 'Fetch Data';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => fetchDataCubit,
      child: BlocListener<FetchDataCubit, FetchDataStates>(
        listener: (context, state) => _listener(context, state),
        child: Scaffold(
          appBar: _appbar(),
          body: _text(),
        ),
      ),
    );
  }

  void _listener(BuildContext context, FetchDataStates state) {
    if (state is DataLoadedState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.activityK.activity ?? ''),
        ),
      );
    }

    if (state is ErrorState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.error),
        ),
      );
    }
  }

  AppBar _appbar() {
    return AppBar(
      title: Text(_appbarTitle),
      actions: [
        BlocBuilder<FetchDataCubit, FetchDataStates>(
          builder: (context, state) {
            return state is LoadingState
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.white))
                : const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget _text() {
    return BlocBuilder<FetchDataCubit, FetchDataStates>(
      builder: (context, state) => state is DataLoadedState
          ? _successWidget(state)
          : state is ErrorState
              ? _errorWidget(state)
              : const SizedBox.shrink(),
    );
  }

  Center _successWidget(DataLoadedState state) {
    return Center(
      child: ListView(
        children: [
          ListTile(
            title: Text(state.activityK.activity ?? ''),
            subtitle: Text(state.activityK.type ?? ''),
          ),
        ],
      ),
    );
  }

  RefreshIndicator _errorWidget(ErrorState state) {
    return RefreshIndicator(
      onRefresh: () async {
        await fetchDataCubit.fetchActivity();
      },
      child: ListView(
        children: [
          ListTile(
            title: Text(state.error),
          ),
        ],
      ),
    );
  }
}
