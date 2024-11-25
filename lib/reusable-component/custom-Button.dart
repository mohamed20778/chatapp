import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  String label;
  final void Function() onPressed;
  CustomButton({super.key, required this.onPressed, required this.label});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: MaterialButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.label,
          style: TextStyle(color: Color(0xff2B475E)),
        ),
      ),
    );
  }
}
