import 'package:bloc/bloc.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/cadastrar_cliente/cadastrar_cliente_events.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/cadastrar_cliente/cadastrar_cliente_state.dart';
import '../../../data/model/cliente_model.dart';
import '../../../domain/controller/cliente_controller.dart';

class CadastrarClienteBloc extends Bloc<CadastrarClienteEvent, CadastrarClienteState> {
  final ClienteController clienteController;

  CadastrarClienteBloc(this.clienteController) : super(ClienteInitialState()) {

    on<ClienteValidarEvent>(_onClienteValidarEvent);

    on<ClienteAddEvent>(_onClienteAddEvent);
  }

  Future<void> _onClienteValidarEvent(ClienteValidarEvent event,  Emitter<CadastrarClienteState> emit) async {
    bool verificacoes = true;

    if(event.nome == null || event.nome!.isEmpty){
      emit(ClienteErrorState(erro: 'Nome do Cliente é Obrigatório'));
      verificacoes = false;
    }
    if(event.cnpj == null || event.cnpj!.isEmpty){
      emit(ClienteErrorState(erro: 'CNPJ do Cliente é Obrigatório'));
      verificacoes = false;
    }
    if(event.limiteCredito == null || event.limiteCredito! <= 0) {
      emit(ClienteErrorState(erro: 'Limite de Crédito Inválido'));
      verificacoes = false;
    }
    if(verificacoes){
      final cliente = ClienteModel(nome: event.nome, cnpj: event.cnpj, limiteCredito: event.limiteCredito);
      add(ClienteAddEvent(cliente: cliente));
    }
  }

  Future<void> _onClienteAddEvent(ClienteAddEvent event, Emitter<CadastrarClienteState> emit) async {
    try{
      await clienteController.salvarCliente(event.cliente);
      emit(ClienteSucessState());
    }catch(e){
      emit(ClienteErrorState(erro: '${e}'));
    }
  }
}
