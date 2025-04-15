import 'package:projeto_estagio_vendas/data/model/venda_database_model.dart';

abstract class ListaVendaLocalRepository{
  Future<List<VendaDatabaseModel>> findAllVenda();
}