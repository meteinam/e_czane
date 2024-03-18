import 'package:flutter/material.dart';

class EczaneAppbar extends StatefulWidget implements PreferredSizeWidget{
  const EczaneAppbar({super.key});

  @override
  State<EczaneAppbar> createState() => __EczaneAppbarStateState();
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}

class __EczaneAppbarStateState extends State<EczaneAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications),
        ),
      ],
    );
  }
}