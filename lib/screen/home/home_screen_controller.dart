import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tech_test/base/base_controller.dart';
import 'package:tech_test/screen/auth/login/login_screen.dart';

class HomeScreenController extends BaseController {
  final user = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    super.onInit();
  }

  void doLogout() async {
    await FirebaseAuth.instance.signOut().then((value) => Get.offAll(LoginScreen()));
  }
}
