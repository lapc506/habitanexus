import '../../domain/entities/workspace_nearby.dart';

/// Repositorio abstracto para obtener espacios de trabajo cercanos.
/// La implementación concreta usa Google Places API a través del backend.
abstract class WorkspaceNearbyRepository {
  /// Obtiene espacios de trabajo cercanos a las coordenadas dadas.
  ///
  /// [latitude] y [longitude] son la ubicación de la propiedad.
  /// [radius] es el radio de búsqueda en metros.
  Future<List<WorkspaceNearby>> getNearby({
    required double latitude,
    required double longitude,
    required double radius,
  });
}