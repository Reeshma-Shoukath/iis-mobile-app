import 'package:flutter/material.dart';

import '../app_colors.dart';

class AlbumsScreen extends StatelessWidget {
  const AlbumsScreen({super.key});

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
                    'My Albums',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.textDark),
                  ),
                  Spacer(),
                  Icon(Icons.history_rounded, color: AppColors.textGray),
                ],
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: AppColors.textLightGray, size: 20),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Search chants, mantras, sutras...',
                        style: TextStyle(color: AppColors.textLightGray, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 36,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _FilterChip(label: 'All Albums', active: true),
                    SizedBox(width: 10),
                    _FilterChip(label: 'Downloaded', active: false),
                    SizedBox(width: 10),
                    _FilterChip(label: 'Favorites', active: false),
                    SizedBox(width: 10),
                    _FilterChip(label: 'Chants', active: false),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 96,
                      height: 96,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.divider, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.local_florist, color: AppColors.pink, size: 32),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Your Sanctuary is Empty',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textDark),
                    ),
                    const SizedBox(height: 6),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "You haven't added any Master Choa Kok Sui meditation albums to your sacred library yet.",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.textGray, fontSize: 12, height: 1.4),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'EXPLORE DISCOGRAPHY',
                            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(width: 6),
                          Icon(Icons.arrow_forward_rounded, color: Colors.white, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              Row(
                children: const [
                  Text(
                    'RECOMMENDED FOR YOUR PRACTICE',
                    style: TextStyle(color: AppColors.textDark, fontSize: 13, fontWeight: FontWeight.w700, letterSpacing: 0.3),
                  ),
                ],
              ),
              Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Pranic healing foundational essentials',
                      style: TextStyle(color: AppColors.textGray, fontSize: 12),
                    ),
                  ),
                  Text('View All', style: TextStyle(color: AppColors.primaryPurple, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 14),
              _AlbumTile(
                color: AppColors.pink,
                icon: Icons.favorite,
                title: 'Meditation on Twin Hearts',
                subtitle: 'Grand Master Choa Kok Sui',
                meta: '7 Tracks • 28 Mins • Illumination',
              ),
              const SizedBox(height: 14),
              _AlbumTile(
                color: AppColors.hindiMeditationGradient.colors.first,
                icon: Icons.self_improvement,
                title: 'Meditation on the Soul',
                subtitle: 'Achieving Oneness with Higher Soul',
                meta: '5 Tracks • 45 Mins • Chakra Energy',
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

class _AlbumTile extends StatelessWidget {
  const _AlbumTile({
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.meta,
  });

  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;
  final String meta;

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
                Text(title, style: const TextStyle(color: AppColors.textDark, fontWeight: FontWeight.w700, fontSize: 14)),
                const SizedBox(height: 2),
                Text(subtitle, style: const TextStyle(color: AppColors.textGray, fontSize: 11)),
                const SizedBox(height: 4),
                Text(meta, style: const TextStyle(color: AppColors.textLightGray, fontSize: 10)),
              ],
            ),
          ),
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.divider),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: AppColors.primaryPurple, size: 16),
          ),
        ],
      ),
    );
  }
}
