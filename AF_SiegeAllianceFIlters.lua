local AD = 1
local EP = 2
local DC = 3

local lookup = {
   ["29533"] = AD, --Dominion Forward Camp
   ["27136"] = AD, --Dominion Battering Ram
   ["36567"] = AD, --Dominion Ballista
   ["27970"] = AD, --Dominion Fire Ballista
   ["27973"] = AD, --Dominion Lightning Ballista
   ["27105"] = AD, --Dominion Firepot Trebuchet
   ["44768"] = AD, --Dominion Iceball Trebuchet
   ["44769"] = AD, --Dominion Stone Trebuchet
   ["27964"] = AD, --Dominion Meatbag Catapult
   ["27967"] = AD, --Dominion Oil Catapult
   ["44770"] = AD, --Dominion Scattershot Catapult
 
   ["29534"] = EP, --Pact Forward Camp
   ["44921"] = EP, --Limited Pact Forward Camp
   ["27850"] = EP, --Pact Battering Ram
   ["36568"] = EP, --Pact Ballista
   ["27971"] = EP, --Pact Fire Ballista
   ["27974"] = EP, --Pact Lightning Ballista
   ["27114"] = EP, --Pact Firepot Trebuchet
   ["44775"] = EP, --Pact Iceball Trebuchet
   ["44776"] = EP, --Pact Stone Trebuchet
   ["27965"] = EP, --Pact Meatbag Catapult
   ["27968"] = EP, --Pact Oil Catapult
   ["44777"] = EP, --Pact Scattershot Catapult

   ["29535"] = DC, --Covenant Forward Camp
   ["27835"] = DC, --Covenant Battering Ram
   ["36569"] = DC, --Covenant Ballista
   ["27972"] = DC, --Covenant Fire Ballista
   ["27975"] = DC, --Covenant Lightning Ballista
   ["27115"] = DC, --Covenant Firepot Trebuchet
   ["44771"] = DC, --Covenant Iceball Trebuchet
   ["44772"] = DC, --Covenant Stone Trebuchet
   ["27966"] = DC, --Covenant Meatbag Catapult
   ["27969"] = DC, --Covenant Oil Catapult
   ["44773"] = DC, --Covenant Scattershot Catapult
}

local function GetFilterCallbackAlliance(alliance)
   return function( slot )
      local bagId = slot.dataEntry.data.bagId
      local slotIndex = slot.dataEntry.data.slotIndex

      local itemId = select(4, ZO_LinkHandler_ParseLink(GetItemLink(bagId, slotIndex)))
      if lookup[itemId] == alliance then return true end
      return false
   end
end

local siegeAllianceDropdownCallbacks = {
   [1] = { name = "AD", filterCallback = GetFilterCallbackAlliance(AD) },
   [2] = { name = "EP", filterCallback = GetFilterCallbackAlliance(EP) },
   [3] = { name = "DC", filterCallback = GetFilterCallbackAlliance(DC) },
}

local strings = {
   ["AD"] = GetString("SI_ALLIANCE", AD),
   ["EP"] = GetString("SI_ALLIANCE", EP),
   ["DC"] = GetString("SI_ALLIANCE", DC),
}

local filterInformation = {
   callbackTable = siegeAllianceDropdownCallbacks,
   filterType = ITEMFILTERTYPE_MISCELLANEOUS,
   subfilters = {
      [1] = "Siege",
   },
   enStrings = strings,
}

AdvancedFilters_RegisterFilter(filterInformation)