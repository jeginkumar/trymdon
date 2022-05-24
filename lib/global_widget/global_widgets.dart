import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter/services.dart';

class GlobalWidget {
  Future<bool> toastMessage(message) {
    return Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black54,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  Future<void> openSnackbar(_scaffoldKey, snackMessage) {
    return _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Container(
          alignment: Alignment.centerLeft,
          height: 60,
          child: Text(
            snackMessage,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        action: SnackBarAction(
          label: 'Ok',
          textColor: Colors.blueAccent,
          onPressed: () {},
        ),
      ),
    );
  }
}
