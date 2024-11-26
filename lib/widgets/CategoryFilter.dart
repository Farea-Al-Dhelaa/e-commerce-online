import 'package:flutter/material.dart';
import '../utils/constants.dart';
class CategoryFilter extends StatefulWidget {
  final Function(String) onCategorySelected;

  const CategoryFilter({Key? key, required this.onCategorySelected})
      : super(key: key);

  @override
  CategoryFilterState createState() => CategoryFilterState();
}
class CategoryFilterState extends State<CategoryFilter> {
  String selectedCategory = 'all';

  @override
  Widget build(BuildContext context) {
    List<String> filterCategories = [
      'All',
      'Electronics',
      'Jewelery',
      'Men\'s clothing',
      'Women\'s clothing',
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          height: isMobile ? 80 : null,
          child: isMobile
              ? _buildHorizontalList(filterCategories)
              : _buildGridList(filterCategories, constraints),
        );
      },
    );
  }

  // تصميم أفقي للهواتف
  Widget _buildHorizontalList(List<String> filterCategories) {
    final screenWidth = MediaQuery.of(context).size.width;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: filterCategories.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: _buildChoiceChip(filterCategories[index], screenWidth * 0.04),
        );
      },
    );
  }

  // تصميم شبكة للأجهزة العريضة
  Widget _buildGridList(List<String> filterCategories, BoxConstraints constraints) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 8,
      children: filterCategories.map((category) {
        return _buildChoiceChip(category, constraints.maxWidth * 0.015);
      }).toList(),
    );
  }

  // مكون أساسي لـ ChoiceChip
  Widget _buildChoiceChip(String category, double fontSize) {
    return ChoiceChip(
      label: Text(
        category,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: selectedCategory ==
              (category == 'All' ? 'all' : category.toLowerCase())
              ? kcontentColor
              : kbuttonColor,
        ),
      ),
      selected: selectedCategory == (category == 'All' ? 'all' : category.toLowerCase()),
      selectedColor: kprimaryColor,
      backgroundColor: kcontentColor,
      onSelected: (selected) {
        setState(() {
          selectedCategory = category == 'All' ? 'all' : category.toLowerCase();
        });
        widget.onCategorySelected(selectedCategory);
      },
      elevation: 3,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }
}
