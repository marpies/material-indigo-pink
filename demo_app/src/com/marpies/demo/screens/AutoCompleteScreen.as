package com.marpies.demo.screens {

    import com.marpies.utils.VerticalLayoutBuilder;

    import feathers.controls.AutoComplete;
    import feathers.data.ListCollection;
    import feathers.data.LocalAutoCompleteSource;
    import feathers.layout.HorizontalAlign;
    import feathers.layout.VerticalLayout;
    import feathers.themes.BaseMaterialIndigoPinkMobileTheme;

    public class AutoCompleteScreen extends BaseScreen {

        public function AutoCompleteScreen() {
            super();
            styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_HEADER_WITH_SHADOW );
        }

        override protected function initialize():void {
            super.initialize();

            title = "Auto complete";

            layout = new VerticalLayoutBuilder()
                    .setHorizontalAlign( HorizontalAlign.CENTER )
                    .build();

            const input:AutoComplete = new AutoComplete();
            input.prompt = "Fruits. Type 'ap' to see suggestions";
            input.source = new LocalAutoCompleteSource(
                    new ListCollection(
                            new <String>
                                    [
                                        "Apple",
                                        "Apricot",
                                        "Banana",
                                        "Cantaloupe",
                                        "Cherry",
                                        "Grape",
                                        "Lemon",
                                        "Lime",
                                        "Mango",
                                        "Orange",
                                        "Peach",
                                        "Pineapple",
                                        "Plum",
                                        "Pomegranate",
                                        "Raspberry",
                                        "Strawberry",
                                        "Watermelon"
                                    ]
                    )
            );
            addChild( input );
        }

    }

}
