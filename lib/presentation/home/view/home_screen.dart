import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/application/constants/app_strings.dart';
import 'package:flutter_bloc_state_management/presentation/home/cubit/home_cubit.dart';
import 'package:flutter_bloc_state_management/presentation/home/states/home_screen_state.dart';
import 'package:flutter_bloc_state_management/presentation/home/view/mixin/home_screen_mixin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with HomeScreenMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit,
      child: Scaffold(
        appBar: _appbar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: _floatingActionButton(),
        body: _listView(),
      ),
    );
  }

  BlocSelector<HomeCubit, HomeScreenState, List<String>> _listView() {
    return BlocSelector<HomeCubit, HomeScreenState, List<String>>(
      selector: (state) {
        return state.data;
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state[index]),
            );
          },
        );
      },
    );
  }

  Row _floatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            homeCubit.addUser();
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(width: 20),
        FloatingActionButton(
          onPressed: () {
            homeCubit.fetchUsers();
          },
          child: const Icon(Icons.get_app),
        ),
      ],
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: const Text(AppStrings.homeScreenTitle),
      actions: [
        BlocBuilder<HomeCubit, HomeScreenState>(builder: (context, state) {
          return state.isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : const SizedBox.shrink();
        }),
      ],
    );
  }
}
