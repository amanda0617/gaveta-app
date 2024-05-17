import 'package:get/get.dart';

import '../../../core/services/firebase_service.dart';
import '../../repositories/home/home_repository.dart';
import '../../repositories/home/home_repository_impl.dart';
import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeRepository>(
        HomeRepositoryImpl(firebaseService: Get.find<FirebaseService>()));
    Get.lazyPut(
        () => HomeController(homeRepository: Get.find<HomeRepository>()));
  }
}
