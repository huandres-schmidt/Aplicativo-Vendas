import '../../data/model/cliente_model.dart';

abstract class ClienteLocalRepository{
  Future<void> save(ClienteModel cliente);
}