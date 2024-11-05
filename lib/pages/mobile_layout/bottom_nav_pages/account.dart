import 'package:flutter/material.dart';
import 'package:zaffnews/component_page/list_adapter.dart';
import 'package:zaffnews/constants/colors.dart';
import 'package:zaffnews/data/list_data.dart';
import 'package:zaffnews/models/list_model.dart';
import 'package:zaffnews/widgets/mobile_layout/mobile_appbar.dart';

class MobileAccountPage extends StatelessWidget {
  const MobileAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ListModel> listItems = accountList;

    return Scaffold(
      appBar: MobileAppbar(title: "My Account", showSearch: false),
      body: Expanded(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              // Header
              Container(
                color: backgroundColor,
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          "lib/assets/avatar-placeholder.png",
                          height: 100,
                          width: 100,
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Guest7758',
                            style: TextStyle(
                              color: Color(0xFF1D1B20),
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.50,
                            ),
                          ),
                          Text(
                            'Log In to enjoy all features',
                            style: TextStyle(
                              color: Color(0xFFA0A0A0),
                              fontSize: 13,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.50,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              // Divider
              Container(height: 3.0, color: dividerColor),
              ListAdapter(items: listItems)
            ],
          ),
        ),
      ),
    );
  }
}
