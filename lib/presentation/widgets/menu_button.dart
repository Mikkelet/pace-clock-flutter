import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return IconButton(
        onPressed: () {
          Scaffold.of(context).openEndDrawer();
        },
        icon: const Icon(Icons.menu),
      );
    });
  }
}
