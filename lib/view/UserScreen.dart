import 'package:drivado_app/model/Users.dart';
import 'package:drivado_app/viewModel/CompanyUserViewModel.dart';
import 'package:drivado_app/widgets/CreditRow.dart';
import 'package:drivado_app/widgets/DetailRow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  UserModel? userModel;
  UserScreen({this.userModel, Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf8f8f8),
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFF352828),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    'lib/assets/images/Back.png',
                    width: 6.79,
                    height: 13.58,
                  ),
                ),
              ),
            ),
          ),
          title: Hero(
            tag: 'user-details',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Test Drivado',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFFFFFF)),
                        ),
                        Text(
                          'test@drivado.com',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFFAEB1C1)),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('lib/assets/images/avatar_1.png'),
                      radius: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          backgroundColor: const Color(0xFF190C0C),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: const Color(0xFFFFFFFF),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "User Details",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                        Consumer<CompanyUserViewModel>(
                            builder: (context, provider, child) {
                          return Row(
                            children: [
                              Text(
                                provider.userSwitchValue
                                    ? 'Deactivate'
                                    : 'Activate',
                                style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF8B8B94)),
                              ),
                              Transform.scale(
                                scale: 0.9,
                                child: Switch(
                                  value: provider.userSwitchValue,
                                  onChanged: (bool value) {
                                    provider.toggleUserSwitch(value);
                                  },
                                  activeColor: Colors.white,
                                  activeTrackColor: const Color(0xFF00E041),
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black,
                              width: 0.2,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.network(
                              widget.userModel!.avatar!.toString(),
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'lib/assets/images/DefaultUser.png',
                                  width: 52,
                                  height: 52,
                                );
                              },
                              width: 52,
                              height: 52,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.userModel!.name!,
                              style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF1E1E2D)),
                            ),
                            Row(
                              children: [
                                Text(
                                  'User ',
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF434557)),
                                ),
                                Center(
                                    child: Image.asset(
                                  "lib/assets/images/Ellipse.png",
                                  width: 5,
                                  height: 5,
                                )),
                                Text(
                                  " ${widget.userModel!.email!}",
                                  style: GoogleFonts.inter(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xFF2A2D3D)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    DetailRow(
                      icon: "lib/assets/images/Person.png",
                      title: "Name",
                      value: widget.userModel!.name!,
                      padTop: 15,
                      padBottom: 10,
                    ),
                    DetailRow(
                      icon: "lib/assets/images/Email.png",
                      title: "Email ID",
                      value: widget.userModel!.email!,
                      padBottom: 10,
                    ),
                    DetailRow(
                      icon: "lib/assets/images/Mobile.png",
                      title: "Mob. number",
                      value: widget.userModel!.mobileNumber!,
                      padBottom: 10,
                    ),
                    DetailRow(
                      icon: "lib/assets/images/Chat.png",
                      title: "Language",
                      value: "English",
                      padBottom: 10,
                    ),
                    DetailRow(
                      icon: "lib/assets/images/Currency.png",
                      title: "Currency",
                      value: widget.userModel!.currency!,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: const Color(0xFFFFFFFF),
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Credit limit",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                      ],
                    ),
                    CreditRow(
                      title: "Total unpaid booking",
                      value:
                          "${widget.userModel!.currency} ${widget.userModel!.totalUnpaidBooking}",
                      padTop: 10,
                    ),
                    CreditRow(
                      title: "Available credit limit",
                      value:
                          "${widget.userModel!.currency} ${widget.userModel!.availableLimit}",
                      padTop: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
