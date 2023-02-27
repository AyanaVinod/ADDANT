import 'dart:async';

import 'package:buzzerapp/Screens/CurrentSession.dart';
import 'package:buzzerapp/SocketIO/services/socket_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:socket_io_client/src/socket.dart';

class SocketService {
  final _socketClient = SocketClient.instance.socket!;
  Socket get socketClient => _socketClient;
  static late StreamController<List<String>> _userResponse;
  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'nickname': currentuser,
      });
    }
  }

  void joinRoom(String nickname, String roomId) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit('joinRoom', {
        'nickname': currentuser,
        'roomId': 1234,
      });
    }
  }

  void sendMessage() {
    _socketClient.on(
        'send', (data) => _userResponse.add(currentuser as List<String>));
  }

}
