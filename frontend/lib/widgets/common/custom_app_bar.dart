import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    Key? key,
    required String title,
    String? register,
    Widget? leading,
    String actions = '',
    void Function()? callback,
    // List<Widget>? actions,
  }) : super(
          key: key,
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 0,
          leading: leading,
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                child: GestureDetector(
                    child: Text(
                      actions,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      callback!();
                    })),
          ],
        );
}
