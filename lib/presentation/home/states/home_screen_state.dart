import 'package:equatable/equatable.dart';

final class HomeScreenState extends Equatable {
  const HomeScreenState({
    this.isLoading = false,
    this.data = const [],
  });

  final bool isLoading;
  final List<String> data;

  @override
  List<Object?> get props => [
        isLoading,
        data,
      ];

  HomeScreenState copyWith({
    bool? isLoading,
    List<String>? data,
  }) {
    return HomeScreenState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
    );
  }
}
