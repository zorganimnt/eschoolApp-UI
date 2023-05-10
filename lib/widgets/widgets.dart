import 'package:eschoolapp/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Widget WidgetTextField(
    {required BuildContext context,
    required String label,
    required IconData? icon,
    TextEditingController? controller,
    AutovalidateMode? autovalidateMode = AutovalidateMode.onUserInteraction, 
    String? hintText,
    bool isPassword = false,
    TextInputType textInputType = TextInputType.text,
    bool checkUsername = false,
    String? svgPath,
    String? helperText,
    FormFieldValidator<String>? validator,
    bool enable = true,
    int? maxLenght,
    String? initialValue,
    List<TextInputFormatter>? inputFormatters,
    ValueChanged<String>? onChanged}) {
  return IntrinsicHeight(
    child: Row(children: [
      icon != null
          ? Icon(
              icon,
              size: 20,
            )
          : svgPath != null
              ? Image.asset(
                  svgPath,
                  width: 24,
                  height: 24,
                )
              : const SizedBox.shrink(),
      icon != null || svgPath != null
          ? const SizedBox(
              width: 10,
            )
          : const SizedBox.shrink(),
      Flexible(
        child: TextFormField(
          initialValue : initialValue, 
          controller: controller,
          textInputAction: TextInputAction.next,
          obscureText: isPassword,
          enableSuggestions: !isPassword,
          autocorrect: !isPassword,
          keyboardType: textInputType,
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
          validator: validator,
          enabled: enable,
          maxLength: maxLenght,
          inputFormatters: inputFormatters,
          onFieldSubmitted: (string) {
            FocusScope.of(context).nextFocus();
          },
          decoration: InputDecoration(
            
            hintText: hintText,
            labelText: label,
            labelStyle: const TextStyle(fontSize: 15, color: Colors.black),
            isDense: true,
            helperText: helperText,
            counterText: "",
            helperStyle: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 1),
                borderRadius: BorderRadius.circular(20)),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black.withAlpha(100), width: 0.5),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Colors.black.withAlpha(50), width: 0.5),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent, width: 0.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.redAccent, width: 1),
                borderRadius: BorderRadius.circular(20)),
            errorStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Colors.redAccent),
          ),
        ),
      )
    ]),
  );
}

Widget CustomTextButton(
    {required VoidCallback? onPressed,
    required Widget child,
    EdgeInsetsGeometry? padding,
    bool enable = true,
    Color? background}) {
  RxBool showBorder = false.obs;
  return Obx(() => Container(
      height: 45,
      decoration: BoxDecoration(
          color: background ?? primaryColor,
          borderRadius: BorderRadius.circular(16),
          border: showBorder.value
              ? Border.all(color: Colors.amber, width: 1)
              : Border.all(color: Colors.transparent, width: 1)),
      child: TextButton(
        onPressed: enable ? onPressed : null,
        onHover: (hovered) {
          showBorder.value = hovered;
        },
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            )),
            padding: MaterialStateProperty.all(padding)),
        child: child,
      )));
}
