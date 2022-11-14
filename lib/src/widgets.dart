import 'package:flutter/cupertino.dart';

// Este arquivo widgets.dart contém vários widgets auxiliares que ajudam a padronizar
// o estilo do aplicativo.
//
// Estes widgets reduzem a confusão no Layout elimando o código duplicado.

// Widget Button auxiliar que constrói um botão ao passar as características
// do botão nos parâmetros
class Button extends StatelessWidget {
  const Button(this.textButton, this.colorTextButton, this.widthButton,
      this.colorBorderButton, this.colorBackgroundButton,
      {super.key});

  final String textButton;
  final Color colorTextButton;
  final double widthButton;
  final Color colorBorderButton;
  final Color colorBackgroundButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.0,
      width: widthButton,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: colorBackgroundButton,
        border: Border.all(color: colorBorderButton, width: 2.0),
        borderRadius: const BorderRadius.all(Radius.circular(6.0)),
      ),
      child: Center(
        child: Text(
          textButton,
          style: TextStyle(
            fontSize: 13,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w900,
            color: colorTextButton,
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header(this.alignment, this.textHeader, {super.key});

  final AlignmentGeometry alignment;
  final String textHeader;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      height: 170,
      width: 600,
      padding: const EdgeInsets.only(left: 20, top: 90, bottom: 30),
      child: Text(
        textHeader,
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
    ;
  }
}
