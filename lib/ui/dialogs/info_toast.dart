import 'package:flutter_easyloading/flutter_easyloading.dart';

class InfoToast {
  static showLoading() {
    EasyLoading.show(maskType: EasyLoadingMaskType.black);
  }

  static dismissLoading() {
    EasyLoading.dismiss();
  }

  static showToast(String title,
      {EasyLoadingToastPosition toastPosition =
          EasyLoadingToastPosition.center}) {
    EasyLoading.showToast(title,
        dismissOnTap: false, toastPosition: toastPosition);
  }
}
