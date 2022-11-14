import 'package:connect_bus/src/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

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
    return 'Passageiro{id: $id, login: $login, senha: $password}';
  }
}

// WidgetsFlutterBinding.ensureInitialized();

// final database = openDatabase(
//   join(await getDatabasesPath(), 'connectbus_database.db'),
//     onCreate: (db, version) {
//         return db.execute(
//           'CREATE TABLE passengers(id INTEGER PRIMARY KEY, login TEXT, password TEXT)',
//         );
//     },
//     // Define a versão. Isso executa a função onCreate e fornece um
//     // caminho para realizar upgrades e downgrades do banco de dados.
//     version: 1,
// );

// Define uma função que insere passageiros no banco de dados
Future<void> insertPassenger(Passenger passenger) async {
  // Obtém uma referência ao banco de dados
  //final db = await database;

  // Insere o Passageiro na tabela correta. Você também pode especificar o
  // `conflictAlgorithm` para usar caso o mesmo passageiro seja inserido duas vezes.
  //
  // Neste caso, substitua quaisquer dados anteriores.
  // await db.insert(
  //   'passengers',
  //   passenger.toMap(),
  //   conflictAlgorithm: ConflictAlgorithm.replace,
  // );
}

// #docregion Login, Login-build
class Login extends StatelessWidget {
  const Login({super.key});

  // #docregion Login-build
  @override
  Widget build(BuildContext context) {
    // #docregion textCreateAccountColumn
    Widget textCreateAccountColumn = Builder(
      builder: ((context) {
        return GestureDetector(
          onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: ((context) => const HomePage()));
          },
          child: const SizedBox(
            height: 52,
            child: Center(
              child: Text(
                'CRIAR CONTA',
              ),
            ),
          ),
        );
      }),
    );

    // #enddocregion textCreateAccountColumn

    return MaterialApp(
      title: 'Login',
      theme: ThemeData(fontFamily: 'Comfortaa'),
      home: Scaffold(
        body: Column(
          children: [
            const Header(Alignment.centerLeft, 'Login'),
            const LoginForm(),
            const Button(
                'LOG IN', Colors.white, 355, Colors.black, Colors.black),
            textCreateAccountColumn,
          ],
        ),
      ),
    );
  }

  // #docregion Login-build
}

// #docregion LoginForm
class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}
// #enddocregion LoginForm

// #docregion _LoginFormState, _LoginFormState-fields, _LoginFormState-build
class _LoginFormState extends State<LoginForm> {
  // #docregion _LoginFormState-fields
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  // #enddocregion _LoginFormState-fields

  // #docregion _LoginFormState-build
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'jane@example.com',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.7,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.7,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor informe o login';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: '••••••••••••',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.7,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.7,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor informe a senha';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  // #enddocregion _LoginFormState-build
}
