// ignore_for_file: unused_field

import 'package:flutter_bloc_state_management/data/activity/activity.dart';

abstract class FetchNetworkDataRepository {
  Future<Activity?> fetchActivity();
}
