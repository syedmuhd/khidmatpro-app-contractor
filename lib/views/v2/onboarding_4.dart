import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:get/get.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> choices = [
      'Plumbing',
      'Electrical',
      'Renovation',
      'Air-conditioning',
    ];

    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                            child: Ink(
                              decoration: const ShapeDecoration(
                                color: Colors.black,
                                shape: CircleBorder(
                                  side: BorderSide.none,
                                ),
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.arrow_back),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "What services do you offer?",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 33),
                      Center(
                        child: SizedBox(
                          height: 300,
                          width: 333,
                          child: InlineChoice<String>(
                            multiple: true,
                            clearable: true,
                            value: [],
                            onChanged: (value) {},
                            itemCount: choices.length,
                            itemBuilder: (selection, i) {
                              return ChoiceChip(
                                backgroundColor: Colors.white,
                                selectedColor:
                                    const Color.fromRGBO(142, 45, 226, 1),
                                labelStyle: (selection.selected(choices[i]))
                                    ? const TextStyle(color: Colors.white)
                                    : const TextStyle(color: Colors.black),
                                checkmarkColor: Colors.white,
                                showCheckmark: true,
                                shape: RoundedRectangleBorder(
                                    side: const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(30)),
                                selected: selection.selected(choices[i]),
                                onSelected: selection.onSelected(choices[i]),
                                label: Text(choices[i]),
                                selectedShadowColor: Colors.transparent,
                              );
                            },
                            listBuilder: ChoiceList.createWrapped(
                              spacing: 6,
                              runSpacing: 0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 25,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 312,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => Get.toNamed(RouteConstant.register5),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.purple.shade400,
                              Colors.purple.shade800
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: const Center(
                            child: Text(
                              "Continue",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
