import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sjm/bloc/providers.dart';
import 'package:sjm/ui/screens/admin/admin_screen.dart';
import 'package:sjm/ui/screens/expense/expense_screen.dart';
import 'package:sjm/ui/screens/home/home.dart';
import 'package:sjm/ui/screens/project/project_screen.dart';
import 'package:sjm/ui/screens/widgets/primary_bottom_navigation.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  static DashboardScreen builder(BuildContext context, GoRouterState state) =>
      DashboardScreen();
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  int selectedIndex = 0;
  // int _currentIndex = 0;

  @override
  void initState() {
    final user = ref.read(userProvider);
    final pref = ref.read(sharedPrefHelperProvider);
    final username = pref.userName;
    print("Username: $username");
    final email = pref.userEmail;
    print("Email: $email");

    print("User: $user");
    super.initState();
  }

  final List<Widget> _screens = [
    HomeScreen(),
    ProjectScreen(),
    ExpenseScreen(),
    AdminScreen()
  ];
  void _onBottomNavItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  key: _scaffoldKey,
      // drawer: PrimaryDrawer(scaffoldKey: _scaffoldKey),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _screens[selectedIndex],
          Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: PrimaryBottomNavigation(
                  currentIndex: selectedIndex,
                  onTap: _onBottomNavItemTap,
                ),
              ),
            ),
          ),
        ],
      ),
    );
//  Scaffold(
    // body: _screens[_currentIndex],
    // bottomNavigationBar: BottomNavigationBar(
    //   currentIndex: _currentIndex,
    //   onTap: (index) {
    //     setState(() {
    //       _currentIndex = index;
    //     });
    //   },
    //   items: [
    //     const BottomNavigationBarItem(
    //       icon: const Icon(Icons.home),
    //       label: 'Home',
    //     ),
    //     const BottomNavigationBarItem(
    //       icon: Icon(Icons.person),
    //       label: 'Profile',
    //     ),
    //     const BottomNavigationBarItem(
    //       icon: Icon(Icons.settings),
    //       label: 'Settings',
    //     ),
    //   ],
    // ),
    // );
  }
}
