import 'package:flutter/material.dart';

import '../widgets/custom_main_app_bar.dart';
import '../widgets/widgets_profile/logout_bottom_sheet.dart';
import '../widgets/widgets_profile/profile_header_card.dart';
import '../widgets/widgets_profile/profile_sections_group.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomMainAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfileHeaderCard(),

            const SizedBox(height: 16),

            const ProfileSectionsGroup(),

            const SizedBox(height: 24),

            TextButton.icon(
              onPressed: () {
                LogoutBottomSheet.show(context, onLogout: () {});
              },
              icon: const Icon(
                Icons.logout_rounded,
                color: Color(0xFFDC2626),
                size: 22,
              ),
              label: const Text(
                'Logout',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFDC2626),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
