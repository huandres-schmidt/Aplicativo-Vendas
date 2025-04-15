import 'package:bloc/bloc.dart';
import 'package:projeto_estagio_vendas/data/model/produto_model.dart';
import 'package:projeto_estagio_vendas/domain/controller/tabela_produto_controller.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_produto/tabela_produto_event.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_produto/tabela_produto_state.dart';


class TabelaProdutoBloc extends Bloc<TabelaProdutoEvent, TabelaProdutoState> {
  final TabelaProdutoController tabelaProdutoController;

  TabelaProdutoBloc(this.tabelaProdutoController)
      : super(TabelaProdutoInitialState()) {
    on<TabelaProdutoLoadEvent>(_onTabelaProdutoLoadEvent);

    on<TabelaProdutoEditEvent>(_onTabelaProdutoEditEvent);

    on<TabelaProdutoRemoveEvent>(_onTabelaProdutoRemoveEvent);

    on<TabelaProdutoValidarEvent>(_onTabelaProdutoValidarEvent);
  }

  Future<void> _onTabelaProdutoLoadEvent(
      TabelaProdutoLoadEvent event, Emitter<TabelaProdutoState> emit) async {
    try {
      final produtos = await tabelaProdutoController.procurarProdutos();
      emit(TabelaProdutoSucessState(produtos));
    } catch (e) {
      emit(TabelaProdutoErrorState(error: '${e}'));
    }
  }

  Future<void> _onTabelaProdutoEditEvent(
      TabelaProdutoEditEvent event, Emitter<TabelaProdutoState> emit) async {
    try {
      await tabelaProdutoController.editarProduto(
          event.produto.cdProduto!,
          event.produto.tipoProduto!,
          event.produto.nome!,
          event.produto.pesoEmbalagem!,
          event.produto.vlrPeso!,
          event.produto.estoque!);
      final produto = await tabelaProdutoController.procurarProdutos();
      emit(TabelaProdutoSucessState(produto));
    } catch (e) {
      emit(TabelaProdutoErrorState(error: '${e}'));
    }
  }

  Future<void> _onTabelaProdutoRemoveEvent(
      TabelaProdutoRemoveEvent event, Emitter<TabelaProdutoState> emit) async {
    try {
      await tabelaProdutoController.deletarProduto(event.produto.cdProduto!);
      final produto = await tabelaProdutoController.procurarProdutos();
      emit(TabelaProdutoSucessState(produto));
    } catch (e) {
      emit(TabelaProdutoErrorState(error: '${e}'));
    }
  }

  Future<void> _onTabelaProdutoValidarEvent(
      TabelaProdutoValidarEvent event, Emitter<TabelaProdutoState> emit) async {
    bool verificacoes = true;

    if (event.nome == null || event.nome!.isEmpty) {
      emit(TabelaProdutoErrorState(error: 'Nome do Produto Obrigatório'));
      verificacoes = false;
    }
    if (event.peso == null || event.peso! <= 0) {
      emit(TabelaProdutoErrorState(error: 'Peso do Produto Obrigatório'));
      verificacoes = false;
    }
    if (event.vlrPeso == null || event.vlrPeso! <= 0) {
      emit(TabelaProdutoErrorState(error: 'Valor do Produto Obrigatório'));
      verificacoes = false;
    }
    if (event.estoque == null || event.estoque! <= 0) {
      emit(TabelaProdutoErrorState(error: 'Estoque do Produto Obrigatório'));
      verificacoes = false;
    }
    if (event.tipo == null || event.tipo!.isEmpty) {
      emit(TabelaProdutoErrorState(error: 'Tipo do Produto Obrigatório'));
      verificacoes = false;
    }
    if (verificacoes) {
      final produto = ProdutoModel(
          nome: event.nome,
          pesoEmbalagem: event.peso,
          cdProduto: event.codigo,
          vlrPeso: event.vlrPeso,
          estoque: event.estoque,
          tipoProduto: event.tipo);
      add(TabelaProdutoEditEvent(produto: produto));
    }
  }
}
