import 'package:flutter/material.dart';

import '/core/constants/categories.dart';
import '/core/models/category_wrap_item.dart';

class FilterScreenCategoryMultiSelect extends StatefulWidget {
  const FilterScreenCategoryMultiSelect({
    Key? key,
    required this.selectedCategories,
  }) : super(key: key);

  final List<FoodCategory> selectedCategories;

  @override
  State<FilterScreenCategoryMultiSelect> createState() =>
      _FilterScreenCategoryMultiSelectState();
}

class _FilterScreenCategoryMultiSelectState
    extends State<FilterScreenCategoryMultiSelect> {
  List<CategoryWrapItem> filterCategories = [
    CategoryWrapItem(category: 'کیک', enumCategory: FoodCategory.cake),
    CategoryWrapItem(category: 'نوشیدنی', enumCategory: FoodCategory.drink),
    CategoryWrapItem(category: 'فست فود', enumCategory: FoodCategory.fastfood),
    CategoryWrapItem(category: 'غذا', enumCategory: FoodCategory.food),
    CategoryWrapItem(category: 'شیرینی', enumCategory: FoodCategory.pastry),
    CategoryWrapItem(category: 'سبزی', enumCategory: FoodCategory.vegetables),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      runAlignment: WrapAlignment.start,
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: filterCategories.map((item) {
        return GestureDetector(
          onTap: () {
            setState(() {
              if (item.isSelected == false) {
                item.isSelected = true;
                widget.selectedCategories.add(item.enumCategory);
              } else {
                item.isSelected = false;
                widget.selectedCategories.remove(item.enumCategory);
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: item.isSelected
                  ? Theme.of(context).highlightColor
                  : Theme.of(context).colorScheme.background,
            ),
            child: Text(
              item.category,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
