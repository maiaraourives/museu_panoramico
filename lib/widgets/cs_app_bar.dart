import 'package:flutter/material.dart';

class CsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CsAppBar({
    required this.title,
    this.preferredSize = const Size.fromHeight(65),
    this.elevation = 3,
    this.actions,
    this.leading,
    super.key,
  });

  @override
  final Size preferredSize;
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.primaryColor,
      elevation: 0.0,
      toolbarHeight: 70,
      automaticallyImplyLeading: false,
      title: FittedBox(
        child: Text(
          title,
          style: const TextStyle(fontSize: 20,color: Colors.white),
        ),
      ),
      centerTitle: true,
      actions: actions,
      leading: leading,
    );
  }
}
