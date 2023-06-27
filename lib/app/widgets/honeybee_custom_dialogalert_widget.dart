import 'package:flutter/material.dart';
import 'package:honeybee/const/colors.dart';

class HoneyBeeCustomAlertDialog extends StatefulWidget {
  final double roundBorder;
  final Color? backgroundColor;
  final bool showTopIcon;
  final Widget topIcon;
  final String? title;
  final String? subTitle;
  final String messageText;
  final String okButtonLabel;
  final Function()? okAction;
  final String cancelButtonLabel;
  final Function()? cancelButtonAction;

  const HoneyBeeCustomAlertDialog({
    super.key,
    required this.roundBorder,
    this.backgroundColor = AppColors.primary4,
    required this.showTopIcon,
    required this.topIcon,
    this.title = "",
    this.subTitle = "",
    this.messageText = "",
    required this.okButtonLabel,
    this.okAction,
    required this.cancelButtonLabel,
    this.cancelButtonAction,
  });

  @override
  _HoneyBeeCustomAlertDialogState createState() =>
      _HoneyBeeCustomAlertDialogState();
}

class _HoneyBeeCustomAlertDialogState extends State<HoneyBeeCustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.8,
              child: Container(
                color: AppColors.blackTitle,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                color: widget.backgroundColor ?? Colors.white,
                borderRadius: BorderRadius.circular(widget.roundBorder),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (widget.showTopIcon)
                      ? Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(16),
                            child: widget.topIcon,
                          ),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      widget.title!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      widget.subTitle!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(widget.messageText),
                  ),
                  if (widget.okButtonLabel.isNotEmpty ||
                      widget.cancelButtonLabel.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (widget.cancelButtonLabel.isNotEmpty)
                            TextButton(
                              onPressed: widget.cancelButtonAction,
                              child: Text(widget.cancelButtonLabel),
                            ),
                          if (widget.okButtonLabel.isNotEmpty)
                            TextButton(
                              onPressed: widget.okAction,
                              child: Text(widget.okButtonLabel),
                            ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
