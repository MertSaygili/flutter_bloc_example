import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_state_management/data/activity/activity.dart';

abstract class FetchDataStates extends Equatable {
  const FetchDataStates();
}

final class LoadingState extends FetchDataStates {
  const LoadingState(this.isLoading);

  final bool isLoading;

  @override
  List<Object> get props => [
        isLoading,
      ];

  LoadingState copyWith({
    bool? isLoading,
  }) {
    return LoadingState(
      isLoading ?? this.isLoading,
    );
  }
}

final class DataLoadedState extends FetchDataStates {
  const DataLoadedState(this.activityK);

  final Activity activityK;

  @override
  List<Object> get props => [
        activityK,
      ];

  DataLoadedState copyWith({
    Activity? activityK,
  }) {
    return DataLoadedState(
      activityK ?? this.activityK,
    );
  }
}

final class ErrorState extends FetchDataStates {
  const ErrorState(this.error);

  final String error;

  @override
  List<Object> get props => [
        error,
      ];

  ErrorState copyWith({
    String? error,
  }) {
    return ErrorState(
      error ?? this.error,
    );
  }
}
