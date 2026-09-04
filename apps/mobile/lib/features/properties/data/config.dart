import 'package:flutter/foundation.dart';

/// Configuración del endpoint de espacios de trabajo cercanos.
///
/// La URL del backend y la API Key de Google se configuran
/// mediante variables de entorno / secrets.
class WorkspaceNearbyConfig {
  WorkspaceNearbyConfig._();

  /// URL base del backend propio.
  /// Se configura mediante la variable de entorno `BACKEND_URL`.
  static const String baseUrl = String.fromEnvironment(
    'BACKEND_URL',
    defaultValue: 'http://localhost:8080',
  );

  /// ID del proyecto de Google Cloud.
  static const String googleProjectId = String.fromEnvironment(
    'GOOGLE_PROJECT_ID',
    defaultValue: 'habitanexus-prod',
  );
}