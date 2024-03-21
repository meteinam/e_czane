import 'package:flutter/material.dart';

class EczaneAppbar extends StatefulWidget implements PreferredSizeWidget{
  const EczaneAppbar({super.key});

  @override
  State<EczaneAppbar> createState() => __EczaneAppbarStateState();
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class __EczaneAppbarStateState extends State<EczaneAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back),
      ),
      title: const Text('Eczane'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.message_rounded),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings_rounded),
        ),
      ],
    );
  }
}