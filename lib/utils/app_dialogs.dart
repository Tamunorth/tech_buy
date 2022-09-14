import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

enum SnackType { error, success, normal }

class TechBuy {
  SnackType type = SnackType.success;

  static showSnackBar(
    BuildContext context,
    String text, {
    SnackType? type,
  }) {
    final Color bgColor;

    type ??= SnackType.success;
    switch (type) {
      case SnackType.error:
        bgColor = Colors.red;
        break;
      case SnackType.success:
        bgColor = Colors.green;
        break;
      case SnackType.normal:
        bgColor = Colors.black;
        break;
    }

    ScaffoldMessenger.of(context).clearSnackBars();

    // return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   behavior: SnackBarBehavior.floating,
    //   content: Text(
    //     text,
    //     style: const TextStyle(color: Colors.white),
    //   ),
    //   backgroundColor: bgColor,
    //   margin: const EdgeInsets.all(20.0),
    //   elevation: 5,
    // ));

    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      message: text,
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),

      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: bgColor,
      ),
      leftBarIndicatorColor: bgColor,
      flushbarStyle: FlushbarStyle.FLOATING,
      // backgroundColor: bgColor,
      duration: const Duration(seconds: 2),
      // mainButton: TextView(
      //   text: btnText ?? 'CLOSE',
      //   color: Colors.white,
      //   onTap: () {
      //     if (onClose != null) {
      //       onClose();
      //     }
      //   },
      // ),
    ).show(context);
  }

  static void showLoading(BuildContext context, GlobalKey loadingKey,
      [String message = 'Loading...']) async {
    final dialog = Dialog(
      key: loadingKey,
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
      elevation: 0,
      child: const Center(child: CircularProgressIndicator()),
    );

    await showDialog(
      context: context,
      barrierColor: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.2),
      builder: (BuildContext context) => dialog,
      barrierDismissible: false,
    );
  }

  static void hideLoading(GlobalKey loadingKey) {
    if (loadingKey.currentContext != null) {
      Navigator.of(loadingKey.currentContext!, rootNavigator: true).pop();
    } else {
      Future.delayed(const Duration(milliseconds: 300)).then((value) =>
          Navigator.of(loadingKey.currentContext!, rootNavigator: true).pop());
    }
  }
}
