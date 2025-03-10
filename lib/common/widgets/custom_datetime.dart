import 'package:dental/utils/datetime_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'button/custom_button.dart';
import 'custom_dialog.dart';

class CustomDateTime extends StatefulWidget {
  const CustomDateTime({
    super.key,
    this.controller,
    this.onSubmitted,
    this.initialValue,
    this.hintText,
    this.helperText,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.enterPressed,
    this.formatter,
    this.validator,
    this.onChanged,
    this.firstDate,
    this.lastDate,
  });

  final String? initialValue;
  final String? hintText;
  final String? helperText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(DateTime? val)? onChanged;
  final Function(String val)? onSubmitted;
  final bool enabled;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function()? enterPressed;
  final List<TextInputFormatter>? formatter;
  final String? Function(String? val)? validator;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  State<CustomDateTime> createState() => _CustomDateTimeState();
}

class _CustomDateTimeState extends State<CustomDateTime> with SingleTickerProviderStateMixin {
  bool isEmpty = true;
  bool showPassword = false;
  String? labelText;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    if (widget.readOnly || !widget.enabled) {
      labelText = widget.hintText;
    }

    controller = widget.controller ?? TextEditingController();
    if (widget.initialValue != null) {
      controller.text = widget.initialValue!;
    }
    controller.addListener(checkValue);
  }

  void checkValue() {
    setState(() {
      isEmpty = controller.text.isEmpty;
      labelText = controller.text.isEmpty ? null : widget.hintText;
    });
  }

  @override
  Widget build(BuildContext context) {
    var showClearBtn = InkWell(
      onTap: () {
        controller.text = '';
        if (widget.onChanged != null) {
          widget.onChanged!(null);
        }
      },
      child: (!isEmpty && !widget.readOnly && widget.enabled) ? Icon(Icons.clear) : Container(),
    );

    return TextFormField(
      controller: controller,
      autofocus: false,
      focusNode: widget.focusNode,
      // style: tsBodyM(),
      enabled: widget.enabled,
      readOnly: true,
      // onChanged: (value) {
      //   if (widget.onChanged != null) widget.onChanged!(value);
      // },
      onFieldSubmitted: widget.onSubmitted,
      onEditingComplete: () {
        FocusScope.of(context).nextFocus();
        if (widget.enterPressed != null) widget.enterPressed!();
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      inputFormatters: widget.formatter,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        // filled: true,
        // fillColor: Colors.white,
        labelText: labelText,
        // labelStyle: tsBodyM(),
        hintText: widget.hintText,
        // hintStyle: tsBodyM(),
        helperText: widget.helperText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            showClearBtn,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(Icons.calendar_month, size: 30),
            ),
            widget.suffixIcon ?? Container(),
          ],
        ),
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 47,
          minWidth: 37,
          minHeight: 47,
        ),
      ),
      onTap: () async {
        final initialDate = controller.text.isEmpty ? DateTime.now() : controller.text.toDateTime('d-MM-yyyy');
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: initialDate,
          locale: Locale('id'),
          fieldHintText: 'dd/mm/yyyy',
          firstDate: widget.firstDate ?? DateTime(1950),
          lastDate: widget.lastDate ?? DateTime(DateTime.now().year + 1),
        );

        if (pickedDate != null) {
          controller.text = pickedDate.custom('d-MM-yyyy');
          if (widget.onChanged != null) {
            widget.onChanged!(pickedDate);
          }
        }
      },
    );
  }
}
