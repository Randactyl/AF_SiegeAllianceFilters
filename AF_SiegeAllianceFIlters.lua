local AD = 1
local EP = 2
local DC = 3
local ANY = 4

local util = AdvancedFilters.util

local lookup = {
    ["27105"] = AD, --Dominion Firepot Trebuchet
    ["27136"] = AD, --Dominion Battering Ram
    ["27964"] = AD, --Dominion Meatbag Catapult
    ["27967"] = AD, --Dominion Oil Catapult
    ["27970"] = AD, --Dominion Fire Ballista
    ["27973"] = AD, --Dominion Lightning Ballista
    ["29533"] = AD, --Dominion Forward Camp
    ["36567"] = AD, --Dominion Ballista
    ["44768"] = AD, --Dominion Iceball Trebuchet
    ["44769"] = AD, --Dominion Stone Trebuchet
    ["44770"] = AD, --Dominion Scattershot Catapult
    ["44920"] = AD, --Limited Dominion Forward Camp
    ["64512"] = AD, --Dominion Cold Fire Trebuchet
    ["64515"] = AD, --Dominion Cold Fire Ballista
    ["64520"] = AD, --Dominion Cold Stone Trebuchet

    ["27114"] = EP, --Pact Firepot Trebuchet
    ["27850"] = EP, --Pact Battering Ram
    ["27965"] = EP, --Pact Meatbag Catapult
    ["27968"] = EP, --Pact Oil Catapult
    ["27971"] = EP, --Pact Fire Ballista
    ["27974"] = EP, --Pact Lightning Ballista
    ["29534"] = EP, --Pact Forward Camp
    ["36568"] = EP, --Pact Ballista
    ["44775"] = EP, --Pact Iceball Trebuchet
    ["44776"] = EP, --Pact Stone Trebuchet
    ["44777"] = EP, --Pact Scattershot Catapult
    ["44921"] = EP, --Limited Pact Forward Camp
    ["64513"] = EP, --Pact Cold Fire Trebuchet
    ["64516"] = EP, --Pact Cold Fire Ballista
    ["64519"] = EP, --Pact Cold Stone Trebuchet

    ["27115"] = DC, --Covenant Firepot Trebuchet
    ["27835"] = DC, --Covenant Battering Ram
    ["27966"] = DC, --Covenant Meatbag Catapult
    ["27969"] = DC, --Covenant Oil Catapult
    ["27972"] = DC, --Covenant Fire Ballista
    ["27975"] = DC, --Covenant Lightning Ballista
    ["29535"] = DC, --Covenant Forward Camp
    ["36569"] = DC, --Covenant Ballista
    ["44771"] = DC, --Covenant Iceball Trebuchet
    ["44772"] = DC, --Covenant Stone Trebuchet
    ["44773"] = DC, --Covenant Scattershot Catapult
    ["44922"] = DC, --Limited Covenant Forward Camp
    ["64514"] = DC, --Covenant Cold Fire Trebuchet
    ["64517"] = DC, --Covenant Cold Fire Ballista
    ["64518"] = DC, --Covenant Cold Stone Trebuchet

    ["30359"] = ANY, --Flaming Oil
}

local function GetFilterCallbackAlliance(alliance)
    return function(slot)
        local itemLink = util.GetItemLink(slot)
        local itemId = select(4, ZO_LinkHandler_ParseLink(itemLink))

        if lookup[itemId] == alliance or lookup[itemId] == ANY then return true end
    end
end

local siegeAllianceDropdownCallbacks = {
    {name = "AD", filterCallback = GetFilterCallbackAlliance(AD)},
    {name = "EP", filterCallback = GetFilterCallbackAlliance(EP)},
    {name = "DC", filterCallback = GetFilterCallbackAlliance(DC)},
}

local strings = {
    AD = GetString("SI_ALLIANCE", AD),
    EP = GetString("SI_ALLIANCE", EP),
    DC = GetString("SI_ALLIANCE", DC),
}

local filterInformation = {
    callbackTable = siegeAllianceDropdownCallbacks,
    filterType = ITEMFILTERTYPE_MISCELLANEOUS,
    subfilters = {"Siege",},
    enStrings = strings,
}
AdvancedFilters_RegisterFilter(filterInformation)