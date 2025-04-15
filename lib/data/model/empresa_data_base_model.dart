import 'package:projeto_estagio_vendas/core/resources/base_model.dart';

class EmpresaDatabaseModel extends BaseModel{

  String? nomeEmpresa;
  String? cnpjEmpresa;
  double? faturamentoEmpresa;

  EmpresaDatabaseModel({
    this.nomeEmpresa,
    this.cnpjEmpresa,
    this.faturamentoEmpresa
  });

  EmpresaDatabaseModel.fromMap(Map<String, dynamic> json){
    nomeEmpresa = json['nome_empresa'];
    cnpjEmpresa = json['cnpj_empresa'];
    faturamentoEmpresa = json['faturamento_empresa'];
  }

  Map<String, dynamic> toMap(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome_empresa'] = nomeEmpresa;
    data['cnpj_empresa'] = cnpjEmpresa;
    data['faturamento_empresa'] = faturamentoEmpresa;

    return data;
  }
  @override
  String toString() {
    return 'Nome: $nomeEmpresa, Faturamento: $faturamentoEmpresa, CNPJ: $cnpjEmpresa';
  }
}