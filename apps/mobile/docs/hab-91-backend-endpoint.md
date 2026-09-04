# HAB-91 Backend Endpoint: /coworkings/nearby

## Endpoint

```
GET /coworkings/nearby?lat=X&lng=Y&radius=Z
```

## Descripción

Este endpoint consulta Google Places API (Nearby Search) para obtener coworkings y cafés con WiFi cerca de una propiedad.

La API key de Google se almacena en variables de entorno/secrets y **nunca se expone en Flutter**.

## Parámetros de Query

| Parámetro | Tipo | Requerido | Descripción |
|-----------|------|-----------|-------------|
| `lat` | float | Sí | Latitud de la propiedad |
| `lng` | float | Sí | Longitud de la propiedad |
| `radius` | int | No | Radio de búsqueda en metros (default: 2000, max: 50000) |

## Variables de Entorno

```bash
# Google Places API Configuration
GOOGLE_MAPS_API_KEY=sk_live_xxxxx
GOOGLE_PLACES_API_URL=https://maps.googleapis.com/maps/api/place/nearbysearch/json

# API Key Restrictions:
# - HTTP referrers (para el backend)
# - Limit to Places API only
# - Restrict by IP o dominio del backend
```

## Restricción de API Key

1. En Google Cloud Console → APIs & Services → Credentials
2. Crear API Key con restricciones:
   - **Application restrictions**: HTTP referrers (para el backend)
   - **API restrictions**: Places API
   - NUNCA poner la API key en código Flutter

## Respuesta de Ejemplo

```json
{
  "results": [
    {
      "place_id": "ChIJxxxx",
      "name": "WeWork Escazú",
      "types": ["coworking", "point_of_interest"],
      "geometry": {
        "location": {"lat": 9.9300, "lng": -84.0800}
      }
    },
    {
      "place_id": "ChIJyyyy",
      "name": "Café Avellaneda",
      "types": ["cafe", "point_of_interest"],
      "geometry": {
        "location": {"lat": 9.9290, "lng": -84.0850}
      }
    }
  ],
  "status": "OK"
}
```

## Normalización de Respuesta

El backend normaliza la respuesta de Google Places al modelo `WorkspaceNearby`:
- `id` → `place_id`
- `name` → `name`  
- `category` → determinado por `types` (coworking vs cafe)
- `distanceKm` → calculado con Haversine desde lat/lng de la propiedad
- `hasWifi` → inferido de types (café siempre tiene WiFi)

## Códigos de Error

| Código | Descripción |
|--------|-------------|
| 400 | Parámetros faltantes o inválidos |
| 401 | API Key inválida o sin permisos |
| 403 | API Key con restricciones no válidas |
| 429 | Rate limit excedido |
| 500 | Error interno del servidor |

## Configuración Terraform (Google Cloud)

```hcl
# infrastructure/terraform/modules/google_places/api_key.tf
resource "google_api_keys_key" "places_api" {
  display_name = "habitanexus-places-api"
  
  restrictions {
    application_restrictions {
      browser_key_restrictions {
        # Solo el backend servidor
        allowed_referrers = ["https://api.habitanexus.com/*"]
      }
    }
    
    api_targets {
      api = "places-backend.googleapis.com"
    }
  }
}
```
