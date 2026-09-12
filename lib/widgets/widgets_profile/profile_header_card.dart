import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/profile_provider.dart';

class ProfileHeaderCard extends ConsumerWidget {
  const ProfileHeaderCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final profileAsync = ref.watch(profileProvider);

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 220), 
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xffBDC9C9)),
      ),
      child: profileAsync.when(
        data: (profile) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: primaryColor, width: 2),
                ),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage:
                       NetworkImage(profile.image!)
                ),
              ),
              const SizedBox(height: 12),

              Text(
               "${profile.firstName} ${profile.lastName}",
                style: const TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),

              Text(
                profile.email!,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 6),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Text(
                      "${profile.city}, ${profile.country }",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              SizedBox(
                height: 36,
                child: FilledButton(
                  onPressed: () {},
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: CircularProgressIndicator(),
          ),
        ),
        error: (error, stackTrace) => Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Text(
              "Failed to load profile",
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ),
      ),
    );
  }
}