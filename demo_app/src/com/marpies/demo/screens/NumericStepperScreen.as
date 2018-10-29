package com.marpies.demo.screens {

    import feathers.controls.NumericStepper;
    import feathers.layout.AnchorLayout;
    import feathers.layout.AnchorLayoutData;
    import feathers.themes.BaseMaterialIndigoPinkMobileTheme;

    public class NumericStepperScreen extends BaseScreen {

        public function NumericStepperScreen() {
            super();
            styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_HEADER_WITH_SHADOW );
        }

        override protected function initialize():void {
            super.initialize();

            title = "Numeric stepper";

            layout = new AnchorLayout();

            const stepper:NumericStepper = new NumericStepper();
            stepper.minimum = 0;
            stepper.maximum = 100;
            stepper.value = 37;
            stepper.step = 1;
            var stepperLayoutData:AnchorLayoutData = new AnchorLayoutData();
            stepperLayoutData.horizontalCenter = 0;
            stepperLayoutData.verticalCenter = 0;
            stepper.layoutData = stepperLayoutData;
            addChild(stepper);
        }

    }

}
