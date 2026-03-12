class AddressEntity {
  final String cep;
  final String logadouro;
  final String bairro;
  final String uf;
  final String estado;
  final String localidade;

  AddressEntity({
    required this.cep,
    required this.logadouro,
    required this.bairro,
    required this.uf,
    required this.estado,
    required this.localidade,
  });
}
