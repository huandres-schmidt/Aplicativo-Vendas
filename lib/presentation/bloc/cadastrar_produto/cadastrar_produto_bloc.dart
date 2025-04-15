import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_estagio_vendas/data/model/produto_model.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/cadastrar_produto/cadastrar_produto_events.dart';
import '../../../domain/controller/produto_controller.dart';
import 'cadastrar_produto_state.dart';

class CadastrarProdutoBloc extends Bloc<CadastrarProdutoEvent, CadastrarProdutoState>{
  final ProdutoController produtoController;

  CadastrarProdutoBloc(this.produtoController) : super(ProdutoInitialState()){

    on<ProdutoValidarEvent>(_onProdutoValidarEvent);

    on<ProdutoAddEvent>(_onProdutoAddEvent);
  }

  Future<void> _onProdutoValidarEvent(ProdutoValidarEvent event, Emitter<CadastrarProdutoState> emit) async{
    bool verificacoes = true;

    if(event.escolhaProduto == null){
      emit(ProdutoErrorState(erro: 'Selecione o Tipo do Produto'));
      verificacoes = false;
    }
    if(event.nome == null || event.nome!.isEmpty){
      emit(ProdutoErrorState(erro: 'Nome do Produto é Obrigatório'));
      verificacoes = false;
    }
    if(event.cdProduto == null || event.cdProduto! <= 0){
      emit(ProdutoErrorState(erro: 'Código do Produto Inválido'));
      verificacoes = false;
    }
    if(event.pesoProduto == null || event.pesoProduto! <= 0){
      emit(ProdutoErrorState(erro: 'Peso do Produto Inválido'));
      verificacoes = false;
    }
    if(event.vlrPeso == null || event.vlrPeso! <= 0){
      emit(ProdutoErrorState(erro: 'Valor do Peso Inválido'));
      verificacoes = false;
    }
    if(event.estoque == null || event.estoque! <= 0){
      emit(ProdutoErrorState(erro: 'Quantidade do Produto Inválido'));
      verificacoes = false;
    }if(verificacoes){
      ProdutoModel produto = ProdutoModel(
        tipoProduto: event.escolhaProduto,
        nome: event.nome,
        cdProduto: event.cdProduto,
        pesoEmbalagem: event.pesoProduto,
        vlrPeso: event.vlrPeso,
        estoque: event.estoque
      );
      add(ProdutoAddEvent(produto: produto));
    }
  }

  Future<void> _onProdutoAddEvent(ProdutoAddEvent event, Emitter<CadastrarProdutoState> emit) async {
    try{
      await produtoController.salvarProduto(event.produto);
      emit(ProdutoSucessoState());
    }catch(e){
      emit(ProdutoErrorState(erro: ' ${e}'));
    }
  }
}