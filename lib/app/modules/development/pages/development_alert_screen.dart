import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:projeto_atual/app/data/models/development_alert.dart';

class DevelopmentAlertScreen extends StatelessWidget {
  final DevelopmentAlert alert;
  const DevelopmentAlertScreen({super.key, required this.alert});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alerta de desenvolvimento'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.help_outline)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _AlertBanner(alert: alert),
          const SizedBox(height: 16),
          _ActionCard(
            icon: Icons.lightbulb_outline,
            iconBackground: const Color(0xFFF7E7BF),
            title: 'O que você pode fazer agora',
            bullets: alert.currentActionTips,
            illustrationUrl:
                'https://via.placeholder.com/120x120', // ilustração mãe/bebê
            actionLabel: 'Ver orientações para estimular',
            actionColor: AppColors.primaryButton,
            onAction: () {
              // navegar para OrientationContentScreen relacionada
            },
          ),
          const SizedBox(height: 16),
          _ActionCard(
            icon: Icons.medical_services_outlined,
            iconBackground: const Color(0xFFD6E4F5),
            title: 'Quando procurar ajuda profissional?',
            bullets: alert.professionalHelpReasons,
            illustrationUrl:
                'https://via.placeholder.com/120x120', // ilustração
            actionLabel: 'Agendar conversa com profissional',
            actionColor: AppColors.blue,
            onAction: () {
              // navegar para tela de agendamento
            },
          ),
          const SizedBox(height: 16),
          const _SupportFooter(),
        ],
      ),
    );
  }
}

class _AlertBanner extends StatelessWidget {
  final DevelopmentAlert alert;
  const _AlertBanner({required this.alert});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFBE2DE),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.error, color: Color(0xFFD9483A)),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Atenção: marco possivelmente atrasado',
                  style: TextStyle(
                    color: Color(0xFFD9483A),
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.grey.shade800, fontSize: 13.5, height: 1.4),
              children: [
                const TextSpan(text: 'O marco '),
                TextSpan(
                  text: '"${alert.milestoneTitle}"',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const TextSpan(text: ' ainda não foi registrado e já deveria ter sido observado.'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  alert.babyIllustrationUrl,
                  width: 90,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _InfoRow(icon: Icons.calendar_today_outlined, label: 'Idade do seu bebê', value: alert.babyAgeText),
                      const SizedBox(height: 10),
                      _InfoRow(icon: Icons.track_changes, label: 'Marco esperado', value: alert.milestoneTitle),
                      const SizedBox(height: 10),
                      _InfoRow(icon: Icons.access_time, label: 'Idade esperada', value: alert.expectedAgeRange),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.favorite, color: Color(0xFFD9483A), size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 13, height: 1.4),
                    children: const [
                      TextSpan(text: 'Cada bebê tem seu tempo.\n', style: TextStyle(fontWeight: FontWeight.w700)),
                      TextSpan(text: 'Esse alerta não é um diagnóstico. Ele serve para orientar e incentivar o acompanhamento.'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _InfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: Colors.grey.shade600),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyle(fontSize: 11, color: Colors.grey.shade600)),
              Text(value, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final Color iconBackground;
  final String title;
  final List<String> bullets;
  final String illustrationUrl;
  final String actionLabel;
  final Color actionColor;
  final VoidCallback onAction;

  const _ActionCard({
    required this.icon,
    required this.iconBackground,
    required this.title,
    required this.bullets,
    required this.illustrationUrl,
    required this.actionLabel,
    required this.actionColor,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: iconBackground.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(icon, size: 18, color: Colors.grey.shade800),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            title,
                            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14.5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ...bullets.map(
                      (tip) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 5, right: 6),
                              child: Icon(Icons.circle, size: 4),
                            ),
                            Expanded(
                              child: Text(tip, style: const TextStyle(fontSize: 12.5, height: 1.4)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(illustrationUrl, width: 72, height: 72, fit: BoxFit.cover),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: onAction,
              style: FilledButton.styleFrom(backgroundColor: actionColor),
              icon: const Icon(Icons.arrow_forward, size: 16),
              label: Text(actionLabel),
            ),
          ),
        ],
      ),
    );
  }
}

class _SupportFooter extends StatelessWidget {
  const _SupportFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFBE2DE).withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: const [
          Icon(Icons.favorite_border, color: Color(0xFFD9483A), size: 18),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'Você não está sozinho(a). Estamos aqui para caminhar com você e seu bebê nessa jornada.',
              style: TextStyle(fontSize: 12.5, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}