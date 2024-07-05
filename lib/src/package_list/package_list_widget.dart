import 'package:caed_desafio_tecnico/core/enums/package_type_enum.dart';
import 'package:caed_desafio_tecnico/src/package_list/package_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../core/helpers/data_helper.dart';
import 'components/card_package.dart';
import 'components/container_dados.dart';

class PackageListWidget extends StatefulWidget {
  const PackageListWidget({super.key});

  @override
  State<PackageListWidget> createState() => _PackageListWidgetState();
}

class _PackageListWidgetState extends State<PackageListWidget> {
  final int _selectedIndex = 0;
  List<String> menu = ["Início", "Opções", "Tutoriais"];
  List<IconData> menuIcons = [Icons.home, Icons.settings, Icons.info];
  final controller = Modular.get<PackageListController>();
  late Future _data;
  @override
  void initState() {
    _data = controller.getPackages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            controller.clearAcessKey();

            Modular.to.navigate('/auth');
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "Listagem de Pacotes",
          style: GoogleFonts.openSans(
            fontSize: 20,
            color: const Color(0xff191C1D),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      body: FutureBuilder(
          future: _data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    children: [
                      CardPackage(
                          packageTypeEnum: PackageTypeEnum.receber,
                          packageResponse: controller.packageResponse!),
                      const SizedBox(
                        width: 16,
                      ),
                      CardPackage(
                        packageTypeEnum: PackageTypeEnum.devolver,
                        packageResponse: controller.packageResponse!,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          const TabBar(
                            indicatorColor: Colors.black,
                            labelColor: Colors.black,
                            tabs: [
                              Tab(
                                text: "Pacotes",
                              ),
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
                              _thirdTab()
                            ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  Widget _thirdTab() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22.3),
            child: Text(
              "Dados da caixa",
              style: GoogleFonts.openSans(
                fontSize: 16,
                color: const Color(0xff191C1D),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ContainerDados(
              title: "CÓDIGO",
              value: controller
                  .packageResponse!.dadosUltimoPacoteRecebido!.codigo!),
          ContainerDados(
              title: "PONTO DE ENTREGA",
              value: controller
                  .packageResponse!.dadosUltimoPacoteRecebido!.pontoDeEntrega!),
          ContainerDados(
              title: "MUNICÍPIO",
              value: controller
                  .packageResponse!.dadosUltimoPacoteRecebido!.municipio!),
          ContainerDados(
              title: "ESCOLA",
              value: controller
                  .packageResponse!.dadosUltimoPacoteRecebido!.escola!),
          ContainerDados(
              title: "ANO ESCOLAR/ETAPA",
              value: controller.packageResponse!.dadosUltimoPacoteRecebido!
                  .anoEscolarEtapa!),
          ContainerDados(
              title: "COMPONENTE CURRICULAR",
              value: controller.packageResponse!.dadosUltimoPacoteRecebido!
                  .componenteCurricular!),
        ],
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
              "Status da caixa",
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
                itemCount: controller
                    .packageResponse!.dadosUltimoPacoteRecebido!.status!.length,
                itemBuilder: (_, j) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: TimelineTile(
                      lineXY: 0.4,
                      alignment: TimelineAlign.manual,
                      indicatorStyle: IndicatorStyle(
                          color: controller
                              .packageResponse!
                              .dadosUltimoPacoteRecebido!
                              .status![j]
                              .status!
                              .colorEnum,
                          width: MediaQuery.of(context).size.width * 0.05),
                      endChild: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller
                                  .packageResponse!
                                  .dadosUltimoPacoteRecebido!
                                  .status![j]
                                  .status!
                                  .stringValue,
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
                                date: controller
                                    .packageResponse!
                                    .dadosUltimoPacoteRecebido!
                                    .status![j]
                                    .diaHora!),
                            style: GoogleFonts.openSans(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            DataHelper.dateToHourMin(
                                date: controller
                                    .packageResponse!
                                    .dadosUltimoPacoteRecebido!
                                    .status![j]
                                    .diaHora!),
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

  Widget _firstTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 22.3),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.filter_list),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Lista de Pacotes",
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                        color: const Color(0xff191C1D),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (_, i) {
                return ListTile(
                  title: Text(
                    controller
                        .packageResponse!.listaPacotesRecebidos![i].codigo!,
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: InkWell(
                      child: const Icon(Icons.navigate_next),
                      onTap: () => Modular.to.pushNamed("detail",
                          arguments: controller
                              .packageResponse!.listaPacotesRecebidos![i])),
                  subtitle: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffAEF3FE),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: 6,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Container(
                          decoration: BoxDecoration(
                            color:  Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          height: 7,
                          width: MediaQuery.of(context).size.width * 0.15),
                    ],
                  ),
                );
              },
              separatorBuilder: (_, i) {
                return const Divider();
              },
              itemCount:
                  controller.packageResponse!.listaPacotesRecebidos!.length)
        ],
      ),
    );
  }
}
