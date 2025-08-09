// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:frontend/core/theme/colors.dart';
import 'package:frontend/core/theme/my_text_styles.dart';
import 'package:frontend/core/utils/router.dart';
import 'package:frontend/core/components/data/data_sources/secure_data_base/secure_data_base.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 4), () async {
    //   final token = await SecureDataBase.getToken();
    //   if (token != null && token.isNotEmpty) {
    //     await Navigator.pushReplacementNamed(context, MyPages.tabsScreen);
    //   } else {
    //     await Navigator.pushReplacementNamed(context, MyPages.loginScreen);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    final BorderSide border = BorderSide(color: Colors.white, width: 2);
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/burger.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: Stack(
          children: [
            Positioned(
              bottom: 30,
              child: Container(
                padding: EdgeInsets.all(50),
                margin: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: MyColors.primaryColor.withAlpha(240),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      spacing: 20,
                      children: [
                        Text(
                          """
We Serve 
incomparable 
delicacies""",
                          textAlign: TextAlign.center,
                          style: MyTextStyles.textHeadline1Style.copyWith(
                            color: const Color.fromARGB(234, 246, 243, 243),
                          ),
                        ),
                        Text(
                          """
All the best restaurants with their top
menu waiting for you,they cant’t wait
for your order!!""",
                          overflow: TextOverflow.ellipsis,
                          maxLines: null,
                          softWrap: true,

                          textAlign: TextAlign.start,
                        ),
                        InkWell(
                          onTap: () async {
                            final token = await SecureDataBase.getToken();
                            if (token != null && token.isNotEmpty) {
                              await Navigator.pushReplacementNamed(
                                context,
                                MyPages.tabsScreen,
                              );
                            } else {
                              await Navigator.pushReplacementNamed(
                                context,
                                MyPages.loginScreen,
                              );
                            }
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),

                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(0),
                              shape: BoxShape.circle,
                              border: Border(
                                top: border,
                                bottom: border.copyWith(
                                  // color: Colors.blue,
                                  // width: 10,
                                ),
                                right: border.copyWith(width: 5),
                                left: BorderSide.none,
                              ),
                            ),
                            child: Icon(
                              Icons.arrow_circle_right,
                              size: 45,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
