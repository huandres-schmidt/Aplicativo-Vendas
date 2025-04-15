import 'package:bloc/bloc.dart';
import 'package:projeto_estagio_vendas/domain/controller/tabela_cliente_controller.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/selecionar_cliente/selecionar_cliente_event.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/selecionar_cliente/selecionar_cliente_state.dart';

class SelecionarClienteBloc
    extends Bloc<SelecionarClienteEvent, SelecionarClienteState> {
  final TabelaClienteController tabelaClienteController;

  SelecionarClienteBloc(this.tabelaClienteController)
      : super(SelecionarClienteInitialState()) {

    on<SelecionarClienteLoadEvent>(_onCarregarListaCliente);
  }

  Future<void> _onCarregarListaCliente(SelecionarClienteLoadEvent event,
      Emitter<SelecionarClienteState> emit) async {
    try{
      final listacliente = await tabelaClienteController.procurarClientes();
      emit(SelecionarClienteSucessState(listacliente));
    }catch(e){
      emit(SelecionarClienteErrorState(erro: '${e}'));
    }
  }
}
