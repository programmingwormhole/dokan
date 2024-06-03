import 'package:dokan_multivendor/components/common_shadow.dart';
import 'package:dokan_multivendor/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum ButtonType {
  social,
  regular,
  border,
}

class CustomButton extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  final bool? isLoading;
  final ButtonType? buttonType;
  final Color? backgroundColor;
  final bool? showLoadingText;

  const CustomButton({
    super.key,
    required this.label,
    this.onTap,
    this.isLoading,
    this.buttonType,
    this.backgroundColor,
    this.showLoadingText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading == true ? null : onTap,
      child: buttonType == ButtonType.social
          ? Container(
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
            )
          : Container(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: backgroundColor ??
                    (buttonType == ButtonType.border
                        ? AppColors.white
                        : AppColors.primary),
                border: buttonType == ButtonType.border
                    ? Border.all(
                        color: AppColors.black.withOpacity(.1),
                        width: 1.5,
                      )
                    : null,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: isLoading == true
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              color: buttonType == ButtonType.border
                                  ? AppColors.black
                                  : AppColors.white,
                            ),
                          ),
                          if (showLoadingText != false) ...[
                            const SizedBox(
                              width: 10,
                            ),
                            Text('Please Wait...',
                              style: TextStyle(
                                color: buttonType == ButtonType.border
                                    ? AppColors.black
                                    : AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            )
                          ],
                          if (isLoading == true)...[
                            Text('',
                              style: TextStyle(
                                color: buttonType == ButtonType.border
                                    ? AppColors.black
                                    : AppColors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            )
                          ]
                        ],
                      )
                    : Text(
                        label,
                        style: TextStyle(
                          color: buttonType == ButtonType.border
                              ? AppColors.black.withOpacity(.5)
                              : AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
              ),
            ),
    );
  }
}
