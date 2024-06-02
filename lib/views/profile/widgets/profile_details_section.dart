import 'package:flutter/material.dart';

import '../../../global_widgets/custom_dotted_circle.dart';
import '../../../utils/colors.dart';

class ProfileDetailsSection extends StatelessWidget {
  const ProfileDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 128,
          width: 128,
          child: CustomPaint(
            painter: CustomDottedCirclePainter(),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(10),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Md Shirajul Islam',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),),
        Text('ytshirajul@gmail.com',
          style: TextStyle(
            color: AppColors.black.withOpacity(.5),
            fontSize: 18,
          ),),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
