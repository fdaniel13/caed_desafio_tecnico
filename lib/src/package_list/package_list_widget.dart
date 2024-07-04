import 'dart:convert';

import 'package:caed_desafio_tecnico/core/enums/package_type_enum.dart';
import 'package:caed_desafio_tecnico/core/models/package_model.dart';
import 'package:caed_desafio_tecnico/core/package_mock.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/card_package.dart';

class PackageListWidget extends StatefulWidget {
  const PackageListWidget({super.key});

  @override
  State<PackageListWidget> createState() => _PackageListWidgetState();
}

class _PackageListWidgetState extends State<PackageListWidget> {
  int _selectedIndex = 0;
  List<String> menu = ["Início", "Opções", "Tutoriais"];
  List<IconData> menuIcons = [Icons.home, Icons.settings, Icons.info];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView(
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
            Expanded(
              child: DefaultTabController(
                length: 3,
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
                        Container(
                          child: Text("Home Body"),
                        ),
                        Container(
                          child: Text("Articles Body"),
                        ),
                        Container(
                          child: Text("User Body"),
                        )
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
