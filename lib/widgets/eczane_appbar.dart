import 'package:e_czane/style/color.dart';
import 'package:e_czane/style/text_sytle.dart';
import 'package:flutter/material.dart';

class EczaneAppbar extends StatefulWidget implements PreferredSizeWidget {
  final Color? bgColor;
  final void Function() backButtonPressed;
  const EczaneAppbar(
      {super.key, this.bgColor, required this.backButtonPressed});

  @override
  State<EczaneAppbar> createState() => __EczaneAppbarStateState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class __EczaneAppbarStateState extends State<EczaneAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: widget.bgColor ?? Colors.transparent,
      leading: BackButton(
        onPressed: widget.backButtonPressed,
        color: eczaneLightGrey,
      ),
      title: Text(
        'Eczane',
        style: textStyleSmall,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.message_rounded, color: eczaneLightGrey),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings_rounded, color: eczaneLightGrey),
        ),
      ],
    );
  }
}
