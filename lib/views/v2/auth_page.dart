import 'package:flutter/material.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:get/get.dart';
import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:khidmatpro_app_vendor/views/v2/auth_drawer.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key});

  BottomDrawerController controller = BottomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 54),
        child: Column(
          children: [
            Expanded(child: Container()),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 61),
                child: Column(
                  children: [
                    const Text(
                      "Welcome!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 285,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: ElevatedButton(
                          onPressed: () => Get.toNamed(RouteConstant.login),
                          child: const Text(
                            "I have an account",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 285,
                      height: 50,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(50),
                                ),
                              ),
                              backgroundColor: Colors.white,
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return const Wrap(
                                  children: [AuthDrawer()],
                                );
                              },
                            );
                          },
                          child: const Text(
                            "I am new here",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
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
