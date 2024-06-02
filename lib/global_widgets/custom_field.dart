import 'package:dokan_multivendor/components/common_shadow.dart';
import 'package:dokan_multivendor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomField extends StatefulWidget {
  final String leading;
  final String? trailing;
  final String hintText;
  final void Function()? onTrailingTap;
  final void Function(String)? onChanged;
  final bool? isSecured;

  const CustomField({
    super.key,
    required this.leading,
    this.trailing,
    required this.hintText,
    this.onTrailingTap,
    this.isSecured,
    this.onChanged,
  });

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: commonShadow,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            TextFormField(
              onChanged: widget.onChanged,
              obscureText: widget.isSecured ?? false,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Field can't be empty";
                }
                return null;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.white,
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  color: AppColors.black.withOpacity(.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1.5,
                  ),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset(widget.leading),
                ),
                suffixIcon: widget.trailing != null
                    ? IconButton(
                  onPressed: widget.onTrailingTap,
                  icon: SvgPicture.asset(
                    widget.trailing!,
                    color: AppColors.black.withOpacity(.3),
                  ),
                )
                    : null,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
