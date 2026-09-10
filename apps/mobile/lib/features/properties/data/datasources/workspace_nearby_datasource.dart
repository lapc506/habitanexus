import '../../domain/entities/workspace_nearby.dart';

/// Abstracción de datasource para espacios de trabajo cercanos.
/// Permite cambiar entre fuente local (cache) y remota (Google Places API)
/// sin cambiar la lógica de negocio.
abstract class WorkspaceNearbyDatasource {
  /// Obtiene espacios de trabajo cercanos a las coordenadas dadas.
  Future<List<WorkspaceNearby>> getNearby({
    required double latitude,
    required double longitude,
    required double radius,
  });
}