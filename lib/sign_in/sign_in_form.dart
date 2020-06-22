import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:realestateadvisor/custom_widgets/platform_alert_dialog.dart';
import 'package:realestateadvisor/custom_widgets/platform_exception_alert_dialog.dart';
import 'package:realestateadvisor/custom_widgets/sign_in_button.dart';
import 'package:realestateadvisor/models/http.dart';
import 'package:realestateadvisor/models/user.dart';

enum formType { signIn, register }

class SignInForm extends StatefulWidget {
  const SignInForm({Key key, this.myDeviceId}) : super(key: key);
  final String myDeviceId;

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // _SignInFormState(this.deviceId):super ()
  //final String deviceId;
  // String   get myDeviceId=>widget.myDeviceId;
  // DeviceId myDeviceId ;
  Http http = Http();

  final TextEditingController _signInUserNameController =
  TextEditingController();
  final TextEditingController _signInPasswordController =
  TextEditingController();
  final TextEditingController _registerNameController = TextEditingController();
  final TextEditingController _registerLastNameController =
  TextEditingController();
  final TextEditingController _registerPhoneController =
  TextEditingController();
  final TextEditingController _registerEmailController =
  TextEditingController();
  final TextEditingController _registerUserNameController =
  TextEditingController();
  final TextEditingController _registerPasswordController =
  TextEditingController();
  final TextEditingController _registerRepeatPasswordController =
  TextEditingController();
  formType _formType = formType.signIn;
  User user = User();

