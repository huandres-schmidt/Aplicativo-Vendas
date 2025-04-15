import 'package:projeto_estagio_vendas/data/model/empresa_data_base_model.dart';

abstract class EmpresaEvent {}

class EmpresaLoadEvent extends EmpresaEvent{}

class EmpresaCreateEvent extends EmpresaEvent {
  EmpresaDatabaseModel? empresaDataBaseModel;

  EmpresaCreateEvent({
    required this.empresaDataBaseModel
  });
}

class EmpresaAddEvent extends EmpresaEvent{
  EmpresaDatabaseModel? empresaDataBase;

  EmpresaAddEvent({
    required this.empresaDataBase
  });
}
