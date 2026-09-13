enum TimelineStatus { done, sync, inProgress, todo }

class MarcoModel {
  final String idade;
  final String titulo;
  final String dataRegistro;
  final TimelineStatus status;

  MarcoModel({
    required this.idade,
    required this.titulo,
    required this.dataRegistro,
    required this.status,
  });
}