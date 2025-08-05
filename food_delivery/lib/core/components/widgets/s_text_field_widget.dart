import 'package:flutter/material.dart';

class STextFieldWidget extends StatefulWidget {
  const STextFieldWidget({
    super.key,
    this.hint,
    this.label,
    this.borderRadius = 15.0,
    this.gapPadding = 4.0,
    this.outLineBorder = true,
    this.controller,
    this.onTap,
    this.keyboardType,
    this.readOnly = false,
    this.isPasswordField = false,
    this.validator,
    this.leading,
    this.trailing,
    this.onChanged,
  });
  final String? hint, label;
  final double borderRadius, gapPadding;
  final bool outLineBorder;
  final TextEditingController? controller;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final bool readOnly;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Widget? leading;
  final Widget? trailing;

  STextFieldWidget copyWith({
    String? hint,
    String? label,
    double? borderRadius,
    double? gapPadding,
    bool? outLineBorder,
    TextEditingController? controller,
    void Function()? onTap,
    TextInputType? keyboardType,
    bool? readOnly,
    bool? isPasswordField,
    String? Function(String?)? validator,
    Function(String)? onChanged,
    Widget? leading,
    Widget? trailing,
  }) {
    return STextFieldWidget(
      hint: hint ?? this.hint,
      label: label ?? this.label,
      borderRadius: borderRadius ?? this.borderRadius,
      gapPadding: gapPadding ?? this.gapPadding,
      outLineBorder: outLineBorder ?? this.outLineBorder,
      controller: controller ?? this.controller,
      onTap: onTap ?? this.onTap,
      keyboardType: keyboardType ?? this.keyboardType,
      readOnly: readOnly ?? this.readOnly,
      isPasswordField: isPasswordField ?? this.isPasswordField,
      validator: validator ?? this.validator,
      onChanged: onChanged ?? this.onChanged,
      leading: leading ?? this.leading,
      trailing: trailing ?? this.trailing,
    );
  }

  @override
  State<STextFieldWidget> createState() => _STextFieldWidgetState();
}

class _STextFieldWidgetState extends State<STextFieldWidget> {
  bool isSecure = true;

  // IconButton iconDisplayed(bool isSecure) => ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onTap: widget.onTap,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      readOnly: widget.readOnly,
      
      validator: widget.validator,
      textInputAction: TextInputAction.next,
      obscureText: widget.isPasswordField ? isSecure : false,

      decoration: InputDecoration(
        prefix: widget.leading,
        suffix: widget.trailing,
        suffixIcon: widget.isPasswordField
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isSecure = !isSecure;
                    // log("isSecure : $isSecure");
                  });
                },
                icon: Icon(isSecure ? Icons.lock_outline : Icons.lock_open),
              )
            : null,
        hintText: widget.hint,
        label: widget.label != null ? Text(widget.label!) : null,
        // hintStyle: TextStyle(fontSize: hintSize, backgroundColor: hintBGColor, )
        border: widget.outLineBorder
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                gapPadding: widget.gapPadding,
              )
            : UnderlineInputBorder(
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
      ),
    );
  }
}
