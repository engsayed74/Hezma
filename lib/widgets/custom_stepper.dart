import 'package:flutter/material.dart';
import 'package:easy_stepper/easy_stepper.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: activeStep,
      lineStyle: LineStyle(
        lineLength: 70,
        lineWidth: 16,
        lineSpace: 0,
        lineType: LineType.normal,
        defaultLineColor: Colors.green,
        finishedLineColor: Colors.green,
      ),
      activeStepTextColor: Colors.black87,
      finishedStepTextColor: Colors.black87,
      internalPadding: 8,
      showLoadingAnimation: false,
      stepRadius: 16,
      showStepBorder: false,
      steps: [
        EasyStep(
          customStep: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.green,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: activeStep >= 0 ? Colors.white : Colors.green,
            ),
          ),
          title: 'تسليم الطلب',
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.green,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: activeStep >= 1 ? Colors.white : Colors.green,
            ),
          ),
          title: 'توصيل الطلب',
          topTitle: false,
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.green,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: activeStep >= 2 ? Colors.white : Colors.green,
            ),
          ),
          title: 'تجهيز الطلب',
        ),
        EasyStep(
          customStep: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.green,
            child: CircleAvatar(
              child: Image.asset(
                'asset/images/true.png',
                width: 70,
                height: 70,
              ),
              radius: 8,
              backgroundColor: activeStep >= 3 ? Colors.green : Colors.green,
            ),
          ),
          title: 'استلام الطلب',
          topTitle: false,
        ),
      ],
      onStepReached: (index) => setState(() => activeStep = index),
    );
  }
}
