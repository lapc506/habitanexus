import 'package:equatable/equatable.dart';

/// Entidad de dominio para un espacio de trabajo cercano.
/// Representa un coworking o café con WiFi cerca de una propiedad.
class WorkspaceNearby extends Equatable {
  final String id;
  final String name;
  final String category; // 'coworking' o 'cafe'
  final double distanceKm;
  final bool hasWifi;

  const WorkspaceNearby({
    required this.id,
    required this.name,
    required this.category,
    required this.distanceKm,
    required this.hasWifi,
  });

  /// Crea una copia con valores modificados.
  WorkspaceNearby copyWith({
    String? id,
    String? name,
    String? category,
    double? distanceKm,
    bool? hasWifi,
  }) {
    return WorkspaceNearby(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      distanceKm: distanceKm ?? this.distanceKm,
      hasWifi: hasWifi ?? this.hasWifi,
    );
  }

  @override
  List<Object> get props => [id, name, category, distanceKm, hasWifi];
}