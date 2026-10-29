import 'package:flutter/material.dart';

import '../app_colors.dart';

class PlaylistsScreen extends StatelessWidget {
  const PlaylistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    'Playlists',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.textDark),
                  ),
                  Spacer(),
                  Icon(Icons.search, color: AppColors.textGray),
                ],
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 36,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _FilterChip(label: 'Recent', active: true),
                    SizedBox(width: 10),
                    _FilterChip(label: 'Created', active: false),
                    SizedBox(width: 10),
                    _FilterChip(label: 'Most Played', active: false),
                    SizedBox(width: 10),
                    _FilterChip(label: 'Sacred OM', active: false),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: AppColors.createPlaylistGradient,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 46,
                      height: 46,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Create Sacred Playlist',
                            style: TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w700, fontSize: 14),
                          ),
                          SizedBox(height: 2),
                          Text(
                            'Curate your daily sadhana, Twin Hearts, or meditation sessions.',
                            style: TextStyle(color: AppColors.textGray, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.auto_awesome, color: AppColors.primaryPurple, size: 18),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              _PlaylistTile(
                color: AppColors.warning,
                icon: Icons.wb_sunny_rounded,
                badge: 'Morning',
                meta: '42 min',
                title: 'Daily Twin Hearts Routine',
                subtitle: 'Physical Exercises, Meditation & B...',
                trailingIcon: Icons.play_circle_fill_rounded,
              ),
              const SizedBox(height: 14),
              _PlaylistTile(
                color: AppColors.deepPurple,
                icon: Icons.nightlight_round,
                badge: 'Dusk',
                meta: '5 tracks • 1h 10m',
                title: 'Evening Aura Cleansing & C...',
                subtitle: '108 OM Chants with Tibetan Singin...',
                trailingIcon: Icons.shuffle_rounded,
              ),
              const SizedBox(height: 14),
              _PlaylistTile(
                color: AppColors.danger,
                icon: Icons.self_improvement,
                badge: 'Advanced',
                meta: '4 tracks • 55 mins',
                title: 'Arhatic Dhyan & Kundalini',
                subtitle: 'Spiritual Cord Affirmation & Blue P...',
                trailingIcon: Icons.play_circle_fill_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.active});

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active ? AppColors.textDark : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: active ? Colors.white : AppColors.textGray,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _PlaylistTile extends StatelessWidget {
  const _PlaylistTile({
    required this.color,
    required this.icon,
    required this.badge,
    required this.meta,
    required this.title,
    required this.subtitle,
    required this.trailingIcon,
  });

  final Color color;
  final IconData icon;
  final String badge;
  final String meta;
  final String title;
  final String subtitle;
  final IconData trailingIcon;

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
          Container(
            width: 46,
            height: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                        color: color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(badge, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(width: 6),
                    Text('• $meta', style: const TextStyle(color: AppColors.textGray, fontSize: 11)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(title, style: const TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w700, fontSize: 14)),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: AppColors.textGray, fontSize: 11),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(trailingIcon, color: AppColors.primaryPurple, size: 28),
        ],
      ),
    );
  }
}
