import 'package:get/get.dart';
import 'package:ludo/controller/play_controller.dart';

class PlayBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PlayController());
  }

}