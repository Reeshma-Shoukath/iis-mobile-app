import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_colors.dart';
import '../presentation/auth/auth_controller.dart';
import '../presentation/profile/edit_profile_screen.dart';
import '../presentation/profile/profile_providers.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentUserProfileProvider).valueOrNull;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_rounded, color: AppColors.textDark),
        ),
        title: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Settings & Practice',
              style: TextStyle(color: AppColors.textDark, fontSize: 16, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 2),
            Text(
              'PRANIC HEALING SANCTUARY',
              style: TextStyle(color: AppColors.primaryPurple, fontSize: 10, fontWeight: FontWeight.w600, letterSpacing: 0.4),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.primaryPurple,
              child: Icon(Icons.person, color: Colors.white, size: 16),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: AppColors.primaryPurple,
                          child: Icon(Icons.person, color: Colors.white, size: 24),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: AppColors.success,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profile?.name ?? '',
                            style: const TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            profile?.email ?? '',
                            style: const TextStyle(color: AppColors.textGray, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: profile == null
                          ? null
                          : () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => EditProfileScreen(uid: profile.uid, currentName: profile.name),
                                ),
                              );
                            },
                      child: const Row(
                        children: [
                          Text('Edit', style: TextStyle(color: AppColors.primaryPurple, fontSize: 13, fontWeight: FontWeight.w600)),
                          Icon(Icons.chevron_right, color: AppColors.primaryPurple, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const _SectionLabel('PRACTICE & AUDIO'),
              const SizedBox(height: 10),
              _SettingsGroup(
                children: [
                  _SettingsTile(
                    color: AppColors.primaryPurple,
                    icon: Icons.graphic_eq_rounded,
                    title: 'Audio Quality & Binaural Beats',
                    subtitle: 'Hi-Res Lossless • 432 Hz',
                  ),
                  _SettingsTile(
                    color: AppColors.hindiMeditationGradient.colors.first,
                    icon: Icons.download_rounded,
                    title: 'Offline Sanctuary & Downloads',
                    subtitle: '6 guided meditations available',
                  ),
                  _SettingsTile(
                    color: AppColors.warning,
                    icon: Icons.notifications_rounded,
                    title: 'Daily Sadhana Reminders',
                    subtitle: 'Twin Hearts • 6:30 AM Daily',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const _SectionLabel('ACCOUNT & PREFERENCES'),
              const SizedBox(height: 10),
              _SettingsGroup(
                children: [
                  _SettingsTile(
                    color: AppColors.pink,
                    icon: Icons.favorite,
                    title: 'Wishlist & Sacred Bookmarks',
                    trailingText: '12 saved',
                  ),
                  _SettingsTile(
                    color: AppColors.twinHeartsGradient.colors.first,
                    icon: Icons.language_rounded,
                    title: 'Language / भाष',
                    trailingText: 'English',
                  ),
                  _SettingsTile(
                    color: AppColors.textGray,
                    icon: Icons.shield_rounded,
                    title: 'Security & Password',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const _SectionLabel('PRANIC HEALING TRUST & INFO'),
              const SizedBox(height: 10),
              _SettingsGroup(
                children: [
                  _SettingsTile(
                    color: AppColors.deepPurple,
                    icon: Icons.menu_book_rounded,
                    title: 'About Master Choa Kok Sui & Teachings',
                  ),
                  _SettingsTile(
                    color: AppColors.hindiMeditationGradient.colors.first,
                    icon: Icons.public,
                    title: 'Global Meditation Centers',
                  ),
                  _SettingsTile(
                    color: AppColors.textGray,
                    icon: Icons.description_rounded,
                    title: 'Terms & Privacy Policy',
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _SettingsGroup(
                children: [
                  _SettingsTile(
                    color: AppColors.danger,
                    icon: Icons.delete_rounded,
                    title: 'Delete Account & Data',
                    titleColor: AppColors.danger,
                  ),
                ],
              ),
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  ref.read(authControllerProvider.notifier).signOut();
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.logout_rounded, color: AppColors.textDark, size: 20),
                      SizedBox(width: 12),
                      Text('LOGOUT', style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w700, fontSize: 13)),
                      Spacer(),
                      Text('End Session', style: TextStyle(color: AppColors.textGray, fontSize: 12)),
                      SizedBox(width: 4),
                      Icon(Icons.arrow_forward_rounded, color: AppColors.textGray, size: 14),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: const [
                    Text(
                      'Pranic Healing Sounds • v3.4.2 (2026)',
                      style: TextStyle(color: AppColors.textLightGray, fontSize: 11),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Atma, Namaste | Light and Love',
                      style: TextStyle(color: AppColors.textLightGray, fontSize: 11, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(color: AppColors.textGray, fontSize: 11, fontWeight: FontWeight.w700, letterSpacing: 0.4),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          for (var i = 0; i < children.length; i++) ...[
            children[i],
            if (i != children.length - 1) const Divider(height: 1, indent: 58, color: AppColors.divider),
          ],
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.color,
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailingText,
    this.titleColor,
  });

  final Color color;
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? trailingText;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: titleColor ?? AppColors.textDark, fontWeight: FontWeight.w600, fontSize: 13),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(subtitle!, style: const TextStyle(color: AppColors.textGray, fontSize: 11)),
                ],
              ],
            ),
          ),
          if (trailingText != null) ...[
            Text(trailingText!, style: const TextStyle(color: AppColors.textGray, fontSize: 12)),
            const SizedBox(width: 6),
          ],
          const Icon(Icons.chevron_right, color: AppColors.textLightGray, size: 20),
        ],
      ),
    );
  }
}
