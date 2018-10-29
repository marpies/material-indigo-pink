package com.marpies.demo.screens {

    import com.marpies.utils.HorizontalLayoutBuilder;
    import com.marpies.utils.VerticalLayoutBuilder;

    import feathers.controls.Button;
    import feathers.controls.ButtonGroup;
    import feathers.controls.LayoutGroup;
    import feathers.controls.PickerList;
    import feathers.controls.ToggleButton;

    import feathers.core.IToggle;
    import feathers.data.ListCollection;
    import feathers.layout.Direction;
    import feathers.layout.HorizontalAlign;
    import feathers.layout.VerticalLayout;
    import feathers.layout.VerticalLayoutData;
    import feathers.system.DeviceCapabilities;
    import feathers.themes.BaseMaterialIndigoPinkMobileTheme;

    import feathers.themes.MaterialIndigoPinkMobileThemeIcons;

    import starling.core.Starling;

    import starling.display.Image;

    public class ButtonScreen extends BaseScreen {

        private const buttons:Vector.<Object> = new <Object>[
            /* Regular, Quiet */
            { objectClass: Button, label: "PRIMARY" },
            { objectClass: Button, label: "DISABLED", disabled: true },
            { objectClass: Button, label: "ACCENT", style: BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_BUTTON_ACCENT },
            { objectClass: Button, label: "DISABLED", style: BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_BUTTON_ACCENT, disabled: true },
            { objectClass: Button, label: "PRIMARY", icon: MaterialIndigoPinkMobileThemeIcons.favoriteTexture },
            { objectClass: Button, label: "DISABLED", icon: MaterialIndigoPinkMobileThemeIcons.removeCircleTexture, disabled: true },
            { objectClass: Button, label: "ACCENT", icon: MaterialIndigoPinkMobileThemeIcons.backupTexture, style: BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_BUTTON_ACCENT },
            { objectClass: Button, label: "DISABLED", icon: MaterialIndigoPinkMobileThemeIcons.accountChildTexture, style: BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_BUTTON_ACCENT, disabled: true },
            { objectClass: Button, label: "QUIET", style: Button.ALTERNATE_STYLE_NAME_QUIET_BUTTON },
            { objectClass: Button, label: "DISABLED", disabled: true, style: Button.ALTERNATE_STYLE_NAME_QUIET_BUTTON },
            { objectClass: Button, label: "QUIET", style: BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_BUTTON_ACCENT_QUIET },
            { objectClass: Button, label: "DISABLED", disabled: true, style: BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_BUTTON_ACCENT_QUIET, newLine: true  },
            /* Call to action */
            { objectClass: Button, label: "", style: Button.ALTERNATE_STYLE_NAME_CALL_TO_ACTION_BUTTON },
            { objectClass: Button, label: "", disabled: true, style: Button.ALTERNATE_STYLE_NAME_CALL_TO_ACTION_BUTTON, newLine: true },
            { objectClass: Button, label: "", style: BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_CALL_TO_ACTION_BUTTON_ACCENT },
            { objectClass: Button, label: "", disabled: true, style: BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_CALL_TO_ACTION_BUTTON_ACCENT, newLine: true },
            /* Back, Forward, Toggle */
            { objectClass: Button, label: "BACK", style: Button.ALTERNATE_STYLE_NAME_BACK_BUTTON },
            { objectClass: Button, label: "DISABLED", style: Button.ALTERNATE_STYLE_NAME_BACK_BUTTON, disabled: true },
            { objectClass: Button, label: "FORWARD", style: Button.ALTERNATE_STYLE_NAME_FORWARD_BUTTON },
            { objectClass: Button, label: "DISABLED", style: Button.ALTERNATE_STYLE_NAME_FORWARD_BUTTON, disabled: true },
            { objectClass: ToggleButton, label: "TOGGLE ME" },
            { objectClass: ToggleButton, label: "TOGGLED DISABLED", selected: true, disabled: true },
        ];

        public function ButtonScreen() {
            super();
            styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_HEADER_WITH_SHADOW );
        }

        override protected function initialize():void {
            super.initialize();

            layout = new VerticalLayoutBuilder()
                    .setGap( 10 )
                    .setPadding( 10 )
                    .setHorizontalAlign( HorizontalAlign.CENTER )
                    .build();

            title = "Buttons";
            styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_PANEL_WITHOUT_PADDING );

            /* Add PickerList */
            addPickerList();

            /* Add Buttons */
            const mod:int = DeviceCapabilities.isTablet( Starling.current.nativeStage ) ? 4 : 2;
            var horizontalGroup:LayoutGroup;
            const length:uint = buttons.length;
            for( var i:uint = 0; i < length; ) {
                if( !horizontalGroup ) {
                    horizontalGroup = new LayoutGroup();
                    horizontalGroup.layout = new HorizontalLayoutBuilder().setGap( 5 ).build();
                }
                horizontalGroup.addChild( getButton( buttons[i] ) );
                if( ++i % mod == 0 || i == length ) {
                    addChild( horizontalGroup );
                    horizontalGroup = null;
                }
            }

            /* Add ButtonGroup */
            addButtonGroup();
        }

        private function addButtonGroup():void {
            const group:ButtonGroup = new ButtonGroup();
            group.layoutData = new VerticalLayoutData( 100 );
            group.direction = Direction.HORIZONTAL;
            group.dataProvider = new ListCollection(
                    [
                        { label: "ONE" },
                        { label: "TWO" },
                        { label: "THREE", isEnabled: false },
                    ] );
            addChild( group );
        }

        private function addPickerList():void {
            const list:PickerList = new PickerList();
            var groceryList:ListCollection = new ListCollection(
                    [
                        { text: "MILK" },
                        { text: "EGGS" },
                        { text: "BREAD" },
                        { text: "CHICKEN" },
                        { text: "SALMON" },
                        { text: "POTATOES" },
                        { text: "LEMONS" },
                        { text: "BUTTER" },
                        { text: "WINE" },
                    ]);
            list.dataProvider = groceryList;
            list.listProperties.@itemRendererProperties.labelField = "text";
            list.labelField = "text";
            list.prompt = "SELECT AN ITEM";
            list.selectedIndex = -1;
            addChild( list );
        }

        private function getButton( properties:Object ):Button {
            const btn:Button = new (Class(properties.objectClass))();
            btn.label = properties.label;
            if( "style" in properties ) {
                btn.styleNameList.add( properties.style );
                /* Add icon if it is call-to-action button */
                if( properties.style == Button.ALTERNATE_STYLE_NAME_CALL_TO_ACTION_BUTTON ||
                        properties.style == BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_CALL_TO_ACTION_BUTTON_ACCENT ) {
                    btn.defaultIcon = new Image( MaterialIndigoPinkMobileThemeIcons.shopTexture );
                }
            }
            if( "selected" in properties ) {
                IToggle( btn ).isSelected = true;
            }
            if( "icon" in properties ) {
                btn.defaultIcon = new Image( properties.icon );
            }
            btn.isEnabled = !("disabled" in properties);
            return btn;
        }

    }

}
