import 'package:app_bloc/core/constants/app_constants.dart';
import 'package:app_bloc/core/constants/color_resource.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final String? errorText;

  const InputField({super.key, this.prefixIcon, this.hintText, this.suffixIcon, this.onChanged, this.errorText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorResource.secondary,
      cursorWidth: 1,
      onChanged: (value) => onChanged?.call(value),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: ColorResource.primary100, fontSize: 14),
        suffixIcon: Padding(padding: const EdgeInsets.all(13), child: suffixIcon) ,
        prefixIcon: Padding(padding: const EdgeInsets.all(13), child: prefixIcon),
        errorText: errorText,
        border:
            OutlineInputBorder(borderSide: const BorderSide(width: .5, color: ColorResource.grey200), borderRadius: BorderRadius.circular(Globals.circle)),
        enabledBorder:
            OutlineInputBorder(borderSide: const BorderSide(width: .5, color: ColorResource.grey200), borderRadius: BorderRadius.circular(Globals.circle)),
        focusedBorder:
            OutlineInputBorder(borderSide: const BorderSide(width: .5, color: ColorResource.primary), borderRadius: BorderRadius.circular(Globals.circle)),
      ),
    );
  }
}
