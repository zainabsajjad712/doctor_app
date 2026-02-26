import 'package:doctor_app/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome home, Rakim\nMayers",
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage:
                        NetworkImage("https://i.pravatar.cc/300"),
                  )
                ],
              ),

              const SizedBox(height: 25),

              /// BLUE CARD
              Container(
                height: 170,
                width: size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    colors: [Color(0xff3A7BFF), Color(0xff2673FF)],
                  ),
                ),
                child: Stack(
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Trusted doctor on your schedule 😊",
                          style: GoogleFonts.plusJakartaSans(
                              color: Colors.white70, fontSize: 12),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Consult A Doctor\n— Book Today!",
                          style: GoogleFonts.plusJakartaSans(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            _buildStackAvatar(),
                            const SizedBox(width: 10),
                            Text(
                              "30.000+\nHappy Patients",
                              style: GoogleFonts.plusJakartaSans(
                                  color: Colors.white, fontSize: 11),
                            )
                          ],
                        )
                      ],
                    ),

                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Image.network(
                        "https://i.ibb.co/2kR6z9H/doctor.png",
                        height: 150,
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 30),

              /// SECTION TITLE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Interested Doctors",
                      style: GoogleFonts.plusJakartaSans(
                          fontWeight: FontWeight.w700, fontSize: 16)),
                  Text("See All",
                      style: GoogleFonts.plusJakartaSans(
                          color: const Color(0xff2673FF)))
                ],
              ),
            ],
          ),
        ),
      ),

      /// CUSTOM BOTTOM NAV
      bottomNavigationBar: _CustomBottomNav(),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.blue.withOpacity(0.4),
                blurRadius: 20)
          ],
        ),
        child: FloatingActionButton(
          backgroundColor: const Color(0xff2673FF),
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildStackAvatar() {
    return SizedBox(
      width: 70,
      child: Stack(
        children: const [
          CircleAvatar(radius: 14, backgroundImage: NetworkImage("https://i.pravatar.cc/301")),
          Positioned(
              left: 18,
              child: CircleAvatar(radius: 14, backgroundImage: NetworkImage("https://i.pravatar.cc/302"))),
          Positioned(
              left: 36,
              child: CircleAvatar(radius: 14, backgroundImage: NetworkImage("https://i.pravatar.cc/303"))),
        ],
      ),
    );
  }
}

class _CustomBottomNav extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black12,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(Icons.home, 0),
          _navItem(Icons.search, 1),
          const SizedBox(width: 40),
          _navItem(Icons.calendar_today, 2),
          _navItem(Icons.settings, 3),
        ],
      ),
    );
  }

  Widget _navItem(IconData icon, int index) {
    return Obx(() => GestureDetector(
          onTap: () {
            controller.changeIndex(index);
            if (index == 1) {
              Get.toNamed(AppRoutes.search);
            }
          },
          child: Icon(
            icon,
            color: controller.selectedIndex.value == index
                ? const Color(0xff2673FF)
                : Colors.grey,
          ),
        ));
  }
}