package com.marpies.demo.screens {

    import com.marpies.utils.Constants;
    import com.marpies.utils.VerticalLayoutBuilder;

    import feathers.controls.Check;
    import feathers.controls.GroupedList;
    import feathers.controls.Label;
    import feathers.controls.PickerList;
    import feathers.controls.Slider;
    import feathers.controls.ToggleSwitch;
    import feathers.controls.renderers.DefaultGroupedListItemRenderer;
    import feathers.controls.renderers.IGroupedListItemRenderer;
    import feathers.data.HierarchicalCollection;
    import feathers.data.ListCollection;
    import feathers.layout.VerticalLayoutData;
    import feathers.themes.BaseMaterialIndigoPinkMobileTheme;

    public class CustomItemRendererScreen extends BaseScreen {

        public function CustomItemRendererScreen() {
            super();
            styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_HEADER_WITH_SHADOW );
            styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_PANEL_WITHOUT_PADDING );
        }

        override protected function initialize():void {
            super.initialize();

            title = "Settings";

            layout = new VerticalLayoutBuilder()
                    .setGap( 20 )
                    .build();
            clipContent = false;

            /* Settings list */
            const list:GroupedList = new GroupedList();
            list.dataProvider = new HierarchicalCollection(
                    [
                        {
                            header  : { label: "Sound" },
                            children: [
                                { label: "Music", control: getToggleSwitch() },
                                { label: "Effects", control: getToggleSwitch() },
                                { label: "Master volume", control: getSlider() },
                            ],
                            footer: { label: "Note: our soundtrack is a beauty." }
                        },
                        {
                            header  : { label: "Graphics" },
                            children: [
                                { label: "Particle effects", control: getParticleEffectsList() },
                                { label: "Anti-aliasing", control: getAntiAliasList() },
                                { label: "Shadows", control: getToggleSwitch() },
                            ]
                        },
                        {
                            header  : { label: "Miscellaneous" },
                            children: [
                                { label: "Auto-save", control: getCheckBox() },
                                { label: "Auto-upload high scores*", control: getCheckBox() },
                            ]
                        },
                    ]
            );
            list.itemRendererFactory = function ():IGroupedListItemRenderer {
                const item:DefaultGroupedListItemRenderer = new DefaultGroupedListItemRenderer();
                item.labelField = "label";
                item.accessoryField = "control";
                return item;
            };
            list.layoutData = new VerticalLayoutData( 100 );
            list.clipContent = false;
            list.isSelectable = false;
            list.hasElasticEdges = false;
            addChild( list );

            /* Note */
            const noteLabel:Label = new Label();
            noteLabel.text = "*We also collect and store all your personal info on our servers, thanks!";
            noteLabel.wordWrap = true;
            noteLabel.layoutData = new VerticalLayoutData( 100 );
            noteLabel.styleNameList.add( Label.ALTERNATE_STYLE_NAME_DETAIL );
            noteLabel.paddingBottom = 10;
            addChild( noteLabel );
        }

        /**
         *
         *
         * Helpers
         *
         *
         */

        private function getSlider():Slider {
            const slider:Slider = new Slider();
            slider.width = Constants.stageWidth * 0.33;
            slider.minimum = 0;
            slider.maximum = 100;
            slider.step = 1;
            slider.value = 50;
            return slider;
        }

        private function getCheckBox():Check {
            const check:Check = new Check();
            check.isSelected = Math.random() > 0.5;
            return check;
        }

        private function getToggleSwitch():ToggleSwitch {
            const toggle:ToggleSwitch = new ToggleSwitch();
            toggle.isSelected = Math.random() > 0.5;
            return toggle;
        }

        private function getAntiAliasList():PickerList {
            const list:PickerList = new PickerList();
            list.dataProvider = new ListCollection(
                    [
                        { label: "None" },
                        { label: "2x" },
                        { label: "4x" },
                        { label: "8x" },
                    ]
            );
            list.labelField = "label";
            return list;
        }

        private function getParticleEffectsList():PickerList {
            const list:PickerList = new PickerList();
            list.dataProvider = new ListCollection(
                    [
                        { label: "None" },
                        { label: "Low" },
                        { label: "Medium" },
                        { label: "High" },
                    ]
            );
            list.labelField = "label";
            return list;
        }

    }

}
