import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:drivado_app/view/ManagePage.dart';
import 'package:drivado_app/viewModel/CompanyUserViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _widgetOptions() {
    return [
      const Placeholder(),
      const Placeholder(),
      const ManagePage(),
      const Placeholder(),
    ];
  }

  final List<String> _bottomNavigationImages = [
    'Call.png',
    'manage_booking.png',
    'user-gear.png',
    'user.png'
  ];

  final List<String> _bottomNavigationTexts = [
    'Home',
    'Bookings',
    'Manage',
    'Profile'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFf8f8f8),
      appBar: AppBar(
        title: Hero(
          tag: 'user-details',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(
                        'lib/assets/images/avatar_1.png'), // Replace with your image
                    radius: 20,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                ],
              ),
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Color(0xFF352828),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(
                    'lib/assets/images/bell_Icon.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFF190C0C),
      ),
      body: Consumer<CompanyUserViewModel>(builder: (context, provider, child) {
        return IndexedStack(
          index: provider.bottomNavIndex,
          children: _widgetOptions(),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFFFB4156),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Color(0xFFFFFFFF),
          size: 46,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar:
          Consumer<CompanyUserViewModel>(builder: (context, provider, child) {
        return AnimatedBottomNavigationBar.builder(
          activeIndex: provider.bottomNavIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          shadow: const BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 0.8,
          ),
          height: 92,
          onTap: (index) {
            provider.changeBottomNavigationIndex(index);
          },
          itemCount: 4,
          tabBuilder: (int index, bool isActive) {
            final color =
                isActive ? const Color(0xFFFB4156) : const Color(0xFF6F6F6F);
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'lib/assets/images/${_bottomNavigationImages[index]}',
                    height: 20,
                    width: 20,
                    color: color,
                  ),
                ),
                Text(
                  _bottomNavigationTexts[index],
                  style: GoogleFonts.lato(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: color,
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
