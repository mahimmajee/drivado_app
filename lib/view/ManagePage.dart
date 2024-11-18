import 'package:drivado_app/viewModel/CompanyUserViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/CustomExpanseTile.dart';
import '../widgets/UserListTile.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({Key? key}) : super(key: key);

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> with TickerProviderStateMixin {
  ScrollController userScrollController = ScrollController();
  ScrollController companyScrollController = ScrollController();
  TabController? tabController;
  var provider;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    provider = Provider.of<CompanyUserViewModel>(context, listen: false);
    getDetails();
    userScrollController.addListener(() {
      if (userScrollController.offset >=
          userScrollController.position.maxScrollExtent) {
        provider.fetchUserData();
      }
    });
    companyScrollController.addListener(() {
      if (companyScrollController.offset >=
          companyScrollController.position.maxScrollExtent) {
        provider.fetchCompanyData();
      }
    });
  }

  void getDetails() async {
    await provider.getUserDetails();
    await provider.getCompanyDetails();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    userScrollController.dispose();
    companyScrollController.dispose();
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFf8f8f8),
        body: Column(
          children: [
            Container(
              color: const Color(0xFF190C0C),
              padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 21),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 52,
                    width: size.width * .70,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFFC0C0C0)),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xFFC0C0C0),
                          size: 18,
                        ),
                        filled: true,
                        fillColor: const Color(0xFFFFFFFF),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(42),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 16),
                      ),
                    ),
                  ),
                  Container(
                    height: 52,
                    width: size.width * .15,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Image.asset(
                        width: 21,
                        height: 16.13,
                        'lib/assets/images/setting.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 21, horizontal: 14.5),
                child: Container(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color(0xFFF0F1F5)),
                  child: TabBar(
                    controller: tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: const EdgeInsets.all(2),
                    indicator: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    labelColor: const Color(0xFF1D1D1D),
                    unselectedLabelColor: const Color(0xFF6A6A6A),
                    labelStyle: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    unselectedLabelStyle: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    onTap: (int val) {
                      tabController!.index = val;
                    },
                    tabs: const [
                      Tab(
                        text: 'Users',
                      ),
                      Tab(
                        text: 'Sub - company',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Consumer<CompanyUserViewModel>(builder: (context, provider, child) {
              return Expanded(
                child: TabBarView(controller: tabController, children: [
                  provider.userLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        )
                      : ListView.builder(
                          controller: userScrollController,
                          itemCount: provider.onScreenUserList.length,
                          itemBuilder: (BuildContext context, int index) {
                            if ((index ==
                                    provider.onScreenUserList.length - 1) &&
                                (provider.onScreenUserList.length - 1 !=
                                    provider.userList.length - 1)) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                  strokeWidth: 5,
                                ),
                              );
                            }
                            return Column(
                              children: [
                                UserListTile(
                                  title: provider.onScreenUserList[index].name!,
                                  userModel: provider.onScreenUserList[index],
                                  icon: "lib/assets/images/Person.png",
                                ),
                                if (index < provider.onScreenUserList.length)
                                  const SizedBox(height: 1),
                              ],
                            );
                          },
                        ),
                  provider.companyLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        )
                      : ListView.builder(
                          controller: companyScrollController,
                          itemCount: provider.onScreenCompanyList.length,
                          itemBuilder: (BuildContext context, int index) {
                            if ((index ==
                                    provider.onScreenCompanyList.length - 1) &&
                                (provider.onScreenCompanyList.length - 1 !=
                                    provider.companyList.length - 1)) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.blue,
                                  strokeWidth: 5,
                                ),
                              );
                            }
                            return Column(
                              children: [
                                Theme(
                                  data: Theme.of(context).copyWith(
                                    dividerColor: Colors.transparent,
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                  ),
                                  child: CustomExpanseTile(
                                      advancedCompanyModel:
                                          provider.onScreenCompanyList[index]),
                                ),
                                if (index < provider.onScreenCompanyList.length)
                                  const SizedBox(height: 1),
                              ],
                            );
                          },
                        ),
                ]),
              );
            }),
          ],
        ));
  }
}
