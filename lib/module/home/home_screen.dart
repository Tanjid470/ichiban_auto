
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ichiban_auto/config/responsive_scale.dart';
import 'package:ichiban_auto/const/app_color.dart';

import '../../const/dynamic_font.dart';
import '../booking/view/car_service_booking_screen.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
        title: const Text('Dashboard'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Booking for Car Servicing',style: TextStyle(color: AppColors.baseColorRed,fontSize: TextSize.font20(context),fontWeight: FontWeight.w700),),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const CarServiceForm()),
                );

              },
              child: Container(
                width: MediaQuery.of(context).size.width-30,
                height: MediaQuery.of(context).size.height/4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.baseColorRed,
                        //spreadRadius: 2,
                        blurRadius: 2,
                        blurStyle: BlurStyle.outer
                      )
                    ],
                    image: DecorationImage(
                        image: AssetImage('assets/images/car_service.png'),
                      fit: BoxFit.fitHeight
                    )
                ),
              ),
            ),
            ResponsiveScale.of(context).verticalGap(context, 2),
            Text('Calendar View of Bookings',style: TextStyle(color: AppColors.baseColorRed,fontSize: TextSize.font20(context),fontWeight: FontWeight.w700),),
            Container(
              width: MediaQuery.of(context).size.width-30,
              height: MediaQuery.of(context).size.height/4,

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.baseColorRed,
                      //spreadRadius: 2,
                      blurRadius: 2,
                      blurStyle: BlurStyle.outer
                    )
                  ],
                  image: DecorationImage(
                      image: AssetImage('assets/images/car_admin.png'),
                    fit: BoxFit.fitHeight
                  )
              ),
            ),
          ],
        ),

      ),
    );
  }
}