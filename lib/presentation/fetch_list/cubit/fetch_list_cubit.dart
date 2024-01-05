import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_state_management/data/product/product.dart';
import 'package:flutter_bloc_state_management/domain/fetch_list/fetch_list_repository.dart';
import 'package:flutter_bloc_state_management/presentation/fetch_list/states/fetch_list_states.dart';

class FetchListCubit extends Cubit<FetchListStates> {
  FetchListCubit({required this.fetchListRepository}) : super(const FetchListStates(loading: false));
  final FetchListRepository fetchListRepository;

  void changeLoading() {
    emit(state.copyWith(loading: !state.loading));
  }

  Future<void> fetchData() async {
    emit(state.copyWith(loading: true, allProduct: []));
    final List<Product?>? response = await fetchListRepository.fetchProducts();
    emit(state.copyWith(loading: false));

    if (response != null && response.isNotEmpty && response is List<Product>) {
      emit(state.copyWith(allProduct: response));
    } else {
      emit(state.copyWith(allProduct: []));
    }
  }
}
