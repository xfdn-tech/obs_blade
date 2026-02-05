import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemedCupertinoButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final bool isDestructive;
  final double? minSize;

  final void Function()? onPressed;

  const ThemedCupertinoButton({
    super.key,
    this.text,
    this.child,
    this.padding,
    this.isDestructive = false,
    this.minSize,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: this.padding,
      onPressed: this.onPressed, minimumSize: Size(this.minSize ?? kMinInteractiveDimensionCupertino, this.minSize ?? kMinInteractiveDimensionCupertino),
      child: DefaultTextStyle.merge(
        style: TextStyle(
          color: this.onPressed != null
              ? this.isDestructive
                  ? CupertinoColors.destructiveRed
                  : Theme.of(context).cupertinoOverrideTheme!.primaryColor
              : null,
        ),
        child: this.child ??
            Text(
              this.text ?? '',
            ),
      ),
    );
  }
}
