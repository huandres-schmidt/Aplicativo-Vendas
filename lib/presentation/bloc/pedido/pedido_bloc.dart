import 'package:bloc/bloc.dart';
import 'package:projeto_estagio_vendas/data/model/produto_venda_model.dart';
import 'package:projeto_estagio_vendas/domain/controller/produto_venda_controller.dart';
import 'package:projeto_estagio_vendas/domain/controller/tabela_produto_controller.dart';
import 'package:projeto_estagio_vendas/domain/controller/venda_controller.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/pedido/pedido_events.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/pedido/pedido_state.dart';
import '../../../data/model/empresa_data_base_model.dart';
import '../../../data/model/venda_database_model.dart';
import '../../../domain/controller/empresa_controller.dart';
import '../../../domain/controller/tabela_cliente_controller.dart';

class PedidoBloc extends Bloc<PedidoEvent, PedidoState> {
  final VendaController vendaController;
  final ProdutoVendaController produtoVendaController;
  final TabelaProdutoController tabelaProdutoController;
  final TabelaClienteController tabelaClienteController;
  final EmpresaController empresaController;

  PedidoBloc(
      this.vendaController,
      this.tabelaProdutoController,
      this.tabelaClienteController,
      this.produtoVendaController,
      this.empresaController)
      : super(PedidoInitial()) {
    on<PedidoLoadEvent>(_onPedidoLoad);

    on<PedidoAddEvent>(_onPedidoAdd);

    on<PedidoDescontoCreditoClientEvent>(_onPedidoDescontoCredito);

    on<PedidoDescontoEstoqueProdutoEvent>(_onPedidoDescontoEstoque);

    on<PedidoAddFaturamentoEvent>(_onPedidoAddFaturamento);

    on<PedidoValidarEvent>(_onPedidoValidar);
  }

  Future<void> _onPedidoLoad(
      PedidoLoadEvent event, Emitter<PedidoState> emit) async {
    try {
      final produtos = await tabelaProdutoController.procurarProdutos();
      final empresa = await empresaController.procurarEmpresa();
      emit(PedidoSucess(state.vendaDatabaseModel!, produtos, empresa.first));
    } catch (e) {
      emit(PedidoError(erro: '${e}'));
    }
  }

  void _onPedidoValidar(PedidoValidarEvent event, Emitter<PedidoState> emit) {
    if (event.valorCompra! > event.clienteModel.limiteCredito!) {
      emit(PedidoVerificError(erro: 'Saldo Insuficiente para Compra'));
    } else {
      emit(PedidoVerifSucess(state.vendaDatabaseModel!, state.produtoModel!, state.empresaDatabaseModel!));
    }
  }

  Future<void> _onPedidoDescontoCredito(
      PedidoDescontoCreditoClientEvent event, Emitter<PedidoState> emit) async {
    try {
      await tabelaClienteController.descontoCreditoCliente(event.clienteModel);
      emit(PedidoSucess(state.vendaDatabaseModel!, state.produtoModel!, state.empresaDatabaseModel!));
    } catch (e) {
      emit(PedidoError(erro: '${e}'));
    }
  }

  Future<void> _onPedidoDescontoEstoque(PedidoDescontoEstoqueProdutoEvent event,
      Emitter<PedidoState> emit) async {
    try {
      await tabelaProdutoController.descontarEstoque(event.produto);
      emit(PedidoSucess(state.vendaDatabaseModel!, state.produtoModel!,
          state.empresaDatabaseModel!));
    } catch (e) {
      emit(PedidoError(erro: '${e}'));
    }
  }

  Future<void> _onPedidoAddFaturamento(
      PedidoAddFaturamentoEvent event, Emitter<PedidoState> emit) async {
    try {
      final novaEmpresa = EmpresaDatabaseModel(
        cnpjEmpresa: event.empresaDataBase.cnpjEmpresa,
        nomeEmpresa: event.empresaDataBase.nomeEmpresa,
        faturamentoEmpresa: state.empresaDatabaseModel!.faturamentoEmpresa! +
            event.empresaDataBase.faturamentoEmpresa!,
      );
      await empresaController.salvarEmpresa(novaEmpresa);
      await empresaController.calcularFaturamento();

      emit(PedidoSucess(state.vendaDatabaseModel!, state.produtoModel!,
          state.empresaDatabaseModel!));
    } catch (e) {
      emit(PedidoError(erro: '${e}'));
    }
  }

  Future<void> _onPedidoAdd(
      PedidoAddEvent event, Emitter<PedidoState> emit) async {
    try {
      VendaDatabaseModel venda = VendaDatabaseModel(
        clienteCnpj: event.vendaDataBase.clienteCnpj,
        clienteNome: event.vendaDataBase.clienteNome,
        nroVenda: event.vendaDataBase.nroVenda,
        precoFinal: event.vendaDataBase.precoFinal,
        precoTotal: event.vendaDataBase.precoTotal,
        descontoVenda: event.vendaDataBase.descontoVenda,
      );
      int nroVenda = await vendaController.salvarVenda(venda);
      for (var produto in event.produtos) {
        ProdutoVendaModel produtoVendaModel = ProdutoVendaModel(
            nomeProdutoVenda: produto.nome,
            codigoProdutoVenda: produto.cdProduto,
            quantidadeProdutoVenda: produto.qtd,
            nroPedido: nroVenda);
        await produtoVendaController.salvarProdutoVenda(produtoVendaModel);
      }
      emit(PedidoSucess(venda, event.produtos, state.empresaDatabaseModel!));
    } catch (e) {
      emit(PedidoError(erro: '${e}'));
    }
  }
}
