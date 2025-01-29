import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_tech/core/colors_manager.dart';
import 'package:info_tech/presentation/screens/home/tabs/search_tab/widgets/custom_textForm_appbar.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  bool addSearch = false;
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorsManager.mainAppColor,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: ColorsManager.yellow,
        toolbarHeight: addSearch ? screenHeight * 0.14 : screenHeight * 0.07,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'SEARCH',
              style: GoogleFonts.poppins(
                color: ColorsManager.mainAppColor,
                fontSize: screenWidth * 0.08,
                fontWeight: FontWeight.w600,
              ),
            ),
            addSearch
                ? Form(
              child: TextFormWidget(
                hintText: 'Search',
                validator: (value) {
                  return null;
                },
                controller: searchController,
                onChanged: (value) {},
              ),
            )
                : Container()
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: addSearch
                ? EdgeInsets.only(top: screenWidth * 0.1, right: 5)
                : const EdgeInsets.only(top: 0, right: 5),
            child: IconButton(
              onPressed: () {
                setState(() {
                  addSearch = !addSearch;
                });
              },
              icon: Icon(
                Icons.search,
                size: screenHeight * 0.04,
                color: ColorsManager.mainAppColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
