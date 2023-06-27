// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:honeybee/const/colors.dart';

class HoneyBeeTextField extends StatefulWidget {
  final void Function(String)? onChange;
  final bool obscureText;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget suffixIconOn;
  final Widget suffixIconOff;
  final void Function()? onPressed;
  final Color? colorIcon;
  final Color? colorText;
  final TextInputType? keyboardType;
  final bool enabled;
  final Color? enabledBorderColor;
  final Color? disabledBorderColor;
  final Color? focusBorderColor;
  final Color? errorBorderColor;
  final Color? validatedBorderColor;
  final Color? hintColor;
  final String? helperText;
  final Color? labelColor;
  final Color? backgroundColor;
  final Color? cursorColor;
  final double borderRadius;
  final Widget? prefixIcon;
  final Widget? prefixIconSelected;
  final Color? prefixIconColor;
  final double fieldHeight;
  final FocusNode? focusNode;
  final Color fillColor;
  final bool filled;
  final bool showEyes;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const HoneyBeeTextField({
    super.key,
    this.onChange,
    this.obscureText = false,
    this.controller,
    this.labelText,
    this.hintText,
    this.fillColor = AppColors.primary4,
    this.filled = true,
    this.suffixIconOn = const SizedBox(),
    this.suffixIconOff = const SizedBox(),
    this.onPressed,
    this.colorIcon,
    this.colorText,
    this.keyboardType,
    this.enabled = true,
    this.backgroundColor,
    this.borderRadius = 8,
    this.prefixIcon,
    this.prefixIconSelected,
    this.prefixIconColor,
    this.fieldHeight = 48,
    this.enabledBorderColor,
    this.disabledBorderColor,
    this.focusBorderColor,
    this.errorBorderColor,
    this.validatedBorderColor,
    this.cursorColor,
    this.hintColor,
    this.labelColor,
    this.focusNode,
    this.showEyes = false,
    this.validator,
    this.helperText,
    this.suffixIcon,
  });

  @override
  State<HoneyBeeTextField> createState() => _HoneyBeeTextFieldState();
}

class _HoneyBeeTextFieldState extends State<HoneyBeeTextField> {
  bool showContent = false;
  late Color suffixIconColor;

  @override
  void initState() {
    showContent = widget.obscureText;

    suffixIconColor = widget.focusNode!.hasFocus
        ? widget.colorIcon ?? Colors.grey
        : widget.disabledBorderColor ?? Colors.grey;

    super.initState();
  }

  static String? validate(String value, String errorMessage) {
    if (value.isEmpty) {
      return errorMessage;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0.0,
          ),
          child: Text(
            widget.labelText!,
            style: TextStyle(
              color: widget.focusNode!.hasFocus
                  ? widget.labelColor
                  : widget.labelColor,
              fontSize: 16,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          validator: widget.validator,
          enabled: widget.enabled,
          focusNode: widget.focusNode ?? FocusNode(),
          style: TextStyle(
              color: widget.colorText,
              fontSize: 14,
              fontWeight: FontWeight.bold),
          onChanged: widget.onChange,
          obscureText: widget.obscureText,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          scrollPadding: const EdgeInsets.only(bottom: 20),
          //! Sobre o cursor
          cursorColor: widget.cursorColor,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            isCollapsed: false,
            isDense: false,
            contentPadding: const EdgeInsets.only(
              left: 12,
              top: 4,
              right: 12,
              bottom: 4,
            ),
            fillColor: widget.fillColor,
            filled: widget.filled,
            helperText: widget.helperText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.enabledBorderColor!,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.focusBorderColor!,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.enabledBorderColor!,
                width: 2.0,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.errorBorderColor!,
                width: 2.0,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius),
              borderSide: BorderSide(
                color: widget.disabledBorderColor!,
                width: 2.0,
              ),
            ),
            labelText: widget.labelText,
            hintText: widget.hintText,
            hintStyle: TextStyle(
                color: widget.focusNode!.hasFocus
                    ? widget.hintColor
                    : widget.disabledBorderColor,
                fontSize: 12),
            labelStyle: TextStyle(
                color: widget.focusNode!.hasFocus
                    ? widget.labelColor!.withOpacity(0.8)
                    : widget.disabledBorderColor!.withOpacity(0.8),
                fontSize: 12),
            prefixIcon: (widget.prefixIcon is Icon)
                ? Icon(
                    (widget.prefixIcon as Icon).icon,
                    color: widget.focusNode!.hasFocus
                        ? (widget.prefixIcon as Icon).color
                        : widget.disabledBorderColor,
                    size: (widget.prefixIcon as Icon).size,
                  )
                : (widget.focusNode!.hasFocus)
                    ? widget.prefixIconSelected
                    : widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
          ),
          // ),
        ),
      ],
    );
  }
}
