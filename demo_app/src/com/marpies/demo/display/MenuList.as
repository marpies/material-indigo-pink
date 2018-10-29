package com.marpies.demo.display {

    import com.marpies.demo.events.ScreenEvent;
    import com.marpies.demo.screens.Screens;
    import com.marpies.utils.Constants;

    import feathers.controls.List;
    import feathers.controls.renderers.DefaultListItemRenderer;
    import feathers.controls.renderers.IListItemRenderer;
    import feathers.data.ListCollection;
    import feathers.themes.MaterialIndigoPinkMobileThemeIcons;

    import starling.events.Event;

    public class MenuList extends List {

        public function MenuList() {
            super();
        }

        override protected function initialize():void {
            super.initialize();

            dataProvider = new ListCollection(
                    [
                        { screen: Screens.ALERT_CALLOUT, label: "ALERT, CALLOUT", icon: MaterialIndigoPinkMobileThemeIcons.warningTexture },
                        { screen: Screens.AUTO_COMPLETE, label: "AUTO COMPLETE", icon: MaterialIndigoPinkMobileThemeIcons.receiptTexture },
                        { screen: Screens.BUTTON, label: "BUTTONS", icon: MaterialIndigoPinkMobileThemeIcons.viewStreamTexture },
                        { screen: Screens.DATA_GRID, label: "DATA GRID", icon: MaterialIndigoPinkMobileThemeIcons.appsTexture },
                        { screen: Screens.GROUPED_LIST, label: "GROUPED LIST", icon: MaterialIndigoPinkMobileThemeIcons.viewDayTexture },
                        { screen: Screens.ITEM_RENDERER, label: "ITEM RENDERER", icon: MaterialIndigoPinkMobileThemeIcons.dnsTexture },
                        { screen: Screens.LABEL, label: "LABELS", icon: MaterialIndigoPinkMobileThemeIcons.loyaltyTexture },
                        { screen: Screens.LIST, label: "LIST", icon: MaterialIndigoPinkMobileThemeIcons.menuTexture },
                        { screen: Screens.NUMERIC_STEPPER, label: "NUMERIC STEPPER", icon: MaterialIndigoPinkMobileThemeIcons.plusOneTexture },
                        { screen: Screens.PAGE_INDICATOR, label: "PAGE INDICATOR", icon: MaterialIndigoPinkMobileThemeIcons.moreHorizontalTexture },
                        { screen: Screens.PROGRESS_BAR, label: "PROGRESS BAR", icon: MaterialIndigoPinkMobileThemeIcons.removeTexture },
                        { screen: Screens.SLIDER, label: "SLIDER", icon: MaterialIndigoPinkMobileThemeIcons.settingsEthernetTexture },
                        { screen: Screens.SPINNER_LIST, label: "SPINNER LIST", icon: MaterialIndigoPinkMobileThemeIcons.theatersTexture },
                        { screen: Screens.TAB_BAR, label: "TAB BAR", icon: MaterialIndigoPinkMobileThemeIcons.viewWeekTexture },
                        { screen: Screens.TAB_NAVIGATOR, label: "TAB NAVIGATOR", icon: MaterialIndigoPinkMobileThemeIcons.tabTexture },
                        { screen: Screens.TEXT_INPUT, label: "TEXT INPUTS", icon: MaterialIndigoPinkMobileThemeIcons.textFormatTexture },
                        { screen: Screens.TOGGLE, label: "TOGGLES", icon: MaterialIndigoPinkMobileThemeIcons.checkCircleTexture },
                        { screen: Screens.TREE, label: "TREE", icon: MaterialIndigoPinkMobileThemeIcons.sortTexture },
                        { screen: Screens.VIDEO_PLAYER, label: "VIDEO PLAYER", icon: MaterialIndigoPinkMobileThemeIcons.videocamTexture }
                    ]);
            minWidth = Constants.stageWidth >> 2;
            selectedIndex = 0;
            hasElasticEdges = false;
            itemRendererFactory = function():IListItemRenderer {
                const item:DefaultListItemRenderer = new DefaultListItemRenderer();
                item.labelField = "label";
                item.iconSourceField = "icon";
                return item;
            };
            clipContent = false;
            addEventListener( Event.CHANGE, onMenuChanged );
        }

        private function onMenuChanged():void {
            const screenName:String = selectedItem.screen as String;
            dispatchEventWith( ScreenEvent.SWITCH, false, { screen: screenName } );
        }

    }

}
