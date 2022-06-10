import 'package:flutter/material.dart';
import 'package:job_timer/app/modules/home/widget/header_project_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:
          const Drawer(child: SafeArea(child: ListTile(title: Text('Sair')))),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              title: Text('Projetos'),
              expandedHeight: 118,
              toolbarHeight: 100,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(16))),
            ),
            SliverPersistentHeader(
              delegate: HeaderProjectMenu(),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  color: Colors.blue,
                  height: 200,
                ),
                Container(
                  color: Colors.blue,
                  height: 200,
                ),
                Container(
                  color: Colors.blue,
                  height: 200,
                ),
                Container(
                  color: Colors.blue,
                  height: 200,
                ),
                Container(
                  color: Colors.blue,
                  height: 200,
                ),
                Container(
                  color: Colors.blue,
                  height: 200,
                ),
                Container(
                  color: Colors.blue,
                  height: 200,
                ),
                Container(
                  color: Colors.blue,
                  height: 200,
                ),
                Container(
                  color: Colors.blue,
                  height: 200,
                  child: Text("FIM"),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
