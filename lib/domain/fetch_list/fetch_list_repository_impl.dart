import 'package:dio/dio.dart';
import 'package:flutter_bloc_state_management/application/service/dio_manager.dart';
import 'package:flutter_bloc_state_management/data/product/product.dart';
import 'package:flutter_bloc_state_management/domain/fetch_list/fetch_list_repository.dart';

class FetchListRepositoryImpl implements FetchListRepository {
  @override
  Future<List<Product?>?> fetchProducts() async {
    try {
      final response = await DioManager.get('products',
          options: BaseOptions(baseUrl: 'https://fakestoreapi.com/'));
      final data = response.data;
      return Product.fromJsonList(data);
    } catch (e) {
      return null;
    }
  }
}
