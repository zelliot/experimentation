import 'package:flutter/material.dart';

/// Don't forget to import the stepper.dart class.
import 'package:im_stepper/stepper.dart';

void main() {
  runApp(DotStepperDemo());
}

class DotStepperDemo extends StatefulWidget {
  @override
  _DotStepperDemo createState() => _DotStepperDemo();
}

class _DotStepperDemo extends State<DotStepperDemo> {
  // MUST DEFINE THE FOLLOWING THREE VARIABLES.
  // activeStep must be Set to 1 and NOT to 0
  int activeStep = 0;

  int lowerBound = 0;
  int upperBound = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                    child: DotStepper(
                      dotCount: 5,
                      activeStep: activeStep,
                      lowerBound: (bound) => lowerBound = bound,
                      upperBound: (bound) => upperBound = bound,
                      indicatorEffect: IndicatorEffect.jump,
                    ),
                  ),
                  nextButton(),
                ],
              ),
              Expanded(
                child: FittedBox(
                  child: Text(
                    '$activeStep',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget nextButton() {
    return ElevatedButton(
      child: Text('Next'),
      onPressed: () {
        // Constraint is a must.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
    );
  }

  Widget previousButton() {
    return ElevatedButton(
      child: Text('Previous'),
      onPressed: () {
        // Constraint is a must.
        if (activeStep > lowerBound) {
          setState(() {
            activeStep--;
          });
        }
      },
    );
  }
}
