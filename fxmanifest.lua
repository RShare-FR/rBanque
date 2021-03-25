fx_version 'adamant'
game { 'gta5' }

client_scripts {
    "@RageUI/src/client/RMenu.lua",
    "@RageUI/src/client/menu/RageUI.lua",
    "@RageUI/src/client/menu/Menu.lua",
    "@RageUI/src/client/menu/MenuController.lua",
    "@RageUI/src/client/components/Audio.lua",
    "@RageUI/src/client/components/Rectangle.lua",
    "@RageUI/src/client/components/Screen.lua",
    "@RageUI/src/client/components/Sprite.lua",
    "@RageUI/src/client/components/Text.lua",
    "@RageUI/src/client/components/Visual.lua",
    "@RageUI/src/client/menu/elements/ItemsBadge.lua",
    "@RageUI/src/client/menu/elements/ItemsColour.lua",
    "@RageUI/src/client/menu/elements/PanelColour.lua",
    "@RageUI/src/client/menu/items/UIButton.lua",
    "@RageUI/src/client/menu/items/UICheckBox.lua",
    "@RageUI/src/client/menu/items/UIList.lua",
    "@RageUI/src/client/menu/items/UIProgress.lua",
    "@RageUI/src/client/menu/items/UISlider.lua",
    "@RageUI/src/client/menu/items/UISeparator.lua",
    "@RageUI/src/client/menu/items/UISliderHeritage.lua",
    "@RageUI/src/client/menu/items/UISliderProgress.lua",
    "@RageUI/src/client/menu/panels/UIColourPanel.lua",
    "@RageUI/src/client/menu/panels/UIGridPanel.lua",
    "@RageUI/src/client/menu/panels/UIGridPanelHorizontal.lua",
    "@RageUI/src/client/menu/panels/UIPercentagePanel.lua",
    "@RageUI/src/client/menu/panels/UIStatisticsPanel.lua",
    "@RageUI/src/client/menu/windows/UIHeritage.lua",
}

------------------------TOUT action ce passe cotés client en gros juste pour le joueur

client_script {
    "cl_bank.lua",
    "function.lua",
    "config.lua"
    
}

------------------------TOUT action ce passe cotés server en gros pour tous le serveur

server_scripts {
    'mysql-async/lib/MySQL.lua',
    "sv_bank.lua",
    "config.lua"
}