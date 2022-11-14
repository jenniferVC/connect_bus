class Passenger {
  final int id;
  final String login;
  final String password;

  const Passenger({
    required this.id,
    required this.login,
    required this.password,
  });

  // Converte um passageiro em um mapa. As chaves devem corresponder aos nomes dos
  // colunas no banco de dados.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'login': login,
      'password': password,
    };
  }

  // Implemente toString para facilitar a visualização de informações sobre
  // cada passageiro ao usar a instrução print.
  @override
  String toString() {
    return 'Dog{id: $id, login: $login, password: $password}';
  }
}
