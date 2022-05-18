import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rent_your_car/models/bn_screen.dart';
import 'package:rent_your_car/view/screens/user/home_screen.dart';
import 'package:rent_your_car/view/screens/user/profile_screen.dart';
import 'package:rent_your_car/view/screens/user/rents_screen.dart';
import 'package:rent_your_car/view/styles/color_manger.dart';


class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int _index = 0;
  final _advancedDrawerController = AdvancedDrawerController();

  final List<BnScreen> _screens = [
    BnScreen(widget: const HomeScreen(), title: 'الرئيسية'),
    BnScreen(widget: RentsScreen(), title: 'حجوزاتي'),
    BnScreen(widget: const ProfileScreen(), title: 'الملف الشخصي'),
  ];
  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      drawer: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 50.h),
          padding: EdgeInsets.symmetric(vertical: 20.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.sp),
                topLeft: Radius.circular(20.sp),
              ),
              gradient: LinearGradient(
                  colors: [
                    ColorManger.scaColor,
                    ColorManger.blueBold,
                  ],
                  end: AlignmentDirectional.bottomCenter,
                  begin: AlignmentDirectional.topCenter
              )
          ),
          child: ListTileTheme(
            contentPadding:
            EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
            textColor: Colors.white,
            iconColor: Colors.white70,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/car-rent.png',
                      width: 80.w,
                      height: 80.h,
                    ),
                    SizedBox(height: 10.h,),
                    Text('G O T O',style: TextStyle(color: ColorManger.defaultColor,fontWeight: FontWeight.w700,fontSize: 18.sp),)
                  ],
                ),
                SizedBox(height: 30.h),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.contact_page_outlined,
                  ),
                  title: Text(
                    'تواصل معنا',
                  ),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(
                    Icons.privacy_tip_outlined,
                  ),
                  title: Text('سياسية الخصوصية'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.info_outline),
                  title: Text('عن التطبيق'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.cookie_outlined),
                  title: Text('اخر نسخة'),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.share),
                  title: Text('مشاركة التطبيق'),
                ),
                const Spacer(),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white54,
                  ),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 16.0,
                    ),
                    child: Text(
                      'مطبخ مسك | سياسة الخصوصية',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        color: ColorManger.liColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backdropColor: ColorManger.scaColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: true,
      openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              _screens[_index].title,
              style:  TextStyle(
                color: ColorManger.lColor,
              ),
            ),

            leading: IconButton(
              onPressed: () {
                _advancedDrawerController.showDrawer();
              },
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon:  Icon(Icons.notifications_none, color: ColorManger.lColor),
              )
            ],
          ),
          body: _screens[_index].widget,
          bottomNavigationBar:
          bottomNavigationBarAdmin()),
    );
  }
  Widget bottomNavigationBarAdmin() {
    return BottomNavigationBar(
      currentIndex: _index,
      onTap: (int v) {
        setState(() {
          _index = v;
        });
      },
      selectedLabelStyle:
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          activeIcon: Icon(
            Icons.home,
          ),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.car_rental_outlined,
          ),
          activeIcon: Icon(
            Icons.car_rental,
          ),
          label: 'حجوزاتي',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings_outlined,
          ),
          activeIcon: Icon(
            Icons.settings,
          ),
          label: 'أعدادات',
        ),
      ],
    );
  }

}
