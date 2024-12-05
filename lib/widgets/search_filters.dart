import 'package:flutter/material.dart';
import 'package:gastro_experience/controller/search_filter_controller.dart';
import 'package:gastro_experience/models/cuisine.dart';
import 'package:gastro_experience/models/restaurant_filter.dart';
import 'package:gastro_experience/models/stamp.dart';
import 'package:gastro_experience/style.dart';
import 'package:gastro_experience/widgets/button.dart';
import 'package:gastro_experience/widgets/text.dart';

class SearchFilters extends StatefulWidget {
  final Function(RestaurantFilter filters) onSearch;
  const SearchFilters({super.key, required this.onSearch});

  @override
  State<SearchFilters> createState() => _SearchFiltersState();
}

class _SearchFiltersState extends State<SearchFilters> {
  late SearchFilterController controller;

  @override
  void initState(){
    super.initState();
    controller = SearchFilterController(onSearch: widget.onSearch);
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return Row(
          children: [
            IconButton.filled(
              icon: const Icon(Icons.filter_alt),
              onPressed: () => {},
            ),
            const SizedBox(width: 8),
            DefaultButton.s(
              onPressed: controller.clear,
              child: DefaultText.normal("Limpar filtros", color: DefaultColors.secondaryButton),
            ),
            ...List.generate(
              controller.stamps.length * 2,
              (index){
                bool isSeparator = index % 2 == 0;

                if (isSeparator) return const SizedBox(width: 8);

                int realIndex = index ~/ 2;
                Stamp stamp = controller.stamps[realIndex];
                bool isSelected = controller.stamps[realIndex] == controller.selectedStamp;

                if (isSelected){
                  return DefaultButton.p(
                    filled: isSelected,
                    onPressed: () => controller.toggleStamp(stamp),
                    child: DefaultText.normal(stamp.name, isInverted: !isSelected),
                  );
                }

                return DefaultButton.p(
                    onPressed: () => controller.toggleStamp(stamp),
                    child: DefaultText.normal(stamp.name, isInverted: true,)
                );
            }),
            const SizedBox(width: 8),
            Flexible(
              child: LayoutBuilder(
                builder: (_, constraints) {
                  final width = constraints.maxWidth * 0.5;
                  return DropdownMenu<Cuisine>(
                    hintText: "Tipo de Cozinha",
                    onSelected: controller.setCuisine,
                    width: width > 200 ? 200 : width,
                    dropdownMenuEntries: controller.cuisines.map<DropdownMenuEntry<Cuisine>>((Cuisine cuisine) {
                      return DropdownMenuEntry<Cuisine>(value: cuisine, label: cuisine.label);
                    }).toList(),
                  );
                }
              ),
            ),
          ]
        );
      }
    );
  }
}