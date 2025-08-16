import 'package:flutter/material.dart';
import 'package:frontend/core/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../cart/presentation/view/screens/cart_screen.dart';
import '../../../home/presentation/views/screens/home_screen.dart';
import '../../../personal_data/presentation/views/personal_data_screen.dart';

Future<void> openWhatsApp(String phone, String message) async {
  // تحويل الرقم للـ format الدولي بدون + مثلا 201234567890
  final whatsappUrl = Uri.parse("https://wa.me/$phone?text=${Uri.encodeComponent(message)}");

  if (await canLaunchUrl(whatsappUrl)) {
    await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
  } else {
    print("Can't launch WhatsApp");
  }
}

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    // Container(color: Colors.amber),
    // Container(color: Colors.red),
    // Scaffold(
    //   appBar: AppBar(),
    //   body: Container(
    //     color: Colors.green,
    //     child: ElevatedButton(
    //       onPressed: () {
    //         openWhatsApp('201552483586', "Hello mahmoud");
    //       },
    //       child: Text("Open whatsapp"),
    //     ),
    //   ),
    // ),
    
    CartScreen(),
    PersonalDataScreen(key: ValueKey('screen 3')),
  ];
  Widget _currentPage(int currentIndex) {
    return pages[currentIndex];
  }

  void _onItemTapped(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: MyColors.primaryColor,
        selectedItemColor: MyColors.primaryColor,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.black38,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
            // backgroundColor: MyColors.primaryColor,
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Icon(Icons.shopping_bag),
            // backgroundColor: MyColors.primaryColor,
          ),
          // BottomNavigationBarItem(
          //   label: "Messages",
          //   icon: Icon(Icons.message_rounded),
          //   backgroundColor: MyColors.primaryColor,

          //   // backgroundColor: Colors.green,
          // ),
          BottomNavigationBarItem(
            label: "Info",
            icon: Icon(Icons.person),
            // backgroundColor: MyColors.primaryColor,

            // backgroundColor: Colors.blue,
          ),
        ],
      ),
      body: _currentPage(currentIndex),
    );
  }
}

// class RPSCustomPainter extends CustomPainter {
//   final int selectedIndex;
//   final int itemCount;

//   RPSCustomPainter({required this.selectedIndex, required this.itemCount});

//   @override
//   void paint(Canvas canvas, Size size) {
//     double itemWidth = size.width / itemCount;
//     double centerX = itemWidth * (selectedIndex + 0.5); // نص الأيقونة

//     Paint paintFill = Paint()
//       ..color = const Color.fromARGB(255, 255, 255, 255)
//       ..style = PaintingStyle.fill;

//     Path path = Path();

//     // نرسم الشكل حوالين الـ indicator (بإزاحة centerX)
//     path.moveTo(centerX - 20, size.height * 0.4);
//     path.cubicTo(
//       centerX - 10,
//       size.height * 0.35,
//       centerX + 10,
//       size.height * 0.35,
//       centerX + 20,
//       size.height * 0.4,
//     );
//     path.cubicTo(
//       centerX + 10,
//       size.height * 0.45,
//       centerX - 10,
//       size.height * 0.45,
//       centerX - 20,
//       size.height * 0.4,
//     );
//     path.close();

//     canvas.drawPath(path, paintFill);

//     Paint paintStroke = Paint()
//       ..color = const Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2;

//     canvas.drawPath(path, paintStroke);
//   }

//   @override
//   bool shouldRepaint(covariant RPSCustomPainter oldDelegate) {
//     return oldDelegate.selectedIndex != selectedIndex;
//   }
// }
