import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  SignInButton({this.child,this.onPressed,this.color,this.height :50.0,this.borderRadius:2.0});
  final Widget child;
  final Color color;
  final double borderRadius ;
  final double height ;
  final VoidCallback onPressed ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: RaisedButton(
        child: child,
        elevation: 5 ,
        color: color,
        disabledColor: color, // choose the color of button on disable time
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(borderRadius)),

        ),

      ),
    ) ;
  }
}
