import 'package:bloc/bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/listar_venda/lista_venda_event.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/listar_venda/lista_venda_state.dart';
import '../../../domain/controller/lista_venda_controller.dart';
import '../../../domain/controller/produto_venda_controller.dart';

class ListaVendaBloc extends Bloc<ListaVendaEvent, ListaVendaState>{
  final ListaVendaController listaVendaController;
  final ProdutoVendaController produtoVendaController;

  ListaVendaBloc(this.listaVendaController, this.produtoVendaController) : super(ListaVendaInitialState()){
    on<ListaVendaLoadEvent>(_onListaVendaLoad);
  }

  Future<void> _onListaVendaLoad(ListaVendaLoadEvent event, Emitter<ListaVendaState> emit) async{
    try{
      final produto = await produtoVendaController.procurarProdutoVenda();
      final venda = await listaVendaController.procurarVenda();
      emit(ListaVendaSucessState(venda, produto));
    }catch(e){
      emit(ListaVendaErrorState(error: '${e}'));
    }
  }
}