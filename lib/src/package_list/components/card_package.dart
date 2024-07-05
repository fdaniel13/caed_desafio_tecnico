import 'package:caed_desafio_tecnico/core/enums/package_type_enum.dart';
import 'package:caed_desafio_tecnico/core/models/package_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPackage extends StatelessWidget {
  final PackageTypeEnum packageTypeEnum;
  final PackageResponse packageResponse;
  const CardPackage(
      {super.key,
      required this.packageTypeEnum,
      required this.packageResponse});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xffF0F0F0),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${titleCard()} de pacotes",
            style: GoogleFonts.openSans(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(child: Container()),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: this.packageTypeEnum == PackageTypeEnum.receber
                      ? const Color(0xffAEF3FE)
                      : Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: percentagemCard(context),
                height: 40,
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffCCCCCC),
                  borderRadius: BorderRadius.circular(8),
                ),
                height: 40,
                width: percentagemCardMissing(context),
              ),
            ],
          ),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    color: this.packageTypeEnum == PackageTypeEnum.receber
                        ? const Color(0xffAEF3FE)
                        : Colors.blue,
                    width: 10,
                    height: 10,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        this.packageTypeEnum.stringValue,
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${numberPackages()} pacotes",
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: const Color(0xff828282),
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Text(
                "${percentagemPackages()}%",
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  color: const Color(0xff828282),
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    color: const Color(0xffCCCCCC),
                    width: 10,
                    height: 10,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Faltantes",
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${numberPackagesMissing()} pacotes",
                        style: GoogleFonts.openSans(
                          fontSize: 16,
                          color: const Color(0xff828282),
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Text(
                "${percentagemPackagesMissing()}%",
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  color: const Color(0xff828282),
                  fontWeight: FontWeight.w800,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  double percentagemCard(BuildContext context) {
    double aux = this.packageTypeEnum == PackageTypeEnum.receber
        ? ((MediaQuery.of(context).size.width * 0.69) *
                this.packageResponse.pacotesRecebidosPercentagem!) /
            100
        : ((MediaQuery.of(context).size.width * 0.69) *
                this.packageResponse.pacotesDevolvidosPercentagem!) /
            100;
    return aux;
  }

  double percentagemCardMissing(BuildContext context) {
    double aux = this.packageTypeEnum == PackageTypeEnum.receber
        ? ((MediaQuery.of(context).size.width * 0.69) *
                this.packageResponse.pacotesParaReceberPercentagem!) /
            100
        : ((MediaQuery.of(context).size.width * 0.69) *
                this.packageResponse.pacotesParaDevolverPercentagem!) /
            100;
    return aux;
  }

  double percentagemPackages() {
    double aux = this.packageTypeEnum == PackageTypeEnum.receber
        ? this.packageResponse.pacotesRecebidosPercentagem!
        : this.packageResponse.pacotesDevolvidosPercentagem!;
    return aux;
  }

  double percentagemPackagesMissing() {
    double aux = this.packageTypeEnum == PackageTypeEnum.receber
        ? this.packageResponse.pacotesParaReceberPercentagem!
        : this.packageResponse.pacotesParaDevolverPercentagem!;
    return aux;
  }

  String titleCard() {
    return this.packageTypeEnum == PackageTypeEnum.receber
        ? "Recebimento"
        : "Devolução";
  }

  int? numberPackages() {
    return this.packageTypeEnum == PackageTypeEnum.receber
        ? this.packageResponse.pacotesRecebidos
        : this.packageResponse.pacotesDevolvidos;
  }

  int? numberPackagesMissing() {
    return this.packageTypeEnum == PackageTypeEnum.receber
        ? this.packageResponse.pacotesParaReceber
        : this.packageResponse.pacotesParaDevolver;
  }
}
