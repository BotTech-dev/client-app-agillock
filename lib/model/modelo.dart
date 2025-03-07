class Modelo {
  String nome;
  String marcaNome;
  String Combustivel;
  String TipoVeiculo;
  String Valor;
  String AnoModelo;

  Modelo(this.nome, this.marcaNome, this.Combustivel, this.TipoVeiculo, this.Valor, this.AnoModelo);

  static List<Modelo> getModeloFipe(String codigoMarca){
    final modelos = <Modelo>[];
    return modelos;
  }


}
