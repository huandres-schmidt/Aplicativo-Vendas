import 'package:projeto_estagio_vendas/data/model/venda_database_model.dart';

abstract class VendaDatabaseLocalRepository{
  Future<int> save(VendaDatabaseModel listaVendaModel);
}