import 'package:flutter/material.dart';
import 'package:flutter_bloc_state_management/presentation/home/cubit/home_cubit.dart';
import 'package:flutter_bloc_state_management/presentation/home/view/home_screen.dart';

/// Manage your home view business logic
mixin HomeScreenMixin on State<HomeScreen> {
  late final HomeCubit _homeCubit;

  @override
  void initState() {
    super.initState();
    _homeCubit = HomeCubit();
  }

  HomeCubit get homeCubit => _homeCubit;
}
