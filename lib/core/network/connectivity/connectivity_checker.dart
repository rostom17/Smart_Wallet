import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityChecker {
  Future<bool> get isConnected async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    }

    if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    }

    if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      return true;
    }
    return false;
  }
}