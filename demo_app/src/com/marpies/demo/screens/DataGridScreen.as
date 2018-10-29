package com.marpies.demo.screens {

    import feathers.controls.DataGrid;
    import feathers.controls.DataGridColumn;
    import feathers.data.ArrayCollection;
    import feathers.layout.AnchorLayout;
    import feathers.layout.AnchorLayoutData;
    import feathers.themes.BaseMaterialIndigoPinkMobileTheme;

    public class DataGridScreen extends BaseScreen {

        public function DataGridScreen() {
            super();
            styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_HEADER_WITH_SHADOW );
        }

        override protected function initialize():void {
            super.initialize();

            title = "DataGrid";

            layout = new AnchorLayout();

            styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_PANEL_WITHOUT_PADDING );

            var items:Array =
                    [
                        {model: "iPhone 6S", manufacturer: "Apple", price: "399"},
                        {model: "Galaxy Note 8", manufacturer: "Samsung", price: "799"},
                        {model: "Redmi 4X", manufacturer: "Xiaomi", price: "149"},
                        {model: "iPad Pro 9.7", manufacturer: "Apple", price: "449"},
                        {model: "G4", manufacturer: "LG", price: "139"},
                        {model: "Xperia XA1", manufacturer: "Sony", price: "229"},
                        {model: "Galaxy Tab A 10.1", manufacturer: "Samsung", price: "149"},
                        {model: "Pixel 2", manufacturer: "Google", price: "599"}
                    ];
            var columns:Array =
                    [
                        new DataGridColumn( "model", "Model" ),
                        new DataGridColumn( "manufacturer", "Manufacturer" ),
                        new DataGridColumn( "price", "Price" )
                    ];

            var grid:DataGrid = new DataGrid();
            grid.layoutData = new AnchorLayoutData( 0, 0, 0, 0 );
            grid.dataProvider = new ArrayCollection( items );
            grid.columns = new ArrayCollection( columns );
            grid.resizableColumns = true;
            grid.sortableColumns = true;
            grid.reorderColumns = true;
            grid.clipContent = false;
            addChild(grid);
        }
    }

}
