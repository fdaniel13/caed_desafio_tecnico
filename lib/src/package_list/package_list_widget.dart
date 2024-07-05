import 'dart:convert';

import 'package:caed_desafio_tecnico/core/enums/package_type_enum.dart';
import 'package:caed_desafio_tecnico/core/models/package_model.dart';
import 'package:caed_desafio_tecnico/core/package_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/card_package.dart';

class PackageListWidget extends StatefulWidget {
  const PackageListWidget({super.key});

  @override
  State<PackageListWidget> createState() => _PackageListWidgetState();
}

class _PackageListWidgetState extends State<PackageListWidget>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  List<String> menu = ["Início", "Opções", "Tutoriais"];
  List<IconData> menuIcons = [Icons.home, Icons.settings, Icons.info];
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, initialIndex: 0, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back),
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
          selectedIconTheme: IconThemeData(),
          currentIndex: _selectedIndex,
          items: [
            ...menu.map((menuItem) => BottomNavigationBarItem(
                icon: Container(
                    width: MediaQuery.of(context).size.width * 0.18,
                    decoration: BoxDecoration(
                      color: _selectedIndex == menu.indexOf(menuItem)
                          ? Color.fromARGB(255, 176, 209, 235)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Icon(menuIcons.elementAt(menu.indexOf(menuItem)))),
                label: menuItem))
          ]),
      body: Column(
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
                  packageResponse:
                      PackageResponse.fromJson(jsonDecode(packageMock)),
                ),
                const SizedBox(
                  width: 16,
                ),
                CardPackage(
                  packageTypeEnum: PackageTypeEnum.devolver,
                  packageResponse:
                      PackageResponse.fromJson(jsonDecode(packageMock)),
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
                      child: TabBarView(
                          children: [_firstTab(), _secondTab(), _thirdTab()]),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _thirdTab() {
    return SingleChildScrollView(
      child: Container(
        child: Text("User Body"),
      ),
    );
  }

  Widget _secondTab() {
    return SingleChildScrollView(
      child: Container(
        child: Text("Articles Body"),
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
                  title: Text(PackageResponse.fromJson(jsonDecode(packageMock))
                      .listaPacotesRecebidos![i]
                      .codigo!),
                  trailing: Icon(Icons.navigate_next),
                  subtitle: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
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
                            color: const Color(0xffCCCCCC),
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
              itemCount: PackageResponse.fromJson(jsonDecode(packageMock))
                  .listaPacotesRecebidos!
                  .length)
        ],
      ),
    );
  }
}
