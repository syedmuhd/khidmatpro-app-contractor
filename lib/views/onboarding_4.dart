import 'package:choice/choice.dart';
import 'package:flutter/material.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/controllers/service_controller.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceController serviceController = Get.find<ServiceController>();

    serviceController.fetchAll();

    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
                          child: Obx(
                            () => serviceController.servicesList.isEmpty
                                ? const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircularProgressIndicator(
                                            color: AppColors.primaryColor,
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                : InlineChoice<String>(
                                    multiple: true,
                                    clearable: true,
                                    value:
                                        serviceController.selectedServicesList,
                                    onChanged: (value) {
                                      serviceController
                                          .selectedServicesList.value = value;
                                    },
                                    itemCount:
                                        serviceController.servicesList.length,
                                    itemBuilder: (selection, i) {
                                      return ChoiceChip(
                                        backgroundColor: Colors.white,
                                        selectedColor: AppColors.primaryColor
                                            .withAlpha(60),
                                        labelStyle: (selection.selected(
                                                serviceController.servicesList
                                                    .toList()[i]
                                                    .name!))
                                            ? const TextStyle(
                                                color: Colors.white)
                                            : const TextStyle(
                                                color: Colors.black),
                                        checkmarkColor: Colors.white,
                                        showCheckmark: true,
                                        shape: RoundedRectangleBorder(
                                            side: const BorderSide(
                                                color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        selected: selection.selected(
                                            serviceController.servicesList
                                                .toList()[i]
                                                .id
                                                .toString()),
                                        onSelected: selection.onSelected(
                                            serviceController.servicesList
                                                .toList()[i]
                                                .id
                                                .toString()),
                                        label: Text(serviceController
                                            .servicesList
                                            .toList()[i]
                                            .name!),
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
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 312,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => serviceController.complete(),
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
                              "Complete registration",
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
