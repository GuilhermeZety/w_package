import 'package:equatable/equatable.dart';

//Modelo padrão para erros futuros
abstract class Failure extends Equatable{
  final String message;

  @override
  List<Object> get props => [message];

  const Failure({required this.message}) ;
}
//General Failures
class ServerFailure extends Failure{
  const ServerFailure({required super.message});
}

class CacheFailure extends Failure{
  const CacheFailure({required super.message});
}