import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      this.shape,
      this.color,
      this.padding,
      this.minWidth,
      this.onPressed,
      this.textColor,
      this.elevation,
      this.mouseCursor,
      this.height,
      this.radius = 15,
      this.child})
      : super(key: key);

  final ShapeBorder? shape;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double? minWidth;
  final void Function()? onPressed;
  final Widget? child;
  final Color? textColor;
  final double? elevation;
  final MouseCursor? mouseCursor;
  final double? height;
  final double radius;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      color: widget.color,
      mouseCursor: widget.mouseCursor,
      elevation: widget.elevation,
      textColor: widget.textColor,
      padding: widget.padding,
      minWidth: widget.minWidth,
      onPressed: widget.onPressed,
      child: widget.child,
      height: widget.height,
    );
  }
}

/* MediaQuery.of(context).size.width; */