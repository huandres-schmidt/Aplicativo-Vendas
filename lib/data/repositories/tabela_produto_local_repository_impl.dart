import 'package:projeto_estagio_vendas/core/constants/db_constants.dart';
import 'package:projeto_estagio_vendas/core/resources/base_local_data_source.dart';
import 'package:projeto_estagio_vendas/data/datasource/app_database.dart';
import 'package:projeto_estagio_vendas/data/model/produto_model.dart';
import 'package:projeto_estagio_vendas/domain/repositories/tabela_produto_local_repository.dart';

class TabelaProdutoLocalRepositoryImpl extends BaseLocalDataSource<ProdutoModel>
  implements TabelaProdutoLocalRepository{

  TabelaProdutoLocalRepositoryImpl(ApplicationDatabase applicationDatabase)
    : super(
      applicationDatabase,
      TableName.tabelaProduto,
      ProdutoModel.fromMap
  );
  @override
  Future<List<ProdutoModel>> findProduto() async => findAll();

  @override
  Future<int> removeProduto(int cdProduto) async =>
      rawDelete(
        '''
        DELETE FROM TABELA_PRODUTO WHERE codigo_produto = ? 
        ''', [cdProduto]
      );

  @override
  Future<void> updateProduto(int cdProduto, String tipoProduto, String nomeProduto, double pesoProduto, double valorPesoProduto, int estoqueProduto) async =>
      rawUpdate(
        '''
        UPDATE TABELA_PRODUTO
        SET tipo_produto = ?, nome_produto = ?, peso_embalagem_produto = ?, valor_peso_produto = ?, estoque_produto = ? 
        ''',
        [tipoProduto, nomeProduto, pesoProduto, valorPesoProduto, estoqueProduto]
      );

  @override
  Future<void> updateEstoque(ProdutoModel produtoModel) async => rawUpdate(
    '''
    UPDATE TABELA_PRODUTO
    SET estoque_produto = ?
    WHERE codigo_produto = ?
    ''',
    [produtoModel.estoque!, produtoModel.cdProduto]
  );
}