import 'package:flutter/material.dart';
import 'package:job_timer/app/entities/project_status.dart';

class HeaderProjectMenu extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        return Container(
          padding: const EdgeInsets.all(16),
          color: Colors.white,
          height: constraints.maxHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: constraints.maxWidth * .5,
                child: DropdownButtonFormField<ProjectStatus>(
                  items: ProjectStatus.values
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.label),
                          ))
                      .toList(),
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      isCollapsed: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100))),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * .4,
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    label: Text('Novo Projeto')),
              )
            ],
          ),
        );
      }),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
