// Features - Properties
// Propiedad detail, Nearby Coworkings

// Domain
export 'domain/entities/workspace_nearby.dart';
export 'domain/repositories/workspace_nearby_repository.dart';

// Data
export 'data/datasources/workspace_nearby_datasource.dart';
export 'data/datasources/local/stub_coworking_local_datasource.dart';
export 'data/datasources/remote/google_places_remote_datasource.dart';
export 'data/datasources/remote/workspace_nearby_repository_impl.dart';
export 'data/models/workspace_nearby_model.dart';
export 'data/config.dart';

// Presentation
export 'presentation/providers/coworking_nearby_provider.dart';
export 'presentation/widgets/nearby_coworkings_widget.dart';
export 'presentation/pages/property_detail_page.dart';