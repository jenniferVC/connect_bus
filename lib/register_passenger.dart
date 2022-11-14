import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class RegisterPassengerForm extends StatefulWidget {
  const RegisterPassengerForm({super.key});

  @override
  State<RegisterPassengerForm> createState() => _RegisterPassengerFormState();
}

class _RegisterPassengerFormState extends State<RegisterPassengerForm> {
  @override
  Widget build(BuildContext context) {
    Widget textRegisterSectionColumn = Container(
      alignment: Alignment.centerLeft,
      height: 170,
      width: 600,
      padding: const EdgeInsets.only(left: 20, top: 90, bottom: 30),
      child: const Text(
        'Cadastro',
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w500,
        ),
      ),
    );

    return MaterialApp(
      title: 'Cadastro',
      theme: ThemeData(fontFamily: 'Comfortaa'),
      home: Scaffold(
        body: Column(
          children: [
            textRegisterSectionColumn,
            // const LoginForm(),
            // buttonSectionColumn,
            // textCreateAccountColumn,
          ],
        ),
      ),
    );
  }
}
