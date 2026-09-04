# HAB-91 — Espacios de trabajo cercanos

## Descripción

Sección "Espacios de trabajo cerca" en la ficha de detalle de una propiedad.
Muestra coworkings y cafés con WiFi cercanos usando Google Places API (Nearby Search).

## Estructura

```
features/properties/
├── domain/
│   ├── entities/workspace_nearby.dart          # Entidad de dominio
│   └── repositories/workspace_nearby_repository.dart  # Interfaz del repositorio
├── data/
│   ├── config.dart                             # Configuración (backend URL, etc.)
│   ├── datasources/
│   │   ├── workspace_nearby_datasource.dart      # Abstracción de datasource
│   │   ├── local/stub_coworking_local_datasource.dart  # Stub local
│   │   └── remote/
│   │       ├── google_places_remote_datasource.dart    # Implementación remota
│   │       └── workspace_nearby_repository_impl.dart   # Implementación concreta
│   └── models/
│       └── workspace_nearby_model.dart           # Modelo de datos con Haversine
├── presentation/
│   ├── providers/coworking_nearby_provider.dart  # Riverpod provider
│   ├── widgets/nearby_coworkings_widget.dart     # Widget principal
│   └── pages/property_detail_page.dart            # Página de detalle de propiedad
└── properties.dart                               # Barrel file
```

## Configuración

### Variables de entorno

```bash
BACKEND_URL=http://localhost:8080
GOOGLE_PROJECT_ID=habitanexus-prod
```

### Google Places API

1. Crear API Key en Google Cloud Console
2. Restricción: HTTP referrers (solo el backend)
3. Habilitar Places API
4. **NUNCA** poner la API key en código Flutter

## Dependencias

- `dio: ^5.4.0` — Para llamadas HTTP al backend propio
- `flutter_riverpod: ^2.4.9` — Para state management

## Testing

- `test/features/properties/data/workspace_nearby_model_test.dart` — Modelo, Haversine, categorización
- `test/features/properties/domain/workspace_nearby_repository_test.dart` — Repositorio mock
- `test/features/properties/data/remote/workspace_nearby_datasource_test.dart` — Datasource remoto
- `test/features/properties/presentation/providers_test.dart` — Provider/notifier

## Bloqueo documentado

- La pantalla de detalle de propiedad (`PropertyDetailPage`) fue creada como parte de HAB-91.
- El widget `NearbyCoworkingsWidget` se monta dentro de ella.
- El backend `GET /coworkings/nearby` debe ser implementado por el equipo de backend.
- La navegación al "buscador completo" está pendiente de confirmación del alcance.
