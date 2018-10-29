package com.marpies.demo.screens.tabs {

    import feathers.controls.Label;
    import feathers.controls.LayoutGroup;
    import feathers.layout.AnchorLayout;
    import feathers.layout.AnchorLayoutData;

    public class TabScreen1 extends LayoutGroup {

        public function TabScreen1() {
            super();
        }

        override protected function initialize():void {
            super.initialize();

            layout = new AnchorLayout();

            var label:Label = new Label();
            label.text = "Tab screen #1";
            label.layoutData = new AnchorLayoutData( NaN, NaN, NaN, NaN, 0, 0 );
            addChild( label );
        }

    }

}
