import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Color(0xff3F51B5)),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          )),
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
