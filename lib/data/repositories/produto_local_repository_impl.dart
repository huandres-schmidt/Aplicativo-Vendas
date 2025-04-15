import 'package:projeto_estagio_vendas/core/constants/db_constants.dart';
import 'package:projeto_estagio_vendas/core/resources/base_local_data_source.dart';
import 'package:projeto_estagio_vendas/data/datasource/app_database.dart';
import 'package:projeto_estagio_vendas/data/model/produto_model.dart';
import 'package:projeto_estagio_vendas/domain/repositories/produto_local_repository.dart';

class ProdutoLocalRepositoryImpl extends BaseLocalDataSource<ProdutoModel>
    implements ProdutoLocalRepository {

  ProdutoLocalRepositoryImpl(ApplicationDatabase applicationDatabase)
     : super(
        applicationDatabase,
        TableName.tabelaProduto,
        ProdutoModel.fromMap,
  );
  @override
  Future<void> save(ProdutoModel produtoModel) async => insert(produtoModel);
}
