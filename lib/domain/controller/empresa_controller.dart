import 'package:projeto_estagio_vendas/data/model/empresa_data_base_model.dart';
import 'package:projeto_estagio_vendas/domain/repositories/empresa_local_repository.dart';

class EmpresaController {
  final EmpresaLocalRepository _empresaLocalRepository;

  EmpresaController(this._empresaLocalRepository);

  Future<void> criarEmpresa(EmpresaDatabaseModel empresaDataBaseModel) async =>
      _empresaLocalRepository.createEmpresa(empresaDataBaseModel);

  Future<List<EmpresaDatabaseModel>> procurarEmpresa() async =>
      _empresaLocalRepository.findEmpresa();

  Future<void> salvarEmpresa(EmpresaDatabaseModel empresaDataBaseModel) async =>
      _empresaLocalRepository.save(empresaDataBaseModel);

  Future<void> calcularFaturamento() async =>
      _empresaLocalRepository.calculeteFaturamento();

  Future<EmpresaDatabaseModel?> procurarFaturamento() async =>
      _empresaLocalRepository.findFaturamento();
}
