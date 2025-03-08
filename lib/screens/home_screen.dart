import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:store/constants.dart';
import 'package:store/screens/OrdersScreen.dart';
import 'package:store/widgets/home/home_body.dart';

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: kPrimaryColor,
        appBar: homeAppBar(context),
        body: HomeBody(),
        drawer: buildDrawer(context),
      ),
    );
  }

  AppBar homeAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        'متجر الالكترونيات',
        style: GoogleFonts.getFont('Almarai'),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OrdersScreen()),
          );
          },
        ),
      ],
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Text(
                'القائمة الرئيسية',
                style: GoogleFonts.getFont('Almarai',
                    fontSize: 24, color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: Text('الرئيسية', style: GoogleFonts.getFont('Almarai')),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrdersScreen()),);
              }
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: Text('العربة', style: GoogleFonts.getFont('Almarai')),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrdersScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.history),
              title: Text('طلباتي', style: GoogleFonts.getFont('Almarai')),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const OrdersScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: Text('الإعدادات', style: GoogleFonts.getFont('Almarai')),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}