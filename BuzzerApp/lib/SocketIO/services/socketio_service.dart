import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as io;

import '../models/Room.dart';
import '../utils/constants.dart';

class SocketService {
  static List<String> users = [];
  static late StreamController<Room> _socketResponse;
  static late StreamController<List<String>> _userResponse;
  static late io.Socket _socket;
  static String _userName = '';

  static String? get userId => _socket.id;

  static Stream<Room> get getResponse =>
      _socketResponse.stream.asBroadcastStream();

  static Stream<List<String>> get userResponse =>
      _userResponse.stream.asBroadcastStream();

  static void setUserName(String name) {
    _userName = name;
  }

  static void sendMessage(String message) {
    _socket.emit('send', message);
  }

  static void connectAndListen() {
    _userResponse = StreamController<List<String>>();
    _socket = io.io(
        serverUrl,
        io.OptionBuilder()
            .setTransports(['websocket']) // for Flutter or Dart VM
            .disableAutoConnect()
            .setQuery({'userName': _userName})
            .build());

    _socket.connect();

    //When an event recieved from server, data is added to the stream
    _socket.on('message', (data) {
      if (data == 'UserConnected') {
        sendMessage('$_userName joined');
      } else {
        //_socketResponse.sink.add(Chat.fromRawJson(data));
      }
    });
    _socket.on('userResponse', (data) {
      _userResponse.add(data);
    });
    //when users are connected or disconnected
    // _socket.on('users', (data) {
    //   _userResponse.sink.add('$_userName joined' as List<String>);
    // });

    _socket.onDisconnect((_) => print('disconnect'));
  }

  static void dispose() {
    _socket.dispose();
    _socket.destroy();
    _socket.close();
    _socket.disconnect();
    _socketResponse.close();
    _userResponse.close();
  }
}
