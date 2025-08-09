import 'package:flutter/widgets.dart';
import 'package:frontend/features/home/data/model/category_model.dart';
import 'package:frontend/features/test/single_choice/choice_card.dart';

class ChooseOne extends StatefulWidget {
  const ChooseOne({super.key});

  @override
  State<ChooseOne> createState() => _ChooseOneState();
}

class _ChooseOneState extends State<ChooseOne> {
  CategoryModel? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final isActive = selectedIndex?.id == index;
        return ChoiceCard(
          isActive: isActive,
          onTap: () {
            setState(() {
              // selectedIndex = index;
            });
          },
        );
      },
      separatorBuilder: (context, index) => SizedBox(width: 5),
      itemCount: 6,
    );
  }
}
