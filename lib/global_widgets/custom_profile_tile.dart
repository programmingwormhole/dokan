import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';

class CustomProfileTile extends StatelessWidget {
  final String title;
  final String icon;
  final Widget? content;
  final bool? hideDivider;

  const CustomProfileTile({
    super.key,
    required this.title,
    required this.icon,
    this.content,
    this.hideDivider,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            childrenPadding: const EdgeInsets.all(15),
            leading: SvgPicture.asset(icon),
            title: Text(
              title,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
            children: content == null
                ? []
                : [
                    content!,
                  ],
          ),
        ),
        if (hideDivider != true) ...[
          Divider(
            endIndent: 20,
            indent: 20,
            color: AppColors.black.withOpacity(.1),
          ),
        ]
      ],
    );
  }
}
