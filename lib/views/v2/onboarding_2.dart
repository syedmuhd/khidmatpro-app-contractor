import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khidmatpro_app_vendor/constants/app_size_constant.dart';
import 'package:khidmatpro_app_vendor/constants/route_constant.dart';
import 'package:get/get.dart';
import 'package:khidmatpro_app_vendor/controllers/onboarding_controller.dart';
import 'package:khidmatpro_app_vendor/utilities/formatter_only_alpha_and_number_and_single_space.dart';
import 'package:khidmatpro_app_vendor/utilities/formatter_only_alpha_and_single_space.dart';
import 'package:khidmatpro_app_vendor/utilities/app_colors.dart';
import 'package:khidmatpro_app_vendor/utilities/app_input_field.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Onboarding2 extends GetView<OnboardingController> {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      StepProgressIndicator(
                        totalSteps: controller.totalSteps.value,
                        currentStep: controller.currentStep.value,
                        selectedColor: AppColors.primaryColor,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        "Perkenalkan diri anda",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 313,
                        child: AppInputField(
                          text: "Nama penuh",
                          textCapitalization: TextCapitalization.words,
                          keyboardType: TextInputType.name,
                          inputFormatters: [
                            FormatterOnlyAlphaAndSingleSpace(),
                          ],
                        ),
                      ),
                      const SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            "Nama penuh seperti dalam kad pengenalan",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 313,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20))),
                            isExpanded: true,
                            hint: Text(
                              'Jenis pendaftaran',
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: [
                              'Individu',
                              'Syarikat',
                            ]
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (String? value) {},
                            buttonStyleData: ButtonStyleData(
                              height: 50,
                              width: 140,
                              padding:
                                  const EdgeInsets.only(left: 18, right: 18),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: Colors.black26,
                                ),
                                color: Colors.white,
                              ),
                              elevation: 2,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 50,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            "Bekerja secara individu atau syarikat",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 33),
                      SizedBox(
                        width: 313,
                        child: AppInputField(
                          text: "Nombor SSM",
                          textCapitalization: TextCapitalization.characters,
                          keyboardType: TextInputType.name,
                          inputFormatters: [
                            FormatterOnlyAlphaAndNumberAndSingleSpace()
                          ],
                        ),
                      ),
                      const SizedBox(
                        child: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Text(
                            "Nombor pendaftaran syarikat",
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 312,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => Get.toNamed(RouteConstant.onboarding3),
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
