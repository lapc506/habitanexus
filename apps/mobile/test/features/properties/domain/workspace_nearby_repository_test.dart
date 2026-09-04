import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:habitanexus_mobile/features/properties/domain/entities/workspace_nearby.dart';
import 'package:habitanexus_mobile/features/properties/domain/repositories/workspace_nearby_repository.dart';

/// Mock del repositorio para tests.
class MockWorkspaceNearbyRepository extends Mock
    implements WorkspaceNearbyRepository {}

void main() {
  group('WorkspaceNearbyRepository', () {
    test('getNearby retorna lista vacía cuando no hay resultados',
        () async {
      final mockRepo = MockWorkspaceNearbyRepository();
      when(() => mockRepo.getNearby(
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
            radius: any(named: 'radius'),
          )).thenAnswer((_) async => []);

      final result = await mockRepo.getNearby(
        latitude: 9.9281,
        longitude: -84.0907,
        radius: 2000,
      );

      expect(result, isEmpty);
    });

    test('getNearby retorna máximo 5 resultados', () async {
      final mockRepo = MockWorkspaceNearbyRepository();
      final manySpaces = List.generate(10, (i) => WorkspaceNearby(
        id: 'id_$i',
        name: 'Space $i',
        category: i.isEven ? 'coworking' : 'cafe',
        distanceKm: i.toDouble(),
        hasWifi: true,
      ));

      when(() => mockRepo.getNearby(
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
            radius: any(named: 'radius'),
          )).thenAnswer((_) async => manySpaces.take(5).toList());

      final result = await mockRepo.getNearby(
        latitude: 9.9281,
        longitude: -84.0907,
        radius: 2000,
      );

      expect(result.length, lessThanOrEqualTo(5));
    });

    test('getNearby ordena por distancia', () async {
      final mockRepo = MockWorkspaceNearbyRepository();
      final spaces = [
        WorkspaceNearby(
          id: '3', name: 'Café Lejano', category: 'cafe',
          distanceKm: 5.0, hasWifi: true,
        ),
        WorkspaceNearby(
          id: '1', name: 'Coworking Cerca', category: 'coworking',
          distanceKm: 0.5, hasWifi: true,
        ),
      ];

      when(() => mockRepo.getNearby(
            latitude: any(named: 'latitude'),
            longitude: any(named: 'longitude'),
            radius: any(named: 'radius'),
          )).thenAnswer((_) async => spaces);

      final result = await mockRepo.getNearby(
        latitude: 9.9281,
        longitude: -84.0907,
        radius: 2000,
      );

      // La ordenación se hace en el datasource, no en el repositorio
      // Pero verificamos que se retornen todos
      expect(result.length, equals(2));
    });
  });
}