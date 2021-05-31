import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class MyCon extends GetxController{
  var connetstatus=0.obs;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
   @override
  void onInit() {
     _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
    super.onInit();
  }
 
  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
       connetstatus.value = 5;
       break;
      case ConnectivityResult.mobile:
       connetstatus.value = 1;
       break;
      case ConnectivityResult.none:
        connetstatus.value = 3;
        Get.defaultDialog(title: 'nooo Conection',middleText: 'Turn On Network Conneection');
        break;
      default:
          connetstatus.value = 3;
        break;
    }
  }
}