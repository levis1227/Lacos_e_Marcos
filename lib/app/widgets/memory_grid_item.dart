import 'package:flutter/material.dart';
import 'package:projeto_atual/app/data/models/memory.dart';

class MemoryGridItem extends StatelessWidget {
  final Memory memory;
  final VoidCallback onTap;

  const MemoryGridItem({super.key, required this.memory, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(memory.imageUrl, fit: BoxFit.cover),
            if (memory.type == MemoryType.video)
              const Center(
                child: Icon(Icons.play_circle_fill, color: Colors.white, size: 32),
              ),
            Positioned(
              bottom: 6,
              right: 6,
              child: Icon(
                memory.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
                size: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}