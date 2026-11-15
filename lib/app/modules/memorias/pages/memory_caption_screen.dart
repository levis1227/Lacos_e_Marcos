import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:intl/intl.dart'; 

class MemoryCaptionScreen extends StatefulWidget {
  final String babyImageUrl;
  const MemoryCaptionScreen({super.key, required this.babyImageUrl});

  @override
  State<MemoryCaptionScreen> createState() => _MemoryCaptionScreenState();
}

class _MemoryCaptionScreenState extends State<MemoryCaptionScreen> {
  final _captionController = TextEditingController();
  static const _maxCaptionLength = 500;

  // ignore: prefer_final_fields (serão alterados quando o seletor de marcos for implementado)
  String? _selectedMilestoneTitle = 'Sustenta a cabeça';
  // ignore: prefer_final_fields
  String? _selectedMilestoneAgeRange = 'Geralmente entre 2 e 3 meses';

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  String _visibility = 'Público (todos no app)';

  final List<String> _taggedPeople = ['Papai', 'Vovó Ana', 'Tia Lú'];
  static const _maxPeople = 10;

  @override
  void initState() {
    super.initState();
    _captionController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Legenda da memória'),
        actions: [
          TextButton(
            onPressed: _canPublish() ? _handlePublish : null,
            child: const Text('Publicar', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCaptionCard(),
          const SizedBox(height: 20),
          _buildMilestoneSelector(),
          const SizedBox(height: 20),
          _buildDateTimeRow(),
          const SizedBox(height: 20),
          _buildVisibilitySelector(),
          const SizedBox(height: 20),
          _buildPeopleSection(),
        ],
      ),
    );
  }

  bool _canPublish() => _captionController.text.trim().isNotEmpty;

  void _handlePublish() {
    // montar objeto Memory e enviar para o back-end
  }

  Widget _buildCaptionCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(widget.babyImageUrl),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _captionController,
                  maxLength: _maxCaptionLength,
                  maxLines: 4,
                  minLines: 2,
                  decoration: const InputDecoration(
                    hintText: 'Escreva uma legenda para este momento especial...',
                    border: InputBorder.none,
                    counterText: '', // tirei o contador padrao e coloquei otro
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              '${_captionController.text.length}/$_maxCaptionLength',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMilestoneSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Relacionar a um marco (opcional)', style: _labelStyle()),
        const SizedBox(height: 8),
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: _openMilestonePicker,
          child: Container(
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_selectedMilestoneTitle ?? 'Selecionar marco',
                          style: const TextStyle(fontWeight: FontWeight.w600)),
                      if (_selectedMilestoneAgeRange != null)
                        Text(_selectedMilestoneAgeRange!,
                            style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _openMilestonePicker() {
    // abre a tela com a lista de marcos disponíveis
    // ao selecionar, atualizar _selectedMilestoneTitle e _selectedMilestoneAgeRange pelo setState
  }

  Widget _buildDateTimeRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Data e hora', style: _labelStyle()),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _pickDate,
                icon: const Icon(Icons.calendar_today_outlined, size: 16),
                label: Text(DateFormat('dd/MM/yyyy').format(_selectedDate)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _pickTime,
                icon: const Icon(Icons.access_time, size: 16),
                label: Text(_selectedTime.format(context)),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _selectedDate = picked);
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(context: context, initialTime: _selectedTime);
    if (picked != null) setState(() => _selectedTime = picked);
  }

  Widget _buildVisibilitySelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quem pode ver', style: _labelStyle()),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          initialValue: _visibility,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          items: const [
            DropdownMenuItem(value: 'Público (todos no app)', child: Text('Público (todos no app)')),
            DropdownMenuItem(value: 'Somente família', child: Text('Somente família')),
            DropdownMenuItem(value: 'Só eu', child: Text('Só eu')),
          ],
          onChanged: (value) => setState(() => _visibility = value!),
        ),
      ],
    );
  }

  Widget _buildPeopleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Adicionar pessoas (opcional)', style: _labelStyle()),
        const SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: 'Buscar pessoas...',
            prefixIcon: const Icon(Icons.search),
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
          ),
          onChanged: _onSearchPeople,
        ),
        const SizedBox(height: 6),
        Text('Adicione até $_maxPeople pessoas',
            style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _taggedPeople
              .map((name) => Chip(
                    label: Text(name),
                    backgroundColor: AppColors.greenLight,
                    deleteIcon: const Icon(Icons.close, size: 16),
                    onDeleted: () => setState(() => _taggedPeople.remove(name)),
                  ))
              .toList(),
        ),
      ],
    );
  }

  void _onSearchPeople(String query) {
    // buscar usuários cadastrados no back-end e mostrar sugestões!!!!!!!!!
      }

  TextStyle _labelStyle() => const TextStyle(fontWeight: FontWeight.w600, fontSize: 14);
}