  @override
  void dispose() {
    _registerNameController.dispose();
    _registerPasswordController.dispose();
    _registerUserNameController.dispose();
    _registerPhoneController.dispose();
    _registerEmailController.dispose();
    _registerLastNameController.dispose();
    _registerRepeatPasswordController.dispose();
    _registerRepeatPasswordController.dispose();
    _signInPasswordController.dispose();
    _signInUserNameController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    user.name = '';
    final appBarText =
    _formType == formType.signIn ? 'Sign in' : 'Create an acount';
    final btnText = _formType == formType.signIn
        ? 'Need an account ? Register  '
        : 'Have an account ? Sign in';

    return WillPopScope(
      onWillPop:() {
        Navigator.pop(context,'true');},


      child: Scaffold(
        appBar: AppBar(
          title: Text(appBarText),
          centerTitle: true,
          elevation: 10,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          // this will Stop the yellow And red rectangle caused by lack of space on screan while opening the keyboard
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: _formType == formType.signIn
                    ? _buildSignInForm(btnText)
                    : _buildRegisterForm(btnText),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.grey[200],
      ),
    );
  }

  Widget _buildSignInForm(String btnText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            controller: _signInUserNameController,
            decoration: InputDecoration(
              labelText: ' Username ',
              icon: Icon(Icons.person),
            ),
          ),
          TextField(
            controller: _signInPasswordController,
            decoration: InputDecoration(
              labelText: ' Password ',
              icon: Icon(Icons.lock),
            ),
            obscureText: true,

          ),
          SizedBox(
            height: 15.0,
          ),
          SignInButton(
            color: Colors.blue[400],
            borderRadius: 8,
            onPressed: (){ _signInProcess();},
            child: Text(
              'Sign in ',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          FlatButton(
            onPressed: () => setState(() {
              _formType = formType.register;
            }),
            child: Text(btnText),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterForm(String btnText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextField(
            controller: _registerNameController,
            decoration: InputDecoration(
              labelText: ' name ',
              icon: Icon(Icons.person),
            ),
          ),
          TextField(
            controller: _registerLastNameController,
            decoration: InputDecoration(
              labelText: ' Lastname ',
              icon: Icon(Icons.person),
            ),
          ),
          TextField(
            controller: _registerPhoneController,
            decoration: InputDecoration(
                labelText: ' Phone number ',
                icon: Icon(Icons.phone),
                helperText: '09*********'),
            keyboardType: TextInputType.phone,

          ),
          TextField(
            controller: _registerEmailController,
            decoration: InputDecoration(
                labelText: ' Email ',
                icon: Icon(Icons.email),
                helperText: '*****@***.***'),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(
            height: 30,
          ),
          Divider(
            thickness: 4,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _registerUserNameController,
            decoration: InputDecoration(
              labelText: ' Username ',
              icon: Icon(Icons.person_outline),
            ),
          ),
          TextField(
            controller: _registerPasswordController,
            decoration: InputDecoration(
              labelText: ' Password ',
              icon: Icon(Icons.lock_outline),
            ),
            obscureText: true,
          ),
          TextField(
            controller: _registerRepeatPasswordController,
            decoration: InputDecoration(
              labelText: 'Repeat password ',
              icon: Icon(Icons.lock_outline),
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 15.0,
          ),
          InkWell(
            child: SignInButton(
              color: Colors.blue[400],
              borderRadius: 8,
              onPressed:() =>_registerUser(),
              child: Text(
                'Register ',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          FlatButton(
            onPressed: () => setState(() {
              _formType = formType.signIn;
            }),
            child: Text(btnText),
          ),
        ],
      ),
    );
  }

  _registerUser() async {
    if (_checkFormData()==0) {
      user.name = _registerNameController.text.trim().toLowerCase();
      user.lastName = _registerLastNameController.text.trim().toLowerCase();
      user.email = _registerEmailController.text.trim();
      user.phoneNumber = _registerPhoneController.text.trim();
      user.username = _registerUserNameController.text.trim();
      user.password = _registerPasswordController.text.trim();
      user.lastLoginDevice = widget.myDeviceId;
      print(widget.myDeviceId);
      try {
        if (user.name != '') {
         //TODO User userTemp = await http.makeUserGetRequestByUsername(user.username).then((value){_checkUserName(value);});


        }
        //http.makeUserPostRequest(user);
      } on Exception catch (e) {
        print('>>>>>>>>>>>>' + e.toString());
      }
    }else if(_checkFormData()==1){
      PlatformAlertDialog(
        title: 'Entry Error',
        content: 'Password and Password repeate fields need to be entered by the same value .',
        defaultActionText: ' Ok ',
      ).show(context);
    }else{
      PlatformAlertDialog(
        title: 'Sign in error',
        content: 'please complete all the fields . ',
        defaultActionText: ' Ok ',
      ).show(context);
    }
  }
  _signInProcess()  async {
    try {
      String userName = _signInUserNameController.text.trim();
      String password = _signInPasswordController.text.trim();
      if (userName.length > 1 && password.length > 1) {
       // ToDo user = await http.makeUserGetRequestByUsername(userName);
        if (user != null) {
          if (user.password == password) {
            user.lastLoginDevice=widget.myDeviceId;
            http.makeUserPutRequest(user);
            Navigator.pop(context,'true');
          } else {
            PlatformAlertDialog(
              title: 'Sign in error',
              content: 'Username or password is not Correct .',
              defaultActionText: ' Ok ',
            ).show(context);
          }
        } else {
          PlatformAlertDialog(
            title: 'Sign in error',
            content: 'Username or password is not Correct . ',
            defaultActionText: ' Ok ',
          ).show(context);
        }
      }else{
        PlatformAlertDialog(
          title: 'Entry error',
          content: 'Username or password Fields need to field . ',
          defaultActionText: ' Ok ',
        ).show(context);
      }
    } on Exception catch (e) {
      PlatformExceptionAlertDialog(title: 'Error happend', exception: e)
          .show(context);
    }
  }

  int _checkFormData() {
    if(_registerNameController.text.trim().isNotEmpty &&
        _registerLastNameController.text.trim().isNotEmpty &&
        _registerPhoneController.text.trim().isNotEmpty &&
        _registerEmailController.text.trim().isNotEmpty &&
        _registerUserNameController.text.trim().isNotEmpty &&
        _registerPasswordController.text.trim().isNotEmpty &&
        _registerRepeatPasswordController.text.trim().isNotEmpty
    ){
      if(_registerRepeatPasswordController.text==_registerPasswordController.text){
        return 0;
      }else{
        return 1;
      }

    }else{
      return 2;
    }
  }

  void _checkUserName(User userTemp) {
    if (userTemp != null && userTemp.id >0) {
      // print(myDeviceId);
      PlatformAlertDialog(
        title: 'Entry Error',
        content: 'نام کاربری تکراری است لطفا نام کاربری جدیدی انتخاب بفرمایید .',
        defaultActionText: ' Ok ',
      ).show(context);
    }else {
      http.makeUserPostRequest(user);
      Navigator.pop(context, 'true');

    }
  }

}
