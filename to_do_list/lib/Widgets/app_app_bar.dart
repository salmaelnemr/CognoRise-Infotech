import 'package:flutter/material.dart';
import 'app_text.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget{
  const AppAppBar({
    super.key,
    this.title,
    this.backgroundColor = Colors.white,
    this.enableBackButton = false,
  });

  final String? title;
  final Color? backgroundColor;
  final bool enableBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      leading: enableBackButton ? InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
      ): const SizedBox.shrink(),
      title: AppText(
        title: title ?? "",
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
