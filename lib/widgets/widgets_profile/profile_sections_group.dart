import 'package:flutter/material.dart';
import 'profile_menu_section.dart';

class ProfileSectionsGroup extends StatelessWidget {
  const ProfileSectionsGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        ProfileMenuSection(
          sectionTitle: 'My Activity',
          items: [
            ProfileMenuItem(
              icon: Icons.article_outlined,
              title: 'My Bookings',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.calendar_today_outlined,
              title: 'Upcoming Services',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.history_outlined,
              title: 'History',
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 16),


        ProfileMenuSection(
          sectionTitle: 'Account',
          items: [
            ProfileMenuItem(
              icon: Icons.person_outline,
              title: 'Personal Info',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.location_on_outlined,
              title: 'Saved Addresses',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.credit_card_outlined,
              title: 'Payments',
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 16),


        ProfileMenuSection(
          sectionTitle: 'Support',
          items: [
            ProfileMenuItem(
              icon: Icons.help_outline_rounded,
              title: 'Help Center',
              onTap: () {},
            ),
            ProfileMenuItem(
              icon: Icons.description_outlined,
              title: 'Terms',
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}