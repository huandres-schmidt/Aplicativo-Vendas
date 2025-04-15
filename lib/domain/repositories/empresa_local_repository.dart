import 'package:projeto_estagio_vendas/data/model/empresa_data_base_model.dart';

abstract class EmpresaLocalRepository{
  Future<void> createEmpresa(EmpresaDatabaseModel empresaDataBaseModel);

  Future<void> calculeteFaturamento();

  Future<EmpresaDatabaseModel?> findFaturamento();

  Future<List<EmpresaDatabaseModel>> findEmpresa();

  Future<void> save(EmpresaDatabaseModel empresaDataBaseModel);
}