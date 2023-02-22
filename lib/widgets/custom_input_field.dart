import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {Key? key,
      this.controller,
      this.keyboardType,
      this.prefixIcon,
      this.suffixIcon,
      this.label,
      this.isPassword = false,
      this.minLines = 1,
      this.maxLines = 1,
      this.showCounter = false,
      this.maxLength = 50,
      this.validator,
      this.focusNode,
      this.nextFocusNode,
      this.onTap,
      this.readOnly = false,
      this.hintText,
      this.onSaved,
      this.inputFormatters,
      this.style,
      this.suffix})
      : super(key: key);

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final bool isPassword;
  final int? maxLines;
  final bool? showCounter;
  final int? minLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final void Function()? onTap;
  final bool readOnly;
  final String? hintText;
  final void Function(String?)? onSaved;
  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? style;
  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _protectedText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: widget.style,
      inputFormatters: widget.inputFormatters,
      autofocus: false,
      controller: widget.controller,
      readOnly: widget.readOnly,
      maxLength: widget.maxLength,
      maxLines: widget.isPassword
          ? 1
          : widget
              .maxLines, // Obscure Fields cannot be multiline so we must allow one line
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? _protectedText : false,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      focusNode: widget.focusNode,
      minLines: widget.minLines,

      onTap: widget.onTap,

      // onChanged: (final String newValue) {
      //   print(newValue);
      // },

      onEditingComplete: () {
        widget.focusNode?.unfocus();
        widget.nextFocusNode?.requestFocus();
      },

      // onFieldSubmitted: (final String? newValue) {
      //   print('onSaved');
      // },

      onSaved: (final String? newValue) {},

      buildCounter: (
        BuildContext? context, {
        int? currentLength,
        int? maxLength,
        bool? isFocused,
      }) =>
          widget.showCounter! ? Text('$currentLength/$maxLength') : null,

      decoration: InputDecoration(
      
        suffix: widget.suffix,
        hintText: widget.hintText,
        fillColor: Colors.white,
        filled: true,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    _protectedText = !_protectedText;
                  });
                },
                icon: Icon(
                    _protectedText ? Icons.visibility_off : Icons.visibility),
              )
            : widget.suffixIcon,
        labelText: widget.label,
        labelStyle: TextStyle(
          color: Colors.grey[700],
          fontWeight: FontWeight.w500,
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            borderSide: BorderSide.none),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.black),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
