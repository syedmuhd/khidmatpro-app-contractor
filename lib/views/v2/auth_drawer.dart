import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';

class AuthDrawer extends StatelessWidget {
  const AuthDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Hello",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 5),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Please sign up to open an account",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SizedBox(
                width: 353,
                height: 50,
                child: ElevatedButton(
                  onPressed: () => Get.toNamed(RouteConstant.login),
                  child: const Text(
                    "Continue with Google",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text("or"),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  hintText: 'Phone number',
                  contentPadding: EdgeInsets.all(18)),
            ),
            const SizedBox(height: 25),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(60))),
                  hintText: 'Password',
                  contentPadding: EdgeInsets.all(18)),
            ),
            const SizedBox(
              height: 36,
            ),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple.shade400, Colors.purple.shade800],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                "Already have an account? Login",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
