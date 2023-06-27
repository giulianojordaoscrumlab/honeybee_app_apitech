import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:honeybee/const/colors.dart';

class HoneyBeeCustomAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final String titleText;
  final double elevation;
  final Color backgroundColor;
  final bool centerTitle;
  final bool hasLeadingIcon;
  final Icon? leadingIcon;
  final VoidCallback? leadingAction;
  final Color titleColor;
  final List<Widget>? actions;
  final List<Widget>? menuActions;
  final BuildContext? context;
  final double height;

  const HoneyBeeCustomAppBar({
    super.key,
    required this.titleText,
    this.elevation = 0,
    this.backgroundColor = AppColors.primary1,
    this.centerTitle = true,
    this.hasLeadingIcon = true,
    this.leadingIcon,
    this.leadingAction,
    this.titleColor = AppColors.primary4,
    this.actions,
    this.menuActions,
    this.context,
    this.height = 45,
  });

  const HoneyBeeCustomAppBar.noActions({
    super.key,
    required this.titleText,
    this.elevation = 0,
    this.backgroundColor = AppColors.primary1,
    this.centerTitle = true,
    this.hasLeadingIcon = true,
    this.leadingIcon,
    this.leadingAction,
    this.titleColor = AppColors.primary4,
    this.context,
    this.height = 45,
  })  : actions = null,
        menuActions = null;

  const HoneyBeeCustomAppBar.menuActions({
    super.key,
    required this.titleText,
    this.elevation = 0,
    this.backgroundColor = AppColors.primary1,
    this.centerTitle = true,
    this.hasLeadingIcon = true,
    this.leadingIcon,
    this.leadingAction,
    this.titleColor = AppColors.primary4,
    this.menuActions,
    this.context,
    this.height = 45,
  }) : actions = null;

  @override
  State<HoneyBeeCustomAppBar> createState() => _HoneyBeeCustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HoneyBeeCustomAppBarState extends State<HoneyBeeCustomAppBar> {
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    Widget? leadingWidget;
    if (widget.hasLeadingIcon) {
      if (widget.leadingIcon != null) {
        leadingWidget = IconButton(
          icon: widget.leadingIcon!,
          onPressed: widget.leadingAction,
        );
      } else {
        leadingWidget = IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => Modular.to.pop(),
        );
      }
    }

    Widget? actionsWidget;
    if (widget.actions != null && widget.actions!.isNotEmpty) {
      actionsWidget = Row(
        mainAxisSize: MainAxisSize.min,
        children: widget.actions!,
      );
    } else if (widget.menuActions != null && widget.menuActions!.isNotEmpty) {
      actionsWidget = PopupMenuButton<Widget>(
        itemBuilder: (_) => widget.menuActions!.map((action) {
          return PopupMenuItem<Widget>(
            value: action,
            child: action,
          );
        }).toList(),
        child: const Icon(Icons.more_vert),
      );
    }

    return AppBar(
      elevation: widget.elevation,
      backgroundColor: widget.backgroundColor,
      centerTitle: widget.centerTitle,
      primary: true,
      title: Text(
        widget.titleText,
        style: TextStyle(fontSize: 20, color: widget.titleColor),
      ),
      leading: leadingWidget,
      actions: actionsWidget != null ? [actionsWidget] : null,
    );
  }
}
