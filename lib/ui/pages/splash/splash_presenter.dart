import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/load_current_account.dart';
import '../../../main/pages/app_pages.dart';

class SplashPresenter extends GetxController {
  final LoadCurrentAccount loadCurrentAccount;

  final _navigateTo = RxString();

  String get navigateTo => _navigateTo.value;

  SplashPresenter({@required this.loadCurrentAccount});

  @override
  void onInit() {
    super.onInit();
    _handleNavigate();
    checkAccount();
  }

  Future<void> checkAccount() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      final account = await loadCurrentAccount.load();
      _navigateTo.value =
          account?.token == null ? AppPages.welcome : AppPages.feed;
    } catch (_) {
      _navigateTo.value = AppPages.welcome;
    }
  }

  Worker navigateWorker;
  _handleNavigate() {
    navigateWorker = ever(_navigateTo, (page) {
      Get.offAndToNamed(page);
    });
  }

  @override
  void onClose() {
    super.onClose();
    navigateWorker.dispose();
  }
}
