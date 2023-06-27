// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:honeybee/const/colors.dart';
import 'package:honeybee/const/text_styles.dart';

class HoneyBeeSearchTextField extends StatefulWidget {
  final void Function(String) onChange;
  final TextEditingController controller;
  final String? labelText;
  final FocusNode? focusNode;
  final Function()? onSearch;

  const HoneyBeeSearchTextField({
    super.key,
    required this.onChange,
    required this.controller,
    this.labelText,
    this.focusNode,
    this.onSearch,
  });

  @override
  State<HoneyBeeSearchTextField> createState() =>
      _HoneyBeeSearchTextFieldState();
}

class _HoneyBeeSearchTextFieldState extends State<HoneyBeeSearchTextField> {
  bool showContent = false;
  late Widget suffixIcon;
  late Color suffixIconColor;

  static String? validate(String value, String errorMessage) {
    if (value.isEmpty) {
      return errorMessage;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 340),
            child: TextFormField(
              validator: (value) => validate(
                  value!, "Pesquisa tem que ter ao menos 4 caracteres"),
              focusNode: widget.focusNode ?? FocusNode(),
              style: HoneyBeeText.h4,
              onChanged: (value) => widget.onChange(value),
              controller: widget.controller,
              cursorColor: AppColors.colorScheme.onBackground,
              scrollPadding: const EdgeInsets.only(bottom: 20),
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.colorScheme.outline,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.colorScheme.onBackground,
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.colorScheme.outline,
                    width: 1.0,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.colorScheme.error,
                    width: 1.0,
                  ),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: AppColors.colorScheme.outline.withOpacity(0.5),
                    width: 1.0,
                  ),
                ),
                labelText: widget.labelText,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: widget.onSearch,
          child: const Icon(Icons.search_outlined),
        )
      ],
    );
  }
}
