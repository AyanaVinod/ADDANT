import 'package:buzzerapp/SocketIO/utils/constants.dart';
import 'package:socket_io/socket_io.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = IO.io(serverUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket!.connect();
    socket!.disconnected;
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }

}

