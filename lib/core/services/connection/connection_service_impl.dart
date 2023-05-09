import 'package:w_package/core/services/connection/connection_service.dart';
import 'package:w_package/core/services/requests/request_service.dart';

class ConnectionServiceImpl extends ConnectionService {
  final RequestService _requestService; 
  ConnectionServiceImpl({required RequestService requestService}): _requestService = requestService;

  @override
  Future<bool> get isConnected async {
    try {
      var response = await _requestService.get('https://www.google.com/');
      if(response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}