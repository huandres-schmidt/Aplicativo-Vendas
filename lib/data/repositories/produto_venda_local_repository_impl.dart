import 'package:projeto_estagio_vendas/core/constants/db_constants.dart';
import 'package:projeto_estagio_vendas/core/resources/base_local_data_source.dart';
import 'package:projeto_estagio_vendas/data/datasource/app_database.dart';
import 'package:projeto_estagio_vendas/data/model/produto_venda_model.dart';
import '../../domain/repositories/produto_venda_local_repository.dart';

class ProdutoVendaLocalRepositoryImpl extends BaseLocalDataSource<ProdutoVendaModel>
    implements ProdutoVendaLocalRepository {

  ProdutoVendaLocalRepositoryImpl(ApplicationDatabase applicationDatabase)
     : super(
       applicationDatabase,
       TableName.tabelaProdutoVenda,
       ProdutoVendaModel.fromMap
  );
  @override
  Future<void> save(ProdutoVendaModel produtoVendaModel) => insert(produtoVendaModel);

  @override
  Future<List<ProdutoVendaModel>> findAllProdutoVenda() async => findAll();
}
