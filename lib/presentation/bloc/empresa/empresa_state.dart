import 'package:projeto_estagio_vendas/data/model/empresa_data_base_model.dart';

abstract class EmpresaState{
  final EmpresaDatabaseModel? empresa;

  EmpresaState({
    this.empresa
  });
}

class EmpresaInitialState extends EmpresaState{
  EmpresaInitialState({super.empresa});
}

class EmpresaSucessState extends EmpresaState{
  EmpresaSucessState({super.empresa});
}

class EmpresaErrorState extends EmpresaState{
  final String error;

  EmpresaErrorState({required this.error});
}
