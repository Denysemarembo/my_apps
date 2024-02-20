import 'package:connectivity/connectivity.dart';

class Broadcast {
  static Stream<ConnectivityResult> connectivityStream() {
    return Connectivity().onConnectivityChanged;
  }

  static Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}
