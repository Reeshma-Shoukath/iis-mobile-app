import 'package:flutter/material.dart';

import '../app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: AppColors.textDark),
                  children: [
                    TextSpan(text: 'Happy '),
                    TextSpan(text: 'Friday', style: TextStyle(color: AppColors.primaryPurple)),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Harmonize the Throat & Crown Chakras today',
                      style: TextStyle(color: AppColors.textGray, fontSize: 13),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle),
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Live Stream',
                          style: TextStyle(color: AppColors.success, fontSize: 11, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
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
                  children: [
                    const Icon(Icons.search, color: AppColors.textLightGray, size: 20),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Search mantras, Twin Hearts, affirmati...',
                        style: TextStyle(color: AppColors.textLightGray, fontSize: 13),
                      ),
                    ),
                    const Icon(Icons.tune_rounded, color: AppColors.textLightGray, size: 20),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: AppColors.wisdomCardGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.auto_awesome, color: Colors.amberAccent, size: 16),
                        const SizedBox(width: 6),
                        const Expanded(
                          child: Text(
                            'DAILY ARHATIC WISDOM',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.6,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text('Sutra 108', style: TextStyle(color: Colors.white, fontSize: 11)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      '"Arhatic Yoga consists of yogic techniques designed to help us develop spiritually. It is prehistoric in origin."',
                      style: TextStyle(color: Colors.white, fontSize: 14, height: 1.4, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            '— Master Choa Kok Sui',
                            style: TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('Deep Contemplation', style: TextStyle(color: Colors.white70, fontSize: 11)),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_outward_rounded, color: Colors.white70, size: 14),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDot(active: true),
                  _buildDot(active: false),
                  _buildDot(active: false),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                children: [
                  const Icon(Icons.local_florist, color: AppColors.primaryPurple, size: 16),
                  const SizedBox(width: 6),
                  const Expanded(
                    child: Text(
                      'FEATURED ALBUM',
                      style: TextStyle(
                        color: AppColors.textDark,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('View Liner Notes', style: TextStyle(color: AppColors.primaryPurple, fontSize: 12)),
                      SizedBox(width: 2),
                      Icon(Icons.chevron_right, color: AppColors.primaryPurple, size: 16),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const _FeaturedAlbumCard(),
              const SizedBox(height: 22),
              Row(
                children: const [
                  Icon(Icons.favorite, color: AppColors.primaryPurple, size: 16),
                  SizedBox(width: 6),
                  Text(
                    'POPULAR MEDITATIONS',
                    style: TextStyle(
                      color: AppColors.textDark,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Most played global collective sessions',
                      style: TextStyle(color: AppColors.textGray, fontSize: 12),
                    ),
                  ),
                  const Text('See All', style: TextStyle(color: AppColors.primaryPurple, fontSize: 12)),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 168,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _MeditationCard(
                      gradient: AppColors.twinHeartsGradient,
                      icon: Icons.public,
                      badge: 'Twin Hearts',
                      title: 'Meditation on Twin\nHearts',
                      author: 'Master Choa Kok Sui',
                      duration: '21 min',
                    ),
                    const SizedBox(width: 12),
                    _MeditationCard(
                      gradient: AppColors.hindiMeditationGradient,
                      icon: Icons.self_improvement,
                      badge: 'Hindi Meditation',
                      title: 'शांति एवं प्रकाश के लिए',
                      author: '',
                      duration: '24 min',
                    ),
                    const SizedBox(width: 12),
                    _MeditationCard(
                      gradient: AppColors.universalGradient,
                      icon: Icons.blur_circular,
                      badge: 'Universal',
                      title: 'Om Chanting for\nUniversal Peace',
                      author: '',
                      duration: '32 min',
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

  Widget _buildDot({required bool active}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: active ? 18 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: active ? AppColors.primaryPurple : AppColors.divider,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class _FeaturedAlbumCard extends StatelessWidget {
  const _FeaturedAlbumCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90,
            height: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: AppColors.universalGradient,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.local_florist, color: Colors.white, size: 32),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.primaryPurple.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Audio',
                        style: TextStyle(color: AppColors.primaryPurple, fontSize: 10, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text('• 108 Repetitions', style: TextStyle(color: AppColors.textGray, fontSize: 10)),
                    const SizedBox(width: 6),
                    const Text('432 Hz', style: TextStyle(color: AppColors.textGray, fontSize: 10)),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  'Mantra OM: The Sound of Stillness',
                  style: TextStyle(color: AppColors.textDark, fontSize: 14, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 2),
                const Text('Master Choa Kok Sui', style: TextStyle(color: AppColors.textGray, fontSize: 11)),
                const SizedBox(height: 6),
                const Text(
                  'Offers a transformative journey through sacred universal...',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColors.textGray, fontSize: 11, height: 1.3),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text('32:45', style: TextStyle(color: AppColors.textGray, fontSize: 11)),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.play_arrow_rounded, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text('Play Now', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                        ],
                      ),
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

class _MeditationCard extends StatelessWidget {
  const _MeditationCard({
    required this.gradient,
    required this.icon,
    required this.badge,
    required this.title,
    required this.author,
    required this.duration,
  });

  final Gradient gradient;
  final IconData icon;
  final String badge;
  final String title;
  final String author;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 15),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    badge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 9),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w700, height: 1.25),
          ),
          if (author.isNotEmpty) ...[
            const SizedBox(height: 2),
            Text(author, style: const TextStyle(color: Colors.white70, fontSize: 10)),
          ],
          const SizedBox(height: 8),
          Row(
            children: [
              Text(duration, style: const TextStyle(color: Colors.white70, fontSize: 10)),
              const Spacer(),
              Container(
                width: 24,
                height: 24,
                alignment: Alignment.center,
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: const Icon(Icons.play_arrow_rounded, color: AppColors.primaryPurple, size: 16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
