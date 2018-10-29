package com.marpies.demo.screens {

    import com.marpies.utils.HorizontalLayoutBuilder;
    import com.marpies.utils.VerticalLayoutBuilder;

    import feathers.controls.DateTimeSpinner;
    import feathers.controls.SpinnerList;
    import feathers.controls.renderers.DefaultListItemRenderer;
    import feathers.controls.renderers.IListItemRenderer;
    import feathers.data.ListCollection;
    import feathers.layout.HorizontalAlign;
    import feathers.layout.VerticalAlign;
    import feathers.layout.VerticalLayout;
    import feathers.system.DeviceCapabilities;
    import feathers.themes.BaseMaterialIndigoPinkMobileTheme;

    import starling.core.Starling;

    public class SpinnerListScreen extends BaseScreen {

        public function SpinnerListScreen() {
            super();
            styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_HEADER_WITH_SHADOW );
        }

        override protected function initialize():void {
            super.initialize();

            title = "Spinner list";

            const isTablet:Boolean = DeviceCapabilities.isTablet( Starling.current.nativeStage );

            layout = (isTablet ? new HorizontalLayoutBuilder() : new VerticalLayoutBuilder())
                    .setHorizontalAlign( HorizontalAlign.CENTER )
                    .setVerticalAlign( VerticalAlign.MIDDLE )
                    .setGap( 10 )
                    .build();

            const list:SpinnerList = new SpinnerList();
            list.dataProvider = new ListCollection(
                    [
                        { text: "Aardvark" },
                        { text: "Alligator" },
                        { text: "Alpaca" },
                        { text: "Anteater" },
                        { text: "Baboon" },
                        { text: "Bear" },
                        { text: "Beaver" },
                        { text: "Canary" },
                        { text: "Cat" },
                        { text: "Deer" },
                        { text: "Dingo" },
                        { text: "Dog" },
                        { text: "Dolphin" },
                        { text: "Donkey" },
                        { text: "Dragonfly" },
                        { text: "Duck" },
                        { text: "Dung Beetle" },
                        { text: "Eagle" },
                        { text: "Earthworm" },
                        { text: "Eel" },
                        { text: "Elk" },
                        { text: "Fox" },
                    ] );
            list.typicalItem = { text: "Dung Beetle" };
            list.itemRendererFactory = function ():IListItemRenderer {
                var renderer:DefaultListItemRenderer = new DefaultListItemRenderer();
                renderer.isQuickHitAreaEnabled = true;
                renderer.labelField = "text";
                return renderer;
            };
            addChild( list );

            const date:DateTimeSpinner = new DateTimeSpinner();
            addChild( date );
        }
    }

}
