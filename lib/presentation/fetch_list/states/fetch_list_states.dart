import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_state_management/data/product/product.dart';

class FetchListStates extends Equatable {
  const FetchListStates({this.loading = false, this.allProduct = const []});

  final bool loading;
  final List<Product> allProduct;

  @override
  List<Object?> get props => [
        loading,
        allProduct,
      ];

  FetchListStates copyWith({
    bool? loading,
    List<Product>? allProduct,
  }) {
    return FetchListStates(
      loading: loading ?? this.loading,
      allProduct: allProduct ?? this.allProduct,
    );
  }
}
