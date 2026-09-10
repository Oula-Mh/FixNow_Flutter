import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/providers/app_session_provider.dart';
import '../widgets/custom_main_app_bar.dart';
import '../widgets/widgets_profile/logout_bottom_sheet.dart';
import '../widgets/widgets_profile/profile_header_card.dart';
import '../widgets/widgets_profile/profile_sections_group.dart';
import 'login_view.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomMainAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const ProfileHeaderCard(),

            const SizedBox(height: 16),

            const ProfileSectionsGroup(),

            const SizedBox(height: 24),

            TextButton.icon(
              onPressed: () {
                LogoutBottomSheet.show(
                  context,
                  onLogout: () {
                    ref.read(appSessionProvider.notifier).logout();
                    
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const LoginView()),
                        (route) => false,
                      );
                    
                  },
                );
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