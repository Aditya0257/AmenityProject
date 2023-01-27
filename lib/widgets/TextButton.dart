import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Button({super.key, 
    
    required this.width,
    required this.height,
    required this.child,
    required this.border,
    required this.color, 
    required this.onPressed,

});

 final VoidCallback onPressed;
  
  double width;
  double height;
  Widget child;
  Color color;
  double border;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(border)),color: color),
        child: Center(child: child),
      ),
    );
  }
}
