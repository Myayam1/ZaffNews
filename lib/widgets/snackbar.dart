import 'package:flutter/material.dart';

class MySnackbar extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onPressed;

  const MySnackbar({super.key, required this.title, this.actionLabel, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      child: Row (
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: TextStyle(color: Colors.white, fontSize: 18.0)),
          Spacer(),
          if (actionLabel != null && onPressed != null)
            TextButton(
              onPressed: onPressed,
              child: Text(
                      actionLabel!,
                      style: TextStyle(
                          color: Colors.purpleAccent,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold
                      )
                  )
            )
        ]
      )
    );
  }
}
