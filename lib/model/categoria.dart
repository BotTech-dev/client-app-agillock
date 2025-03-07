class Categoria {
  String nome;
  String codigo;

  Categoria(this.nome, this.codigo);

  static List<Categoria> getMarcaFipe(){
    final categorias = <Categoria>[];
    categorias.add(Categoria('1', 'Carro'));
    categorias.add(Categoria('2', 'Caminhao / Onibus'));
    categorias.add(Categoria('1', 'Moto'));
    return categorias;
  }
}