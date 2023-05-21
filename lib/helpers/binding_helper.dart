import 'package:audio/controllers/music_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MusicController());
  }
}
