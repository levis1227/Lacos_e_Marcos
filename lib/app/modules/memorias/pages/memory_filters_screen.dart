import 'package:flutter/material.dart';
import 'package:projeto_atual/app/core/theme/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:projeto_atual/app/data/models/memory_filter.dart';

class MemoryFiltersScreen extends StatefulWidget {
  final MemoryFilter initialFilter;
  const MemoryFiltersScreen({super.key, this.initialFilter = const MemoryFilter()});

  @override
  State<MemoryFiltersScreen> createState() => _MemoryFiltersScreenState();
}

class _MemoryFiltersScreenState extends State<MemoryFiltersScreen> {
  late MemoryFilter _filter;

  @override
  void initState() {
    super.initState();
    _filter = widget.initialFilter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtros'),
        actions: [
          TextButton(
            onPressed: () => setState(() => _filter = const MemoryFilter()),
            child: const Text('Limpar'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionTitle('Tipo de conteúdo'),
          const SizedBox(height: 8),
          _buildContentTypeChips(),
          const SizedBox(height: 24),
          _buildSectionTitle('Período'),
          const SizedBox(height: 8),
          _buildPeriodChips(),
          if (_filter.period == PeriodFilter.personalizado) ...[
            const SizedBox(height: 12),
            _buildCustomDateRow(),
          ],
          const SizedBox(height: 24),
          _buildSectionTitle('Marcos'),
          const SizedBox(height: 8),
          _buildMilestoneDropdown(),
          const SizedBox(height: 24),
          _buildSectionTitle('Quem pode ver'),
          const SizedBox(height: 8),
          _buildVisibilityChips(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton(
              onPressed: () => Navigator.pop(context, _filter),
              child: const Text('Aplicar filtros'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Text(text, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14));
  }

  Widget _buildContentTypeChips() {
    final options = {
      ContentType.todos: 'Todos',
      ContentType.fotos: 'Fotos',
      ContentType.videos: 'Vídeos',
      ContentType.marcos: 'Marcos',
    };
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.entries.map((entry) {
        final selected = _filter.contentType == entry.key;
        return ChoiceChip(
          label: Text(entry.value),
          selected: selected,
          onSelected: (_) => setState(() => _filter = _filter.copyWith(contentType: entry.key)),
        );
      }).toList(),
    );
  }

  Widget _buildPeriodChips() {
    final options = {
      PeriodFilter.todos: 'Todos',
      PeriodFilter.ultimos7Dias: 'Últimos 7 dias',
      PeriodFilter.ultimos30Dias: 'Últimos 30 dias',
      PeriodFilter.personalizado: 'Personalizado',
    };
    return Column(
      children: options.entries.map((entry) {
        final selected = _filter.period == entry.key;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: _PeriodOptionTile(
            label: entry.value,
            selected: selected,
            onTap: () => setState(() => _filter = _filter.copyWith(period: entry.key)),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCustomDateRow() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _pickCustomDate(isStart: true),
            icon: const Icon(Icons.calendar_today_outlined, size: 16),
            label: Text(
              _filter.customStartDate != null
                  ? DateFormat('dd/MM/yyyy').format(_filter.customStartDate!)
                  : 'Data inicial',
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _pickCustomDate(isStart: false),
            icon: const Icon(Icons.calendar_today_outlined, size: 16),
            label: Text(
              _filter.customEndDate != null
                  ? DateFormat('dd/MM/yyyy').format(_filter.customEndDate!)
                  : 'Data final',
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickCustomDate({required bool isStart}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked == null) return;
    setState(() {
      _filter = isStart
          ? _filter.copyWith(customStartDate: picked)
          : _filter.copyWith(customEndDate: picked);
    });
  }

  Widget _buildMilestoneDropdown() {
    // trocar itenspor uma lista real de marcos vinda do back-end 
    return DropdownButtonFormField<String?>(
      initialValue: _filter.milestoneId,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      hint: const Text('Todos os marcos'),
      items: const [
        DropdownMenuItem(value: null, child: Text('Todos os marcos')),
        
      ],
      onChanged: (value) => setState(() => _filter = _filter.copyWith(milestoneId: value)),
    );
  }

  Widget _buildVisibilityChips() {
    final options = {
      VisibilityFilter.todos: 'Todos',
      VisibilityFilter.somenteEu: 'Somente eu',
      VisibilityFilter.compartilhadoComigo: 'Compartilhado comigo',
    };
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.entries.map((entry) {
        final selected = _filter.visibility == entry.key;
        return ChoiceChip(
          label: Text(entry.value),
          selected: selected,
          onSelected: (_) => setState(() => _filter = _filter.copyWith(visibility: entry.key)),
        );
      }).toList(),
    );
  }
}

class _PeriodOptionTile extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _PeriodOptionTile({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryButton : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: selected ? AppColors.primaryButton : Colors.grey.shade300),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black87,
            fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}