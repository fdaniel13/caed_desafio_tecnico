enum PackageTypeEnum {
  receber(stringValue: "Recebidos",stringEnum: "receber"),
  devolver(stringValue: "Devolvidos",stringEnum: "devolver");

  const PackageTypeEnum({required this.stringValue, required this.stringEnum});
  final String stringValue;
  final String stringEnum;
}