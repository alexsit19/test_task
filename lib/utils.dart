import 'package:flutter/material.dart';
import 'package:test_task/domain/exceptions.dart';

extension FromExceptionToString on BuildContext {
  String translateException(Exception? exception) {
    if (exception is NoConnectionException) {
      return "No internet connection, fix problem and press 'retry'";
    } else if (exception is DataRetrieveException) {
      return "Slow internet connection, fix problem and press 'retry'";
    } else if (exception is UnknownException) {
      return "Unknown error, contact support";
    } else {
      return "unknown error";
    }
  }
}

SnackBar makeSnackBar({required String error, required Function action}) {
  return SnackBar(
    content: Text(error),
    action: SnackBarAction(
      label: 'Retry',
      onPressed: () {
        action();
      },
    ),
  );
}
