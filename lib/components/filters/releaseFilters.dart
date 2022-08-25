import 'package:cinegraw_app/models/movieDB/genre.dart';
import 'package:cinegraw_app/repositories/moviedbapi_repository.dart';
import 'package:flutter/material.dart';

class ReleaseFilters extends StatefulWidget {
  const ReleaseFilters({
    required this.getFilter,
    Key? key,
  }) : super(key: key);

  final void Function(String) getFilter;

  @override
  State<ReleaseFilters> createState() => _ReleaseFiltersState();
}

class _ReleaseFiltersState extends State<ReleaseFilters> {
  String _selectedRelease = "Lançamento";

  bool search = true;

  Widget menuFilter(List<String> opcoes) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 3,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(),
      ),
      child: DropdownButton<String>(
        menuMaxHeight: 250,
        value: opcoes.firstWhere((r) => r == _selectedRelease),
        isExpanded: true,
        elevation: 16,
        underline: const SizedBox(),
        icon: const SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            _selectedRelease = newValue!;
          });
          widget.getFilter(newValue!);
        },
        items: opcoes.map((String release) {
          return DropdownMenuItem<String>(
            value: release,
            child: Center(child: Text(release)),
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> releases =
        List.generate(50, (index) => (DateTime.now().year - index).toString());
    releases.insert(0, "Lançamento");
    return Expanded(
      flex: 10,
      child: menuFilter(releases),
    );
  }
}
