import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/data/product/product.dart';
import 'package:flutter_bloc_state_management/presentation/fetch_list/cubit/fetch_list_cubit.dart';
import 'package:flutter_bloc_state_management/presentation/fetch_list/states/fetch_list_states.dart';
import 'package:flutter_bloc_state_management/presentation/fetch_list/view/fetch_list_screen_mixin.dart';

class FetchListScreen extends StatefulWidget {
  const FetchListScreen({super.key});

  @override
  State<FetchListScreen> createState() => _FetchListScreenState();
}

class _FetchListScreenState extends State<FetchListScreen> with FetchListScreenMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => fetchListCubit,
      child: Scaffold(
        appBar: _appbar(),
        body: _listView(),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: const Text('Fetch List'),
      actions: [
        BlocBuilder<FetchListCubit, FetchListStates>(
          builder: (context, state) {
            return state.loading ? const Center(child: CircularProgressIndicator(color: Colors.white)) : const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  BlocSelector<FetchListCubit, FetchListStates, List<Product>> _listView() {
    return BlocSelector<FetchListCubit, FetchListStates, List<Product>>(
      selector: (state) {
        return state.allProduct;
      },
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(state[index].title.toString()),
            );
          },
        );
      },
    );
  }
}
