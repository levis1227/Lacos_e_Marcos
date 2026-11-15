import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/data/models/memory.dart';

class MemoryDetailScreen extends StatelessWidget {
  final Memory memory;
  const MemoryDetailScreen({super.key, required this.memory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe da memória'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: ListView(
        children: [
          _buildMedia(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (memory.milestoneTitle != null) ...[
                  Row(
                    children: const [
                      Icon(Icons.flag, size: 16, color: AppColors.primaryButton),
                      SizedBox(width: 4),
                      Text('Marcos alcançado', style: TextStyle(color: AppColors.primaryButton)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _MilestoneBadge(
                    title: memory.milestoneTitle!,
                    ageRange: memory.milestoneAgeRange ?? '',
                  ),
                  const SizedBox(height: 12),
                ],
                if (memory.description != null)
                  Text(memory.description!, style: const TextStyle(height: 1.4)),
                const SizedBox(height: 8),
                Text(
                  '${memory.date.day.toString().padLeft(2, '0')}/'
                  '${memory.date.month.toString().padLeft(2, '0')}/'
                  '${memory.date.year} - '
                  '${memory.date.hour}:${memory.date.minute.toString().padLeft(2, '0')}',
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 20),
                const Text('Curtido por', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 8),
                _LikesRow(
                  avatars: memory.likedByAvatars ?? [],
                  extraCount: memory.extraLikesCount ?? 0,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Adicionar comentário...',
              suffixIcon: const Icon(Icons.emoji_emotions_outlined),
              filled: true,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(24),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMedia() {
    return AspectRatio(
      aspectRatio: 1,
      child: memory.type == MemoryType.video
          ? _VideoThumbnail(imageUrl: memory.imageUrl)
          : Image.network(memory.imageUrl, fit: BoxFit.cover),
    );
  }
}

class _VideoThumbnail extends StatelessWidget {
  final String imageUrl;
  const _VideoThumbnail({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(imageUrl, fit: BoxFit.cover),
        // Botão de play central — ao tocar, iniciar reprodução real do vídeo
        Center(
          child: GestureDetector(
            onTap: () {
              // aqui entra a lógica de reprodução (ex: video_player, chewie)
            },
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.45),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.play_arrow, color: Colors.white, size: 32),
            ),
          ),
        ),
        // Barra de progresso + tempos, fixa na base do vídeo
        Positioned(
          left: 12,
          right: 12,
          bottom: 12,
          child: _VideoProgressBar(),
        ),
      ],
    );
  }
}

class _VideoProgressBar extends StatelessWidget {
  const _VideoProgressBar();

  @override
  Widget build(BuildContext context) {
    // valores fixos de exemplo — troque por controller real (ex: video_player)
    const currentTime = '0:00';
    const totalTime = '0:15';
    const progress = 0.35;

    return Row(
      children: [
        Text(
          currentTime,
          style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 10),
              activeTrackColor: Colors.white,
              inactiveTrackColor: Colors.white.withValues(alpha: 0.4),
              thumbColor: Colors.white,
            ),
            child: Slider(
              value: progress,
              onChanged: (_) {
                // arrastar a barra deve avançar/retroceder o vídeo real
              },
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          totalTime,
          style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _MilestoneBadge extends StatelessWidget {
  final String title;
  final String ageRange;
  const _MilestoneBadge({required this.title, required this.ageRange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.greenLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: AppColors.primaryButton,
            radius: 14,
            child: Icon(Icons.check, size: 16, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text('Geralmente entre $ageRange', style: const TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

class _LikesRow extends StatelessWidget {
  final List<String> avatars;
  final int extraCount;
  const _LikesRow({required this.avatars, required this.extraCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: avatars.length * 22.0 + 10,
          height: 32,
          child: Stack(
            children: [
              for (int i = 0; i < avatars.length; i++)
                Positioned(
                  left: i * 22.0,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundImage: NetworkImage(avatars[i]),
                  ),
                ),
            ],
          ),
        ),
        if (extraCount > 0)
          Text('e outras $extraCount pessoas', style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}