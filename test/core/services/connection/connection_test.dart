import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:w_package/core/services/connection/connection_service.dart';
import 'package:w_package/core/services/connection/connection_service_impl.dart';
import 'package:w_package/core/services/requests/dio_request_service.dart';
import 'package:w_package/core/services/requests/request_result.dart';

@GenerateNiceMocks([MockSpec<DioRequestService>()])
import 'connection_test.mocks.dart';
main(){
  late ConnectionService connection;
  MockDioRequestService mockDioService = MockDioRequestService();

  setUp((){
    connection = ConnectionServiceImpl(requestService: mockDioService);
  });
  group('CONNECTION SERVICE:', () {
    test('should return that has internet connection', () async {
      when(mockDioService.get(any)).thenAnswer(
        (realInvocation) async => const RequestResult(
          statusCode: 200,
          data: null,
          headers: {},
          success: true,
          message: '',
        )
      );

      bool result = await connection.isConnected;

      expect(result, true);
    });

    test('should return "No internet connection"', () async {
      when(mockDioService.get(any)).thenAnswer(
        (realInvocation) async => const RequestResult(
          statusCode: 0,
          data: null,
          headers: {},
          success: false,
          message: '',
        )
      );

      bool result = await connection.isConnected;

      expect(result, false);
    });

    test('should return "No internet connection" but with throw error', () async {
      when(mockDioService.get(any)).thenThrow(Exception());

      bool result = await connection.isConnected;

      expect(result, false);
    });
  });
}