import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Colors/colors.dart';
import '../Screens/CurrentSession.dart';
import '../Screens/QRGenerated.dart';



class PopupQR extends StatefulWidget {
  const PopupQR({super.key});
  @override
  _PopupQRState createState() => _PopupQRState();
}

class _PopupQRState extends State<PopupQR> with SingleTickerProviderStateMixin {
  String userId = currentuser;
  int? currentTime=currentNtpTimeMs;

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
    },
      child: Scaffold(
      backgroundColor: gamePopColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              transform: Matrix4.translationValues(260, -5, 0),
              child: Row(
                children: [
                  Material(
                    type: MaterialType.transparency,
                    child: Ink(
                      decoration: BoxDecoration(
                        border: Border.all(color: borderHomeColor, width: 1.0),
                        color: popupBackground1,
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QRGenerated()));
                          });
                        },
                        //This keeps the splash effect within the circle
                        borderRadius: BorderRadius.circular(
                            1000.0), //Something large to ensure a circle
                        child: const Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Icon(
                            CupertinoIcons.multiply,
                            size: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            QrImage(
              data: "$userId $currentTime",
              version: QrVersions.auto,
              foregroundColor: textYellow,
              size: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'share this QR with others to join',
              style: TextStyle(
                  color: textYellow,
                  fontFamily: 'Gilroy',
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
      ),
    );
  }
}
