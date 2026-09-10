# HAB-91 — Resumen de implementación

## ✅ Implementado

### Flutter (mobile app)

- `NearbyCoworkingsWidget` (`ConsumerStatefulWidget`) — muestra coworkings y cafés con WiFi
  - `propertyLatitude`, `propertyLongitude`, `searchRadius`
  - Cada tarjeta: nombre, categoría, distancia en km, indicador WiFi
  - Estado: carga, error, lista vacía
  - Límite: máximo 5 resultados ordenados por distancia
  - Botón "Ver buscador completo" (`onViewFullSearch`)

- `PropertyDetailPage` (`ConsumerStatefulWidget`) — ficha de propiedad real
  - Recibe `propertyId`, `propertyName`, `latitude`, `longitude`, `address`
  - Monta `NearbyCoworkingsWidget` con coordenadas de la propiedad

- `WorkspaceNearby` (entidad de dominio) + `WorkspaceNearbyModel` (data)
  - Normalización de respuesta Google Places (`fromGooglePlace`)
  - Cálculo Haversine en km con redondeo a 2 decimales
  - Categorización (`coworking`, `cafe`, `other`)

- `WorkspaceNearbyRepository` (abstracto) + `WorkspaceNearbyRepositoryImpl` (concreto)
  - `GooglePlacesRemoteDatasource` llama `GET /coworkings/nearby?lat=X&lng=Y&radius=Z`
  - No expone API key de Google en Flutter
  - Ordena por distancia y limita a 5

- `WorkspaceNearbyConfig` — variables de entorno (`BACKEND_URL`, `GOOGLE_PROJECT_ID`)

- Provider `coworkingNearbyProvider` (`StateNotifierProvider`) con `loadNearby()`
- Stub local (`StubCoworkingLocalDatasource`) disponible para reemplazo

- Tests:
  - `workspace_nearby_model_test.dart` — Haversine, categorización, límite 5, navegación lat/lng
  - `workspace_nearby_repository_test.dart` — repositorio con mock
  - `workspace_nearby_datasource_test.dart` — datasource remoto con `MockDio`
  - `providers_test.dart` — provider/notifier

### Documentación / Backend

- `docs/hab-91-backend-endpoint.md` — endpoint `GET /coworkings/nearby`
- Configuración Google Places API con restricciones (no exponer en frontend)
- `infrastructure/terraform/environments/dev/` — referencia para variables de entorno
- `features/README_PROPERTIES.md` — documentación del módulo

### Widgetbook

- `nearby_coworkings_widget_use_case.dart` — use case con fixtures

### Bloqueo documentado

- `PropertyDetailPage` creada como parte de HAB-91
- `NearbyCoworkingsWidget` montado en la ficha con coordenadas de la propiedad
- Navegación al buscador completo (`_openFullSearch`) pendiente de confirmación del alcance
- `workspaceNearbyRepositoryProvider` configurado para usar la implementación remota por defecto

## ⚠️ Pendiente (no bloquea HAB-91)

1. Verificar que `flutter analyze` pasa (sin Dart instalado en este entorno, no se puede confirmar)
2. Confirmar alcance del buscador completo (`onViewFullSearch`): ¿nueva pantalla, navegación con parámetros?
3. Implementar backend real `GET /coworkings/nearby` (solo documentado en este PR)
4. Configurar `BACKEND_URL` en entorno real y restringir Google Places API key
