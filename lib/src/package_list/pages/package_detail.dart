import 'package:caed_desafio_tecnico/core/models/package_model.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../core/helpers/data_helper.dart';
import '../components/container_dados.dart';

class PackageDetail extends StatefulWidget {
  const PackageDetail({super.key});

  @override
  State<PackageDetail> createState() => _PackageDetailState();
}

class _PackageDetailState extends State<PackageDetail> {
  final int _selectedIndex = 0;
  List<String> menu = ["Início", "Opções", "Tutoriais"];
  List<IconData> menuIcons = [Icons.home, Icons.settings, Icons.info];

  late final ListaPacotesRecebidos args;
  @override
  void initState() {
    args = Modular.args.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const PreferredSize(
            preferredSize: Size(1, 1),
            child: DottedLine(
              dashColor: Color(0xff9747FF),
            )),
        title: Text(
          "Pacote ${args.codigo}",
          style: GoogleFonts.openSans(
            fontSize: 20,
            color: const Color(0xff191C1D),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: (v) => v == 0 ? Modular.to.pop() : null,
          selectedItemColor: Colors.black,
          elevation: 0,
          currentIndex: _selectedIndex,
          items: [
            ...menu.map((menuItem) => BottomNavigationBarItem(
                icon: Container(
                    width: MediaQuery.of(context).size.width * 0.18,
                    decoration: BoxDecoration(
                      color: _selectedIndex == menu.indexOf(menuItem)
                          ? const Color.fromARGB(255, 176, 209, 235)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Icon(menuIcons.elementAt(menu.indexOf(menuItem)))),
                label: menuItem))
          ]),
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              const TabBar(
                indicatorColor: Colors.black,
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: "Status",
                  ),
                  Tab(
                    text: "Dados",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  _firstTab(),
                  _secondTab(),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _secondTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22.3),
            child: Text(
              "Dados do pacote",
              style: GoogleFonts.openSans(
                fontSize: 16,
                color: const Color(0xff191C1D),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ContainerDados(title: "CÓDIGO", value: args.codigo!),
          ContainerDados(
              title: "PONTO DE ENTREGA", value: args.pontoDeEntrega!),
          ContainerDados(title: "MUNICÍPIO", value: args.municipio!),
          ContainerDados(title: "ESCOLA", value: args.escola!),
          ContainerDados(
              title: "ANO ESCOLAR/ETAPA", value: args.anoEscolarEtapa!),
          ContainerDados(
              title: "COMPONENTE CURRICULAR",
              value: args.componenteCurricular!),
        ],
      ),
    );
  }

  Widget _firstTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22.3),
            child: Text(
              "Status do pacote",
              style: GoogleFonts.openSans(
                fontSize: 16,
                color: const Color(0xff191C1D),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xffF0F0F0),
              borderRadius: BorderRadius.circular(24),
            ),
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: args.status!.length,
                itemBuilder: (_, j) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: TimelineTile(
                      lineXY: 0.4,
                      alignment: TimelineAlign.manual,
                      indicatorStyle: IndicatorStyle(
                          color: args.status![j].status!.colorEnum,
                          width: MediaQuery.of(context).size.width * 0.05),
                      endChild: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              args.status![j].status!.stringValue,
                              textAlign: TextAlign.left,
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      startChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DataHelper.dateToDMA(
                                date: args.status![j].diaHora!),
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            DataHelper.dateToHourMin(
                                date: args.status![j].diaHora!),
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: const Color(0xff828282),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
