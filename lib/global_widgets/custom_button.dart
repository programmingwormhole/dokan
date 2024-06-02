import 'package:dokan_multivendor/components/common_shadow.dart';
import 'package:dokan_multivendor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ButtonType {
  social,
  regular,
}

class CustomButton extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final bool? isLoading;
  final ButtonType? buttonType;

  const CustomButton({
    super.key,
    required this.label,
    this.onTap,
    this.isLoading,
    this.buttonType,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: buttonType == ButtonType.social
          ? InkWell(
              onTap: onTap,
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: commonShadow,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    label,
                    height: 25,
                    width: 25,
                  ),
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: isLoading == true ? const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Please Wait...',
                      style: TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    )
                  ],
                ) :  Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
    );
  }
}
