import 'package:flutter/material.dart';
import 'package:projeto_atual/app/data/models/memory.dart';
import 'package:projeto_atual/app/data/models/memory_filter.dart';
import 'package:projeto_atual/app/data/models/milestone.dart';
import 'package:projeto_atual/app/widgets/memory_grid_item.dart';
import 'package:projeto_atual/app/widgets/milestone_timeline.dart';
import 'package:projeto_atual/app/modules/memorias/pages/memory_detail_screen.dart';
import 'package:projeto_atual/app/modules/memorias/pages/memory_filters_screen.dart';

class MemoriesScreen extends StatefulWidget {
  final String babyName;
  const MemoriesScreen({super.key, required this.babyName});

  @override
  State<MemoriesScreen> createState() => _MemoriesScreenState();
}

class _MemoriesScreenState extends State<MemoriesScreen> {
  String _selectedTab = 'Todos';

  final List<Memory> _memories = []; // preencha com os dados / API
  final List<Milestone> _milestones = []; 
  String _timelineView = 'Linha do tempo';
  MemoryFilter _activeFilter = const MemoryFilter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memórias do ${widget.babyName}'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          const CircleAvatar(radius: 40), // troque por uma imagem d bebe
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'Aqui ficam guardados os momentos e conquistas do seu bebê.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 16),
          _buildTabs(),
          const SizedBox(height: 8),
          if (_selectedTab == 'Marcos') ...[
            _buildTimelineDropdown(),
            const SizedBox(height: 8),
            Expanded(child: _buildTimeline()),
          ] else ...[
            _buildFilterRow(),
            const SizedBox(height: 12),
            Expanded(child: _buildGrid()),
          ],
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // abrir tela de adicionar memória
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTabs() {
    final tabs = ['Todos', 'Fotos', 'Vídeos', 'Marcos'];
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: tabs.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final tab = tabs[index];
          final selected = tab == _selectedTab;
          return ChoiceChip(
            label: Text(tab),
            selected: selected,
            onSelected: (_) => setState(() => _selectedTab = tab),
          );
        },
      ),
    );
  }

  Widget _buildFilterRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.sort),
            label: const Text('Mais recentes'),
          ),
          OutlinedButton.icon(
            onPressed: _openFilters,
            icon: const Icon(Icons.filter_list),
            label: const Text('Filtros'),
          ),
        ],
      ),
    );
  }

  Future<void> _openFilters() async {
    final result = await Navigator.push<MemoryFilter>(
      context,
      MaterialPageRoute(
        builder: (_) => MemoryFiltersScreen(initialFilter: _activeFilter),
      ),
    );
    if (result != null) {
      setState(() => _activeFilter = result);
      // aqui você aplica o _activeFilter para re-filtrar a lista de memórias (_memories) conforme os critérios selecionados.
    }
  }

  Widget _buildGrid() {
    if (_memories.isEmpty) {
      return const Center(child: Text('Nenhuma memória ainda'));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _memories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final memory = _memories[index];
        return MemoryGridItem(
          memory: memory,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MemoryDetailScreen(memory: memory),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTimelineDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: DropdownButton<String>(
          value: _timelineView,
          underline: const SizedBox(),
          items: const [
            DropdownMenuItem(value: 'Linha do tempo', child: Text('Linha do tempo')),
            DropdownMenuItem(value: 'Por marco', child: Text('Por marco')),
          ],
          onChanged: (value) => setState(() => _timelineView = value!),
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    return MilestoneTimeline(
      milestones: _milestones,
      onTap: (milestone) {
        // abrir tela de detalhes do marco
      },
    );
  }
}