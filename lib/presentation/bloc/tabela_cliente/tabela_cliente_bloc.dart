import 'package:bloc/bloc.dart';
import 'package:projeto_estagio_vendas/data/model/cliente_model.dart';
import 'package:projeto_estagio_vendas/domain/controller/tabela_cliente_controller.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_cliente/tabela_cliente_events.dart';
import 'package:projeto_estagio_vendas/presentation/bloc/tabela_cliente/tabela_cliente_state.dart';

class TabelaClienteBloc extends Bloc<TabelaClienteEvent, TabelaClienteState>{
  final TabelaClienteController tabelaClienteController;

  TabelaClienteBloc(this.tabelaClienteController) : super(TabelaClienteInitialState()){

    on<TabelaClienteLoadEvent>(_onTabelaClienteLoadEvent);

    on<TabelaClienteEditEvent>(_onTabelaClienteEditEvent);

    on<TabelaClienteRemoveEvent>(_onTabelaClienteRemoveEvent);

    on<TabelaClienteValidarEditEvent>(_onTabelaClienteValidaEditEvent);

  }

  Future<void> _onTabelaClienteLoadEvent(TabelaClienteLoadEvent event, Emitter<TabelaClienteState> emit) async{
    try{
      final tabelaCliente = await tabelaClienteController.procurarClientes();
      emit(TabelaClienteSucessState(tabelaCliente));
    }catch(e){
      emit(TabelaClienteErrorState(error: "Erro ao carregar tabela cliente $e"));
    }
  }

  Future<void> _onTabelaClienteRemoveEvent(TabelaClienteRemoveEvent event, Emitter<TabelaClienteState> emit) async{
    try{
      await tabelaClienteController.deletarCliente(event.cliente.cnpj!);
      final tabelaCliente = await tabelaClienteController.procurarClientes();
      emit(TabelaClienteSucessState(tabelaCliente));
    }catch (e){
      emit(TabelaClienteErrorState(error: "${e}"));
    }
  }

  Future<void> _onTabelaClienteEditEvent(TabelaClienteEditEvent event, Emitter<TabelaClienteState> emit) async{
    try{
      await tabelaClienteController.editarCliente(event.cliente.cnpj!, event.cliente.limiteCredito!, event.cliente.nome!);
      final cliente = await tabelaClienteController.procurarClientes();
      emit(TabelaClienteSucessState(cliente));
    }catch(e){
      emit(TabelaClienteErrorState(error: "${e}"));
    }
  }

  Future<void> _onTabelaClienteValidaEditEvent(TabelaClienteValidarEditEvent event, Emitter<TabelaClienteState> emit) async{
    bool verificacoes = true;

    if(event.nome!.isEmpty || event.nome == null){
      emit(TabelaClienteErrorState(error: 'Nome do Cliente é Obrigatório'));
      verificacoes = false;
    }
    if(event.limiteCredito! <= 0 || event.limiteCredito == null){;
      emit(TabelaClienteErrorState(error: 'Limite de Crédito é Obrigatório'));
      verificacoes = false;
    }
    if(verificacoes){
      final cliente = ClienteModel(nome: event.nome, limiteCredito: event.limiteCredito, cnpj: event.cnpj);
      add(TabelaClienteEditEvent(cliente: cliente));
    }
  }
}