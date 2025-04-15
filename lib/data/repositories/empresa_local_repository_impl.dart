import 'package:projeto_estagio_vendas/core/constants/db_constants.dart';
import 'package:projeto_estagio_vendas/core/resources/base_local_data_source.dart';
import 'package:projeto_estagio_vendas/data/datasource/app_database.dart';
import 'package:projeto_estagio_vendas/data/model/empresa_data_base_model.dart';
import 'package:projeto_estagio_vendas/domain/repositories/empresa_local_repository.dart';

class EmpresaLocalRepositoryImpl extends BaseLocalDataSource<EmpresaDatabaseModel> implements EmpresaLocalRepository{
  EmpresaLocalRepositoryImpl(ApplicationDatabase applicationDatabase)
      : super(
        applicationDatabase,
        TableName.tabelaEmpresa,
        EmpresaDatabaseModel.fromMap
  );
  @override
  Future<void> calculeteFaturamento() async => rawQuery(
    '''
     SELECT nome_empresa, cnpj_empresa, SUM(faturamento_empresa) faturamento_empresa FROM TABELA_EMPRESA GROUP BY cnpj_empresa
    ''',
  );

  @override
  Future<void> createEmpresa(EmpresaDatabaseModel empresaDataBaseModel) async => insert(empresaDataBaseModel);

  @override
  Future<List<EmpresaDatabaseModel>> findEmpresa() async => findAll();

  @override
  Future<void> save(EmpresaDatabaseModel empresaDataBaseModel) async => insert(empresaDataBaseModel);

  @override
  Future<EmpresaDatabaseModel?> findFaturamento() async {
    final List<Map<String, dynamic>> result = await rawQuery(
      '''
     SELECT nome_empresa, cnpj_empresa, SUM(faturamento_empresa) faturamento_empresa FROM TABELA_EMPRESA GROUP BY cnpj_empresa
    ''',
    );
    if(result.isEmpty){
      return null;
    }
    return EmpresaDatabaseModel.fromMap(result.first);
  }
}