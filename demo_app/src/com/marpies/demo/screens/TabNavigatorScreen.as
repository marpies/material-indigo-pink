package com.marpies.demo.screens {

    import com.marpies.demo.screens.tabs.TabScreen1;
    import com.marpies.demo.screens.tabs.TabScreen2;
    import com.marpies.demo.screens.tabs.TabScreen3;

    import feathers.controls.TabNavigator;
    import feathers.controls.TabNavigatorItem;
    import feathers.layout.AnchorLayout;
    import feathers.layout.AnchorLayoutData;
    import feathers.layout.RelativePosition;
    import feathers.themes.BaseMaterialIndigoPinkMobileTheme;
    import feathers.themes.MaterialIndigoPinkMobileThemeIcons;

    import starling.display.Image;

    public class TabNavigatorScreen extends BaseScreen {

        public function TabNavigatorScreen() {
            super();
        }

        override protected function initialize():void {
            super.initialize();

            title = "TAB NAVIGATOR";

            layout = new AnchorLayout();
            styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_PANEL_WITHOUT_PADDING );

            var tabNavigator:TabNavigator = new TabNavigator();
            tabNavigator.addScreen( "tab-1", new TabNavigatorItem( TabScreen1, "TAB #1", new Image( MaterialIndigoPinkMobileThemeIcons.archiveTexture ) ) );
            tabNavigator.addScreen( "tab-2", new TabNavigatorItem( TabScreen2, "TAB #2", new Image( MaterialIndigoPinkMobileThemeIcons.favoriteTexture ) ) );
            tabNavigator.addScreen( "tab-3", new TabNavigatorItem( TabScreen3, "TAB #3", new Image( MaterialIndigoPinkMobileThemeIcons.shareTexture ) ) );
            tabNavigator.layoutData = new AnchorLayoutData( 0, 0, 0, 0 );
            tabNavigator.styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_TAB_NAVIGATOR_WITH_ICONS );
            tabNavigator.styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_TAB_NAVIGATOR_SHADOW_BOTTOM );
            tabNavigator.tabBarPosition = RelativePosition.TOP;
            addChild( tabNavigator );
        }

    }

}
