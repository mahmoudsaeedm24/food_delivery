import 'package:flutter/material.dart';

import '../../../../core/components/widgets/s_text_field_widget.dart';

class SearchInput extends StatefulWidget {
  const SearchInput({super.key, this.settingsTap, this.onTap, this.onChanged});
  final void Function()? settingsTap;
  final void Function()? onTap;
  final Function(String)? onChanged;
  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late TextEditingController searchController;
  
  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return STextFieldWidget(
      controller: searchController,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      hint: "Search Food",
      leading: Icon(Icons.search),
      trailing: IconButton(
        onPressed: widget.settingsTap,
        icon: Icon(Icons.filter_list),
      ),
    );
  }
}
