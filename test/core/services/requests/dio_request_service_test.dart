
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:w_package/core/services/requests/dio_request_service.dart';
import 'package:w_package/core/services/requests/errors/not_internet_connection_exception.dart';

@GenerateNiceMocks([MockSpec<Dio>()])
import 'dio_request_service_test.mocks.dart';

main(){

  group('DIO REQUEST SERVICE:', () {
    group('No internet connection:', () {
      late DioRequestService dioRequestService;
      MockDio mockDio = MockDio();

      setUp(() {
        dioRequestService = DioRequestService(dio: mockDio);
      });

      test('GET: ', () async {
        when(mockDio.get(any, options: anyNamed('options'))).thenThrow(Exception());
        expect(() async => await dioRequestService.get('https://www.google.com/'), throwsA(isA<NotInternetConnectionException>()));
      });

      test('POST: ', () async {
        when(mockDio.post(any, options: anyNamed('options'))).thenThrow(Exception());
        expect(() async => await dioRequestService.post('https://www.google.com/'), throwsA(isA<NotInternetConnectionException>()));
      });

      test('PUT: ', () async {
        when(mockDio.put(any, options: anyNamed('options'))).thenThrow(Exception());
        expect(() async => await dioRequestService.put('https://www.google.com/'), throwsA(isA<NotInternetConnectionException>()));
      });

      test('PATCH: ', () async {
        when(mockDio.patch(any, options: anyNamed('options'))).thenThrow(Exception());
        expect(() async => await dioRequestService.patch('https://www.google.com/'), throwsA(isA<NotInternetConnectionException>()));
      });

      test('DELETE: ', () async {
        when(mockDio.delete(any, options: anyNamed('options'))).thenThrow(Exception());
        expect(() async => await dioRequestService.delete('https://www.google.com/'), throwsA(isA<NotInternetConnectionException>()));
      });
    });

    group('Has connection:', () {
      late DioRequestService dioRequestService;
      MockDio mockDio = MockDio();

      setUp(() {
        dioRequestService = DioRequestService(dio: mockDio);
      });

      test('GET: ', () async {
        when(mockDio.get(any, options: anyNamed('options'))).thenAnswer((realInvocation) async => Response(
          statusCode: 200,
          data: null,
          requestOptions: RequestOptions(path: ''),
          headers: Headers(),
          statusMessage: 'successo',));
        
        var result = await dioRequestService.get('https://www.google.com/');

        expect(result.message, 'successo');
      });

      test('POST: ', () async {
        when(mockDio.post(any, options: anyNamed('options'))).thenAnswer((realInvocation) async => Response(
          statusCode: 200,
          data: null,
          requestOptions: RequestOptions(path: ''),
          headers: Headers(),
          statusMessage: 'successo',));
        
        var result = await dioRequestService.post('https://www.google.com/');

        expect(result.message, 'successo');
      });

      test('PUT: ', () async {
        when(mockDio.put(any, options: anyNamed('options'))).thenAnswer((realInvocation) async => Response(
          statusCode: 200,
          data: null,
          requestOptions: RequestOptions(path: ''),
          headers: Headers(),
          statusMessage: 'successo',));
        
        var result = await dioRequestService.put('https://www.google.com/');

        expect(result.message, 'successo');
      });

      test('PATCH: ', () async {
        when(mockDio.patch(any, options: anyNamed('options'))).thenAnswer((realInvocation) async => Response(
          statusCode: 200,
          data: null,
          requestOptions: RequestOptions(path: ''),
          headers: Headers(),
          statusMessage: 'successo',));
        
        var result = await dioRequestService.patch('https://www.google.com/');

        expect(result.message, 'successo');
      });

      test('DELETE: ', () async {
        when(mockDio.delete(any, options: anyNamed('options'))).thenAnswer((realInvocation) async => Response(
          statusCode: 200,
          data: null,
          requestOptions: RequestOptions(path: ''),
          headers: Headers(),
          statusMessage: 'successo',));
        
        var result = await dioRequestService.delete('https://www.google.com/');

        expect(result.message, 'successo');
      });
    });
  });
  
}