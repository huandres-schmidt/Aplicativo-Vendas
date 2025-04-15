import '../../core/resources/base_model.dart';

class ClienteModel extends BaseModel{
  String? nome;
  String? cnpj;
  double? limiteCredito;

  ClienteModel({
    this.nome,
    this.cnpj,
    this.limiteCredito
      });

  /// FromMap de um Map para Cliente
  /// POST e PUT
  ClienteModel.fromMap(Map<String, dynamic> json){
    nome = json['nome_cliente'];
    cnpj = json['cnpj_cliente'];
    limiteCredito = json['limite_credito'];
  }

  /// ToMap de um Cliente para um Map
  /// Usar para Salvar
  Map<String, dynamic> toMap(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome_cliente'] = nome;
    data['cnpj_cliente'] = cnpj;
    data['limite_credito'] = limiteCredito;
    return data;
  }

  void descontarLimiteCredito(double descontarLimite){
    limiteCredito = limiteCredito! - descontarLimite;
  }

  @override
  String toString(){
    return 'Cliente{nome: $nome, CNPJ: $cnpj, Limite de Crédito: $limiteCredito}';
  }
}
