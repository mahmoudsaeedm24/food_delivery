import 'package:flutter/material.dart';
import 'package:food_delivery/core/components/data/data_sources/secure_data_base/secure_data_base.dart';
import 'package:food_delivery/features/home/presentation/views/widgets/top_part/home_top_notification_button_widget.dart';
import 'package:food_delivery/features/home/presentation/views/widgets/top_part/home_top_search_button_widget.dart';

import '../../../../../../core/theme/my_text_styles.dart';

class HomeTopWidget extends StatelessWidget {
  const HomeTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 3,
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: .9,
          image: AssetImage("assets/images/burger2.jpg"),
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              // color: Colors.blue,
              child: ListTile(
                contentPadding: EdgeInsets.all(0),

                title: Text(
                  "Your Location ",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "New York city",
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 16,
                  children: [
                    HomeTopSearchButtonWidget(),
                    HomeTopNotificationButtonWidget(),
                    IconButton(
                      onPressed: () {
                        SecureDataBase.removeToken();
                        Navigator.popUntil(context, (route) => false);
                      },
                      icon: Icon(Icons.logout),
                    ),
                  ],
                ),
              ),
            ),

            Text(
              "Provide the best food for you",
              style: MyTextStyles.homeScreentHeadline1Style,
            ),
          ],
        ),
      ),
    );
  }
}
