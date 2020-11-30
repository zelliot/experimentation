import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Don't forget to import the stepper.dart class.
import 'package:im_stepper/stepper.dart';

void main() => runApp(GetMaterialApp(home: DotStepperDemo()));

class Controller extends GetxController {
  var activeStep = 1.obs;
}

class DotStepperDemo extends StatelessWidget {
  // MUST DEFINE THE FOLLOWING THREE VARIABLES.
  // activeStep must be Set to 1 and NOT to 0

  // int lowerBound = 1;
  // int upperBound = 5;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text('DotStepper Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                previousButton(),
                Expanded(
                  child: Obx(() => DotStepper(
                        dotCount: 5,
                        activeStep: controller.activeStep.value,
                        // TODO: You actually don't need lowerBound because it will always be 1
                        lowerBound: (bound) => 1,
                        // TODO: You actually don't need upperBound because it will always be = dotCount
                        upperBound: (bound) => 5,
                        indicatorEffect: IndicatorEffect.jump,
                      )),
                ),
                nextButton(),
              ],
            ),
            Expanded(
              child: FittedBox(
                child: Obx(
                  () => Text(
                    '${controller.activeStep.value}',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  nextButton() {
    final controller = Get.put(Controller());
    return ElevatedButton(
      child: Text('Next'),
      onPressed: () {
        // Constraint is a must.
        // if (controller.activeStep.value < upperBound) {
        controller.activeStep.value++;
        // }
      },
    );
  }

  Widget previousButton() {
    final controller = Get.put(Controller());
    return ElevatedButton(
      child: Text('Previous'),
      onPressed: () {
        // Constraint is a must.
        // if (controller.activeStep.value > lowerBound) {
        controller.activeStep.value--;
        // }
      },
    );
  }
}
