import 'package:flutter/material.dart';

enum StatusEnum {
  recebeu(
      stringValue: "Coordenador recebeu a caixa da transportadora",
      stringEnum: "recebeu",
      colorEnum: Color(0xffA6F5CA)),
  abriu(
      stringValue: "Coordenador abriu a caixa para leitura dos pacotes",
      stringEnum: "abriu",
      colorEnum: Color(0xffAEF3FE)),
  leu(
      stringValue: "Coordenador leu todos os pacotes desta caixa",
      stringEnum: "leu",
      colorEnum: Color(0xff3656FF)),
  devolveu(
      stringValue: "Coordenador devolveu a caixa à transportadora",
      stringEnum: "devolveu",
      colorEnum: Color(0xff0CB560));

  const StatusEnum(
      {required this.stringValue,
      required this.stringEnum,
      required this.colorEnum});
  final String stringValue;
  final String stringEnum;
  final Color colorEnum;
}
