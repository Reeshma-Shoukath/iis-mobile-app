import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app_colors.dart';
import '../domain/entities/user_profile.dart';
import '../presentation/profile/profile_providers.dart';
import 'settings_screen.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(currentUserProfileProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'My Profile',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.textDark),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => const SettingsScreen()),
                      );
                    },
                    icon: const Icon(Icons.menu_rounded, color: AppColors.textDark),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              profileAsync.when(
                loading: () => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(child: CircularProgressIndicator(color: AppColors.primaryPurple)),
                ),
                error: (error, stackTrace) => const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: Text('Could not load profile', style: TextStyle(color: AppColors.danger)),
                  ),
                ),
                data: (profile) => _ProfileCard(profile: profile),
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Expanded(child: _StatCard(icon: Icons.schedule_rounded, value: '128', label: 'Hours Meditated')),
                  SizedBox(width: 10),
                  Expanded(child: _StatCard(icon: Icons.local_fire_department_rounded, value: '45', label: 'Day Streak')),
                  SizedBox(width: 10),
                  Expanded(child: _StatCard(icon: Icons.favorite, value: '24', label: 'Sacred Tracks')),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  _ProfileTab(label: 'Recently Played', active: true),
                  SizedBox(width: 18),
                  _ProfileTab(label: 'Favorites', active: false),
                  SizedBox(width: 18),
                  _ProfileTab(label: 'Downloads', active: false),
                ],
              ),
              const Divider(height: 24, color: AppColors.divider),
              Row(
                children: const [
                  Text(
                    'RECENT MEDITATIONS',
                    style: TextStyle(color: AppColors.textDark, fontSize: 13, fontWeight: FontWeight.w700, letterSpacing: 0.3),
                  ),
                  Spacer(),
                  Text('3 Spiritual Sessions', style: TextStyle(color: AppColors.primaryPurple, fontSize: 11)),
                ],
              ),
              const SizedBox(height: 14),
              _MeditationHistoryTile(
                color: AppColors.primaryPurple,
                icon: Icons.blur_circular,
                title: 'Meditation on Twin Hearts',
                subtitle: 'Master Choa Kok Sui',
                meta: 'Played 21m ago • 24 mins',
                showPlayButton: true,
                showDot: true,
              ),
              const SizedBox(height: 12),
              _MeditationHistoryTile(
                color: AppColors.warning,
                icon: Icons.wb_sunny_rounded,
                title: 'On Namah Shivaya Chanting',
                subtitle: 'Sacred Resonance Mantra',
                meta: 'Yesterday • 18 mins',
                showPlayButton: false,
                showDot: false,
              ),
              const SizedBox(height: 12),
              _MeditationHistoryTile(
                color: AppColors.hindiMeditationGradient.colors.first,
                icon: Icons.star_rounded,
                title: 'Aura Cleansing Affirmation',
                subtitle: 'Chakra Energy Guidance',
                meta: '3 days ago • 15 mins',
                showPlayButton: false,
                showDot: false,
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: AppColors.createPlaylistGradient,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.format_quote_rounded, color: AppColors.primaryPurple, size: 20),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'When you do Meditation on Twin Hearts, divine energy flows into you, blessing the entire earth.',
                        style: TextStyle(color: AppColors.textDark, fontSize: 12, fontStyle: FontStyle.italic, height: 1.4),
                      ),
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

class _StatCard extends StatelessWidget {
  const _StatCard({required this.icon, required this.value, required this.label});

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primaryPurple, size: 18),
          const SizedBox(height: 6),
          Text(value, style: const TextStyle(color: AppColors.textDark, fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 2),
          Text(label, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.textGray, fontSize: 10)),
        ],
      ),
    );
  }
}

class _ProfileTab extends StatelessWidget {
  const _ProfileTab({required this.label, required this.active});

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: active ? AppColors.textDark : AppColors.textGray,
            fontSize: 13,
            fontWeight: active ? FontWeight.w700 : FontWeight.w400,
          ),
        ),
        const SizedBox(height: 6),
        if (active)
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(color: AppColors.primaryPurple, shape: BoxShape.circle),
          ),
      ],
    );
  }
}

class _MeditationHistoryTile extends StatelessWidget {
  const _MeditationHistoryTile({
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.meta,
    required this.showPlayButton,
    required this.showDot,
  });

  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;
  final String meta;
  final bool showPlayButton;
  final bool showDot;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              if (showDot)
                Positioned(
                  top: -2,
                  right: -2,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(color: AppColors.danger, shape: BoxShape.circle),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w700, fontSize: 13)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(color: AppColors.textGray, fontSize: 11)),
                const SizedBox(height: 2),
                Text(meta, style: const TextStyle(color: AppColors.textLightGray, fontSize: 10)),
              ],
            ),
          ),
          if (showPlayButton)
            Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: const BoxDecoration(color: AppColors.primaryPurple, shape: BoxShape.circle),
              child: const Icon(Icons.play_arrow_rounded, color: Colors.white, size: 18),
            ),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({required this.profile});

  final UserProfile? profile;

  @override
  Widget build(BuildContext context) {
    final name = profile?.name ?? '';
    final email = profile?.email ?? '';
    final country = profile?.country ?? 'India';
    final level = profile?.level ?? 'Arhatic Practitioner • Level 1';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.primaryPurple,
            child: Icon(Icons.person, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name,
                      style: const TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.primaryPurple.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        country,
                        style: const TextStyle(color: AppColors.primaryPurple, fontSize: 10, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(email, style: const TextStyle(color: AppColors.textGray, fontSize: 12)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(color: AppColors.primaryPurple, shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      level,
                      style: const TextStyle(color: AppColors.primaryPurple, fontSize: 10, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
