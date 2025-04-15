import 'package:bloc/bloc.dart';
import 'package:projeto_estagio_vendas/data/model/empresa_data_base_model.dart';
import '../../../domain/controller/empresa_controller.dart';
import 'empresa_events.dart';
import 'empresa_state.dart''';

class EmpresaBloc extends Bloc<EmpresaEvent, EmpresaState> {
  final EmpresaController empresaController;

  EmpresaBloc(this.empresaController) : super(EmpresaInitialState()) {
    on<EmpresaLoadEvent>(_onEmpresaLoadEvent);

    on<EmpresaAddEvent>(_onEmpresaAddEvent);
  }

  Future<void> _onEmpresaLoadEvent(EmpresaLoadEvent event, Emitter<EmpresaState> emit) async {
    try{
      final EmpresaDatabaseModel? result = await empresaController.procurarFaturamento();
      emit(EmpresaSucessState(empresa: result));
    }catch(e){
      emit(EmpresaErrorState(error: '$e'));
    }
  }

  Future<void> _onEmpresaAddEvent(
      EmpresaAddEvent event, Emitter<EmpresaState> emit) async {
    try {
      EmpresaDatabaseModel empresaDataBaseModel = EmpresaDatabaseModel(
        cnpjEmpresa: event.empresaDataBase!.cnpjEmpresa,
        nomeEmpresa: event.empresaDataBase!.nomeEmpresa,
        faturamentoEmpresa:  event.empresaDataBase!.faturamentoEmpresa,
      );
      await empresaController.salvarEmpresa(empresaDataBaseModel);
      final empresaInicial = await empresaController.procurarEmpresa();
      emit(EmpresaSucessState(empresa: empresaInicial.first));
    } catch (e) {
      emit(EmpresaErrorState(error: '${e}'));
    }
  }
}
