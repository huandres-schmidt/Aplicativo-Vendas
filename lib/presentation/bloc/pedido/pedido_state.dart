import 'package:projeto_estagio_vendas/data/model/venda_database_model.dart';
import '../../../data/model/empresa_data_base_model.dart';
import '../../../data/model/produto_model.dart';

abstract class PedidoState {
  VendaDatabaseModel? vendaDatabaseModel;
  List<ProdutoModel>? produtoModel;
  EmpresaDatabaseModel? empresaDatabaseModel;

  PedidoState({
    required this.vendaDatabaseModel,
    required this.produtoModel,
    required this.empresaDatabaseModel
  });
}

class PedidoInitial extends PedidoState {
  PedidoInitial() : super(vendaDatabaseModel: VendaDatabaseModel(), produtoModel: [], empresaDatabaseModel: EmpresaDatabaseModel());
}

class PedidoVerifSucess extends PedidoState {
  PedidoVerifSucess(VendaDatabaseModel vendaDatabaseModel, List<ProdutoModel> produtoModel, EmpresaDatabaseModel empresaDatabaseModel) : super(vendaDatabaseModel: vendaDatabaseModel, produtoModel: produtoModel, empresaDatabaseModel: empresaDatabaseModel);
}

class PedidoVerificError extends PedidoState {
  final String erro;

  PedidoVerificError({required this.erro,}) : super(vendaDatabaseModel: VendaDatabaseModel(), produtoModel: [], empresaDatabaseModel: EmpresaDatabaseModel());
}

class PedidoSucess extends PedidoState {
  PedidoSucess(VendaDatabaseModel vendaDatabaseModel, List<ProdutoModel> produtoModel, EmpresaDatabaseModel empresaDatabaseModel) : super(vendaDatabaseModel: vendaDatabaseModel, produtoModel: produtoModel, empresaDatabaseModel: empresaDatabaseModel);
}

class PedidoError extends PedidoState {
  final String erro;

  PedidoError({required this.erro}) : super(vendaDatabaseModel: VendaDatabaseModel(), produtoModel: [], empresaDatabaseModel: EmpresaDatabaseModel());
}

