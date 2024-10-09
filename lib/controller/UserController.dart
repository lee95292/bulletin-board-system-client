import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../model/User.dart';

class UserController extends GetxController {
  final user = User.fromJson({'id': '0', 'name': 'ananymous'}).obs;
  final isLoggin = false.obs;

  Future<void> login() async {
    user.update((user) {
      user?.id = '1';
      user?.name = 'marco lee';
    });
    isLoggin.value = true;
  }
}
