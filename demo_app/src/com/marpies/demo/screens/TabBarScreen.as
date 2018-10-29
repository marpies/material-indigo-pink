package com.marpies.demo.screens {

    import feathers.controls.Label;
    import feathers.controls.TabBar;
    import feathers.data.ListCollection;
    import feathers.layout.AnchorLayout;
    import feathers.layout.AnchorLayoutData;
    import feathers.themes.BaseMaterialIndigoPinkMobileTheme;
    import feathers.themes.MaterialIndigoPinkMobileThemeIcons;

    import starling.display.Image;
    import starling.events.Event;

    public class TabBarScreen extends BaseScreen {

        private var mLabel:Label;
        private var mLabel2:Label;
        private var mTabBar:TabBar;
        private var mTabBar2:TabBar;

        public function TabBarScreen() {
            super();
            styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_PANEL_WITHOUT_PADDING );
        }

        override protected function initialize():void {
            super.initialize();

            title = "Tab bar";

            layout = new AnchorLayout();
            clipContent = false; // Avoids occasional white space between the header and the tab bar

            /* Label */
            mLabel = getLabel( -50 );
            addChild( mLabel );

            /* Label 2 */
            mLabel2 = getLabel( 50 );
            addChild( mLabel2 );

            /* Tab bar (-1 AnchorLayoutData avoids occasional white space between the header and the tab bar) */
            mTabBar = getTabBar( new AnchorLayoutData( -1, 0, NaN, 0 ), onTabBarChanged, BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_TAB_BAR_SHADOW_BOTTOM );
            addChild( mTabBar );

            /* Tab bar 2 */
            mTabBar2 = getTabBar( new AnchorLayoutData( NaN, 0, 0, 0 ), onTabBar2Changed );
            addChild( mTabBar2 );

            onTabBarChanged();
            onTabBar2Changed();
        }

        /**
         *
         *
         * Tab bar CHANGE handlers
         *
         *
         */

        private function onTabBarChanged():void {
            mLabel.text = "SELECTED INDEX: " + mTabBar.selectedIndex;
        }

        private function onTabBar2Changed():void {
            mLabel2.text = "SELECTED INDEX: " + mTabBar2.selectedIndex;
        }

        /**
         *
         *
         * Helpers
         *
         *
         */

        private function getLabel( verticalCenter:Number ):Label {
            const label:Label = new Label();
            const labelLayoutData:AnchorLayoutData = new AnchorLayoutData();
            labelLayoutData.horizontalCenter = 0;
            labelLayoutData.verticalCenter = verticalCenter;
            label.layoutData = labelLayoutData;
            return label;
        }

        public function getTabBar( layoutData:AnchorLayoutData, changeHandler:Function, style:String = null ):TabBar {
            const tabBar:TabBar = new TabBar();
            tabBar.dataProvider = new ListCollection(
                    [
                        { label: "ITEM ONE", defaultIcon: new Image( MaterialIndigoPinkMobileThemeIcons.favoriteTexture ) },
                        { label: "ITEM TWO", defaultIcon: new Image( MaterialIndigoPinkMobileThemeIcons.backupTexture ) },
                        { label: "ITEM THREE", defaultIcon: new Image( MaterialIndigoPinkMobileThemeIcons.shareTexture ) }
                    ] );
            tabBar.layoutData = layoutData;
            tabBar.addEventListener( Event.CHANGE, changeHandler );
            /* IMPORTANT: Style 'with icons' must be added before 'shadow bottom' style */
            tabBar.styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_TAB_BAR_WITH_ICONS );
            if( style ) {
                tabBar.styleNameList.add( style );
            }
            return tabBar;
        }

    }

}
