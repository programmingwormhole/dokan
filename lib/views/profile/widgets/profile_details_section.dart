import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/profile_controller.dart';
import '../../../global_widgets/custom_dotted_circle.dart';
import '../../../utils/colors.dart';

class ProfileDetailsSection extends StatelessWidget {
  const ProfileDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Obx(
      () => Column(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: CustomPaint(
              painter: CustomDottedCirclePainter(),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    controller.userModel.value.profilePicture ?? '',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(controller.userModel.value.name ?? 'Loading...',
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 24,
            ),
          ),
          Text(controller.userModel.value.email ?? 'Loading...',
            style: TextStyle(
              color: AppColors.black.withOpacity(.5),
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
