// ignore_for_file: unused_field

import 'package:flutter_bloc_state_management/data/product/product.dart';

abstract class FetchListRepository {
  Future<List<Product?>?> fetchProducts();
}
