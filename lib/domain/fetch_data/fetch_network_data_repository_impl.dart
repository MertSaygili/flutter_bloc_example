import 'package:flutter_bloc_state_management/application/service/dio_manager.dart';
import 'package:flutter_bloc_state_management/data/activity/activity.dart';
import 'package:flutter_bloc_state_management/domain/fetch_data/fetch_network_data_repository.dart';

class FetchNetworkDataRepositoryImpl implements FetchNetworkDataRepository {
  @override
  Future<Activity?> fetchActivity() async {
    try {
      final response = await DioManager.get('activity');
      return Activity.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }
}
