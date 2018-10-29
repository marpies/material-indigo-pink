package com.marpies.demo.screens {

    import com.marpies.utils.VerticalLayoutBuilder;

    import feathers.controls.Label;
    import feathers.layout.HorizontalAlign;
    import feathers.layout.VerticalAlign;
    import feathers.layout.VerticalLayout;
    import feathers.themes.BaseMaterialIndigoPinkMobileTheme;

    public class LabelScreen extends BaseScreen {

        public function LabelScreen() {
            super();
            styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_HEADER_WITH_SHADOW );
        }

        override protected function initialize():void {
            super.initialize();

            title = "Labels";
            layout = new VerticalLayoutBuilder()
                    .setGap( 20 )
                    .setHorizontalAlign( HorizontalAlign.CENTER )
                    .setVerticalAlign( VerticalAlign.MIDDLE )
                    .build();

            const headingLabel:Label = new Label();
            headingLabel.styleNameList.add( Label.ALTERNATE_STYLE_NAME_HEADING );
            headingLabel.text = "Heading label";
            addChild( headingLabel );

            const normalLabel:Label = new Label();
            normalLabel.text = "Normal label.";
            addChild( normalLabel );

            const disabledLabel:Label = new Label();
            disabledLabel.text = "Disabled label";
            disabledLabel.isEnabled = false;
            addChild( disabledLabel );

            const detailLabel:Label = new Label();
            detailLabel.styleNameList.add( Label.ALTERNATE_STYLE_NAME_DETAIL );
            detailLabel.text = "Detail label";
            addChild( detailLabel );
        }
    }

}
