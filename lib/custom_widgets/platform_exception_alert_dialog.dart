import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:realestateadvisor/custom_widgets/platform_alert_dialog.dart';


class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog(
      {@required String title, @required PlatformException exception})
      : super(
    title: title,
    content: _message(exception),
    defaultActionText: 'Ok',
  );

  static String _message(PlatformException exception) {

    return  _errors[exception.code] ?? exception.message; // if first one was not Ok then run Exception.message
  }

  static Map<String, String> _errors = {
    'ERROR_WEAK_PASSWORD': 'The password is not strong enough',
    'ERROR_INVALID_EMAIL': 'The email address is malformed.',
    'ERROR_EMAIL_ALREADY_IN_USE': 'the email is already in use by a different account.',
    'ERROR_OPERATION_NOT_ALLOWED' : ' Anonymous accounts are not enabled.',
    'ERROR_WRONG_PASSWORD' : 'The password is wrong.',
    'ERROR_USER_NOT_FOUND' :  'There is no user corresponding to the given Email address, or the user has been deleted.',
    'ERROR_USER_DISABLED' : ' The user has been disabled ',
    'ERROR_TOO_MANY_REQUESTS'  : 'There was too many attempts to sign in as this user.',
    'PERMISSION_DENIED' : 'Missing or insufficient permissions'

  };


}


