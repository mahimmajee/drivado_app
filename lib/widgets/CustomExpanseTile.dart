import 'package:drivado_app/model/AdvancedCompanyModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../view/CompanyScreen.dart';
import 'SubCompanyListTile.dart';

class CustomExpanseTile extends StatefulWidget {
  final AdvancedCompanyModel advancedCompanyModel;

  const CustomExpanseTile({
    required this.advancedCompanyModel,
    super.key,
  });

  @override
  State<CustomExpanseTile> createState() => _CustomExpanseTileState();
}

class _CustomExpanseTileState extends State<CustomExpanseTile> {
  bool isTapped = false;

  void _handleTap() {
    setState(() {
      isTapped = true;
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      if (mounted) {
        setState(() {
          isTapped = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          child: Row(
            children: [
              Image.asset(
                'lib/assets/images/Building.png',
                width: 14,
                height: 14,
                color: isTapped ? Colors.red : Colors.black,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.advancedCompanyModel.companyModel!.companyName!,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isTapped ? Colors.red : Colors.black,
                ),
              ),
            ],
          ),
          onTap: () {
            _handleTap();
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CompanyScreen(
                    companyModel: widget.advancedCompanyModel.companyModel,
                  ),
                ));
          },
        ),
      ),
      collapsedBackgroundColor: Colors.white,
      children: [
        SubCompanyListTile(),
        const SizedBox(height: 5),
        for (int i = 0; i < widget.advancedCompanyModel.userList!.length; i++)
          Column(
            children: [
              SubCompanyListTile(
                icon: 'lib/assets/images/Person.png',
                title: widget.advancedCompanyModel.userList![i].name,
                pushScreen: "User",
                userModel: widget.advancedCompanyModel.userList![i],
              ),
              const SizedBox(height: 5),
            ],
          ),
      ],
    );
  }
}
