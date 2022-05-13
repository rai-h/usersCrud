import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool enabled;
  final String text;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final bool isObscure;
  final String errorText;
  final int maxLines;
  final TextInputType textInputType;

  const CustomTextField(
      {Key? key,
      this.enabled = true,
      this.text = '',
      this.prefixIcon,
      this.isObscure = false,
      this.errorText = '',
      this.maxLines = 1,
      this.textInputType = TextInputType.text,
      required this.controller})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Material(
            shadowColor: Colors.lightBlue.shade100,
            borderRadius: BorderRadius.circular(
                40 - double.parse(widget.maxLines.toString()) * 5),
            elevation: 10,
            child: TextField(
              keyboardType: widget.textInputType,
              maxLines: widget.maxLines,
              obscureText: widget.isObscure,
              controller: widget.controller,
              enabled: widget.enabled,
              cursorHeight: 20,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                  color: Colors.grey),
              decoration: InputDecoration(
                  prefixIcon: widget.prefixIcon,
                  enabled: widget.enabled,
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(40)),
                  focusedBorder: InputBorder.none,
                  hintText: widget.text,
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: Colors.grey.shade400),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(40))),
            ),
          ),
          widget.errorText.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.errorText,
                        style: const TextStyle(color: Colors.red),
                      )),
                )
              : Container(),
        ],
      ),
    );
  }
}
