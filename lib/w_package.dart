library w_package;

///
import 'package:get_it/get_it.dart';
import 'package:w_package/core/services/connection/connection_service.dart';
import 'package:w_package/core/services/requests/dio_request_service.dart';
import 'package:w_package/core/services/requests/request_service.dart';
import 'core/services/connection/connection_service_impl.dart';
///

//Pubspec
export 'package:get_it/get_it.dart';
export 'package:dio/dio.dart';
export 'package:equatable/equatable.dart';
export 'package:flutter_animate/flutter_animate.dart';
export 'package:intl/intl.dart';
//ERRORS
export 'core/errors/failures.dart';

//SERVICES
export 'core/services/connection/connection_service.dart';
export 'core/services/connection/connection_service_impl.dart';
export 'core/services/requests/dio_request_service.dart';
export 'core/services/requests/request_service.dart';
export 'core/services/requests/errors/not_internet_connection_exception.dart';
export 'core/services/requests/request_result.dart';

//ENUMS
export 'core/common/enums/layout_types.dart';

//EXTENSIONS
export 'core/common/extensions/all_extension.dart';
export 'core/common/extensions/bool_sql_extension.dart';
export 'core/common/extensions/color_extension.dart';
export 'core/common/extensions/context_extension.dart';
export 'core/common/extensions/date_format_extension.dart';
export 'core/common/extensions/entities_extension.dart';
export 'core/common/extensions/responsive_extension.dart';
export 'core/common/extensions/sized_context.dart';
export 'core/common/extensions/widget_extension.dart';

class WPackage {
  static void setInstances() {
    GetIt.instance.registerLazySingleton<ConnectionService>(() => ConnectionServiceImpl(requestService: DioRequestService()));
    GetIt.instance.registerLazySingleton<RequestService>(() => DioRequestService());
  }
}