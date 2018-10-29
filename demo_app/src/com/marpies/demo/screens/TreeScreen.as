package com.marpies.demo.screens {

	import feathers.controls.Tree;
	import feathers.controls.renderers.DefaultTreeItemRenderer;
	import feathers.controls.renderers.ITreeItemRenderer;
	import feathers.data.HierarchicalCollection;
	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;
	import feathers.themes.BaseMaterialIndigoPinkMobileTheme;

	public class TreeScreen extends BaseScreen {

        public function TreeScreen() {
            super();
            styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_HEADER_WITH_SHADOW );
        }

        override protected function initialize():void {
            super.initialize();

            title = "Tree";
            layout = new AnchorLayout();
            styleNameList.add( BaseMaterialIndigoPinkMobileTheme.THEME_STYLE_NAME_PANEL_WITHOUT_PADDING );

            const list:Tree = new Tree();
            list.dataProvider = new HierarchicalCollection( treeData );
            list.isSelectable = true;
            list.clipContent = false;
            list.layoutData = new AnchorLayoutData( 0, 0, 0, 0 );
            list.itemRendererFactory = function ():ITreeItemRenderer {
                var item:DefaultTreeItemRenderer = new DefaultTreeItemRenderer();
                item.isQuickHitAreaEnabled = true;
                item.labelField = "text";
                return item;
            };
            addChild( list );
        }

        private function get treeData():Array {
            return [
                {
                    text: "Node 1",
                    children: [
                        { text: "Node 1A" },
                        { text: "Node 1B" },
                        { text: "Node 1C" },
                        { text: "Node 1D" }
                    ]
                },
                {
                    text: "Node 2",
                    children: [
                        { text: "Node 2A" },
                        { text: "Node 2B" },
                        { text: "Node 2C",
                            children: [
                                { text: "Node 2C-I" },
                                { text: "Node 2C-II" }
                            ]
                        },
                        { text: "Node 2D" },
                        { text: "Node 2E",
                            children: [
                                { text: "Node 2E-I" },
                                { text: "Node 2E-II" },
                                { text: "Node 2E-III" },
                                { text: "Node 2E-IV" },
                                { text: "Node 2E-V" },
                                { text: "Node 2E-VI" }
                            ]
                        }
                    ]
                },
                {
                    text: "Node 3",
                    children: [
                        { text: "Node 3A" },
                        { text: "Node 3B" },
                        { text: "Node 3C" },
                        { text: "Node 3D" },
                        { text: "Node 3E" },
                        { text: "Node 3F" },
                        { text: "Node 3G" }
                    ]
                },
                {
                    text: "Node 4"
                },
                {
                    text: "Node 5",
                    children: [
                        { text: "Node 5A",
                            children: [
                                { text: "Node 5A-I",
                                    children: [
                                        { text: "Node 5A-I-i" },
                                        { text: "Node 5A-I-ii" }
                                    ] }
                            ] },
                        { text: "Node 5B" },
                        { text: "Node 5C",
                            children: [
                                { text: "Node 5C-I" },
                                { text: "Node 5C-II" }
                            ]
                        },
                        { text: "Node 5D",
                            children: [
                                { text: "Node 5D-I" },
                                { text: "Node 5D-II" },
                                { text: "Node 5D-III" }
                            ]
                        },
                        { text: "Node 5E" }
                    ]
                },
                {
                    text: "Node 6",
                    children: [
                        { text: "Node 6A" },
                        { text: "Node 6B" }
                    ]
                }
            ];
        }

    }

}
