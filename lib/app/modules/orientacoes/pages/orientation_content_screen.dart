import 'package:flutter/material.dart';
import 'package:projeto_atual/app/data/models/orientation_content.dart';

class OrientationContentScreen extends StatelessWidget {
  final OrientationContent content;
  const OrientationContentScreen({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conteúdo'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Icon(content.headerIcon, size: 28),
              const SizedBox(width: 8),
              Text(
                content.headerLabel,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              content.illustrationUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            content.articleTitle,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, height: 1.3),
          ),
          const SizedBox(height: 12),
          Text(
            content.bodyText,
            style: TextStyle(fontSize: 14, height: 1.5, color: Colors.grey.shade800),
          ),
          if (content.tips.isNotEmpty) ...[
            const SizedBox(height: 20),
            const Text(
              'Dicas práticas',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
            ),
            const SizedBox(height: 8),
            ...content.tips.map(
              (tip) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 6, right: 8),
                      child: Icon(Icons.circle, size: 5),
                    ),
                    Expanded(
                      child: Text(tip, style: const TextStyle(fontSize: 14, height: 1.4)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}