import 'package:get/get.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecases/load_current_account.dart';
import '../../../main/pages/app_pages.dart';
import '../../helpers/user_session.dart';

class SplashPresenter extends GetxController {
  final LoadCurrentAccount loadCurrentAccount;
  final UserSession userSession;

  final _navigateTo = RxString();

  String get navigateTo => _navigateTo.value;

  SplashPresenter({
    @required this.loadCurrentAccount,
    @required this.userSession,
  });

  @override
  void onInit() {
    super.onInit();
    _handleNavigate();
    checkAccount();
  }

  Future<void> checkAccount({bool test = false}) async {
    try {
      if (!test) {
        await Future.delayed(Duration(seconds: 5));
      }

      final account = await loadCurrentAccount.load();
      if (account?.token != null) {
        userSession.saveUser(
          name: account.username,
          id: account.id,
        );
        _navigateTo.value = AppPages.feed;
      } else {
        _navigateTo.value = AppPages.welcome;
      }
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
