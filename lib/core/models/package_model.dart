import '../enums/status_enum.dart';

class PackageResponse {
  List<ListaPacotesRecebidos>? listaPacotesRecebidos;
  ListaPacotesRecebidos? dadosUltimoPacoteRecebido;
  int? pacotesRecebidos;
  double? pacotesRecebidosPercentagem;
  int? pacotesParaReceber;
  double? pacotesParaReceberPercentagem;
  int? pacotesDevolvidos;
  double? pacotesDevolvidosPercentagem;
  int? pacotesParaDevolver;
  double? pacotesParaDevolverPercentagem;

  PackageResponse(
      {this.listaPacotesRecebidos,
      this.dadosUltimoPacoteRecebido,
      this.pacotesRecebidos,
      this.pacotesParaReceber,
      this.pacotesDevolvidos,
      this.pacotesParaDevolver});

  PackageResponse.fromJson(Map<String, dynamic> json) {
    if (json['listaPacotesRecebidos'] != null) {
      listaPacotesRecebidos = <ListaPacotesRecebidos>[];
      json['listaPacotesRecebidos'].forEach((v) {
        listaPacotesRecebidos!.add(new ListaPacotesRecebidos.fromJson(v));
      });
    }
    dadosUltimoPacoteRecebido = json['dadosUltimoPacoteRecebido'] != null
        ? new ListaPacotesRecebidos.fromJson(json['dadosUltimoPacoteRecebido'])
        : null;
    pacotesRecebidos = json['pacotesRecebidos'];
    pacotesParaReceber = json['pacotesParaReceber'];
    pacotesDevolvidos = json['pacotesDevolvidos'];
    pacotesParaDevolver = json['pacotesParaDevolver'];
    pacotesRecebidosPercentagem =
        double.parse(json['pacotesRecebidosPercentagem'].toString());
    pacotesParaReceberPercentagem =
        double.parse(json['pacotesParaReceberPercentagem'].toString());
    pacotesDevolvidosPercentagem =
        double.parse(json['pacotesDevolvidosPercentagem'].toString());
    pacotesParaDevolverPercentagem =
        double.parse(json['pacotesParaDevolverPercentagem'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listaPacotesRecebidos != null) {
      data['listaPacotesRecebidos'] =
          this.listaPacotesRecebidos!.map((v) => v.toJson()).toList();
    }
    if (this.dadosUltimoPacoteRecebido != null) {
      data['dadosUltimoPacoteRecebido'] =
          this.dadosUltimoPacoteRecebido!.toJson();
    }
    data['pacotesRecebidos'] = this.pacotesRecebidos;
    data['pacotesParaReceber'] = this.pacotesParaReceber;
    data['pacotesDevolvidos'] = this.pacotesDevolvidos;
    data['pacotesParaDevolver'] = this.pacotesParaDevolver;

    data['pacotesRecebidosPercentagem'] = this.pacotesRecebidosPercentagem;
    data['pacotesParaReceberPercentagem'] = this.pacotesParaReceberPercentagem;
    data['pacotesDevolvidosPercentagem'] = this.pacotesDevolvidosPercentagem;
    data['pacotesParaDevolverPercentagem'] =
        this.pacotesParaDevolverPercentagem;
    return data;
  }
}

class ListaPacotesRecebidos {
  String? codigo;
  String? pontoDeEntrega;
  String? municipio;
  String? escola;
  String? anoEscolarEtapa;
  String? componenteCurricular;
  List<Status>? status;

  ListaPacotesRecebidos(
      {this.codigo,
      this.pontoDeEntrega,
      this.municipio,
      this.escola,
      this.anoEscolarEtapa,
      this.componenteCurricular,
      this.status});

  ListaPacotesRecebidos.fromJson(Map<String, dynamic> json) {
    codigo = json['codigo'];
    pontoDeEntrega = json['pontoDeEntrega'];
    municipio = json['municipio'];
    escola = json['escola'];
    anoEscolarEtapa = json['anoEscolarEtapa'];
    componenteCurricular = json['componenteCurricular'];
    if (json['status'] != null) {
      status = <Status>[];
      json['status'].forEach((v) {
        status!.add(new Status.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo'] = this.codigo;
    data['pontoDeEntrega'] = this.pontoDeEntrega;
    data['municipio'] = this.municipio;
    data['escola'] = this.escola;
    data['anoEscolarEtapa'] = this.anoEscolarEtapa;
    data['componenteCurricular'] = this.componenteCurricular;
    if (this.status != null) {
      data['status'] = this.status!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Status {
  String? diaHora;
  StatusEnum? status;

  Status({this.diaHora, this.status});

  Status.fromJson(Map<String, dynamic> json) {
    diaHora = json['diaHora'];
    status = StatusEnum.values.firstWhere(
        (v) => v.stringEnum.contains(json['status'].toString().toLowerCase()));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['diaHora'] = this.diaHora;
    data['status'] = this.status?.stringEnum.toUpperCase();
    return data;
  }
}
