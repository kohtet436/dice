import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? onPressed;
  const HomeButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
