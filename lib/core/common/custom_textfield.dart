import '../utils/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSearchFieldWidget extends StatefulWidget {
   final Alignment? alignment;
  final double? width;

  final EdgeInsetsGeometry? margin;

  final TextEditingController? controller;

  final void Function()? onEditTap;
  final double labelFieldSpace;

  final bool? autofocus;
  final void Function()? onTap;
  final TextStyle? textStyle;

  final bool? obscureText;
  final bool showEditIcon;

  final TextInputAction? textInputAction;

  final TextInputType? textInputType;

  final int? maxLines;
  final int? maxLength;
  final Color borderColor;

  final String? hintText;

  final TextStyle? hintStyle;
  final TextStyle? labelStyle;

  final Widget? prefix;

  final BoxConstraints? prefixConstraints;

  final Widget? suffix;

  final BoxConstraints? suffixConstraints;

  final EdgeInsets? contentPadding;
  final Color? backgroundColor;

  final InputBorder? borderDecoration;

  final Color? fillColor;

  final bool? filled;

  final FormFieldValidator<String>? validator;

  final bool isViewMode;
final  List<TextInputFormatter>? inputFormatters;
  final void Function(String)? onChanged;
  CustomSearchFieldWidget({
    super.key,
    this.alignment,
    this.width,
    this.margin,
    this.controller,
    this.backgroundColor = AppColors.whiteColor,
    this.autofocus = false,
    this.showEditIcon = false,
    this.onEditTap,
    this.onTap,
    this.textStyle,
    this.labelStyle,
    this.maxLength,
    this.obscureText = false,
    this.labelFieldSpace = 10,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
    this.maxLines,
    this.hintText,
    this.hintStyle,
    this.prefix,
    this.prefixConstraints,
    this.suffix,
    this.suffixConstraints,
    this.contentPadding,
    this.borderDecoration,
    this.fillColor,
    this.borderColor = AppColors.primaryColor,
    this.filled = true,
    this.inputFormatters,
    this.validator,
    this.isViewMode = false,
    this.onChanged,
  });

 

  @override
  State<CustomSearchFieldWidget> createState() => _CustomSearchFieldWidgetState();
}

class _CustomSearchFieldWidgetState extends State<CustomSearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: textFormFieldWidget,
          )
        : textFormFieldWidget;
  }

  Widget get textFormFieldWidget => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextFormField(
              readOnly: widget.isViewMode,
              autovalidateMode: AutovalidateMode.disabled,
              controller: widget.controller,
              maxLength: widget.maxLength,
              onTap: widget.onTap,
              obscureText: widget.obscureText!,
              obscuringCharacter: '*',
              inputFormatters: widget.inputFormatters,
              textInputAction: widget.textInputAction,
              keyboardType: widget.textInputType,
              maxLines: widget.maxLines ?? 1,
              cursorColor: AppColors.primaryColor,
              decoration: decoration,
              onChanged: widget.onChanged,
              validator: widget.validator,
            ),
          ),
        ],
      );

  InputDecoration get decoration => InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        hintText: widget.hintText ?? "",

     
        prefixIcon: widget.prefix,

        prefixIconConstraints: widget.prefixConstraints,

        suffixIcon: widget.suffix,
        suffixIconConstraints: widget.suffixConstraints,
        isDense: true,

        contentPadding: widget.contentPadding ??
            EdgeInsets.only(top: 8, right: 15, bottom: 8, left: 12),
        filled: true,
        fillColor: widget.fillColor ?? AppColors.whiteColor,
     
        border: widget.borderDecoration ??
            OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor, width: 1.0),
              borderRadius: BorderRadius.circular(5),
            ),
        enabledBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor, width: 1.0),
              borderRadius: BorderRadius.circular(5),
            ),
        focusedBorder: widget.borderDecoration ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: widget.borderColor, width: 1.0),
            ),
      );
}
