import 'package:flutter/material.dart';

import 'package:connect_bus/pages/motorista/pages/home_motorista.dart';
import 'package:connect_bus/repositories/onibus_repository.dart';

class BusStatusPage extends StatefulWidget {
  const BusStatusPage({super.key, this.codigoOnibus});
  final String? codigoOnibus;

  @override
  State<BusStatusPage> createState() => _BusStatusPage();
}

class _BusStatusPage extends State<BusStatusPage> {
  OnibusRepository onibusRepository = OnibusRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getStatusBus(),
    );
  }

  _getStatusBus() {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: OverflowBar(
            overflowAlignment: OverflowBarAlignment.center,
            overflowSpacing: 40,
            children: <Widget>[
              _getText(),
              _getButton(
                  "Ônibus quebrou", const Color(0xffE85BC0).withOpacity(0.75)),
              _getButton("Acidente", const Color(0xffFA1B1B).withOpacity(0.75)),
              _getButton("Congestionamento",
                  const Color(0xffFCB937).withOpacity(0.75)),
              const SizedBox(height: 20),
              _getButtonVoltar(),
            ],
          ),
        ),
      ),
    );
  }

  _getText() {
    return const Text(
      "O que houve?",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    );
  }

  _getButton(String texto, Color colorButton) {
    return SizedBox(
      width: 300,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          onibusRepository.updateEstadoOnibus(widget.codigoOnibus!, texto);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: colorButton,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
        child: Text(
          texto,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }

  _getButtonVoltar() {
    return SizedBox(
      width: 320,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HomeMotoristaPage()));
        },
        child: const Text(
          "Voltar",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
}
