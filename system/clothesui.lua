local Clothesui = {}
local function loadTranslations()
    local file = io.open("trad/Description.json", "r")
    if not file then return {} end

    local content = file:read("*a")
    file:close()

    local translationstests, _, err = json.decode(content)
    if err then
        print("❌ Erreur de décodage JSON :", err)
        return {}
    end

    -- Extraire les descriptions communes
    local common_descriptions = translationstests.common_descriptions

    -- Parcourir les entrées du JSON
    for _, desc in pairs(translationstests) do
        if type(desc) == "table" then
            for key, value in pairs(desc) do
                -- On ne traite que les champs texte "en" ou "trad"
                if (key == "en" or key == "trad") and type(value) == "string" then
                    -- Remplacer tous les placeholders présents dans value
                    for placeholder, replacement in pairs(common_descriptions) do
                        local pattern = "{" .. placeholder .. "}"
                        local replacement_value = replacement[key] or "❌missing"
                        value = value:gsub(pattern, replacement_value)
                    end
                    -- Sauvegarder la version modifiée
                    desc[key] = value
                end
            end
        end
    end

    return translationstests
end

local translationstests = loadTranslations() or {}
local clothes = require("data/clothes")
local groupedclothes = {
    Heads_northhside = {},
    Faces_northhside = {},
    Feets_northhside = {},
    InnerTorsos_northhside = {},
    Legss_northhside = {},
    OuterTorsos_northhside = {},
    Heads_kabuki = {},
    Faces_kabuki = {},
    Feets_kabuki = {},
    InnerTorsos_kabuki = {},
    Legss_kabuki = {},
    OuterTorsos_kabuki = {},
    Heads_little_china = {},
    Faces_little_china = {},
    Feets_little_china = {},
    InnerTorsos_little_china = {},
    Legss_little_china = {},
    OuterTorsos_little_china = {},
    Heads_Japantown = {},
    Faces_Japantown = {},
    Feets_Japantown = {},
    InnerTorsos_Japantown = {},
    Legss_Japantown = {},
    OuterTorsos_Japantown = {},
    Heads_Karim_Noel = {},
    Faces_Karim_Noel = {},
    Feets_Karim_Noel = {},
    InnerTorsos_Karim_Noel = {},
    Legss_Karim_Noel = {},
    OuterTorsos_Karim_Noel = {},
    Heads_Charter_Hill = {},
    Faces_Charter_Hill = {},
    Feets_Charter_Hill = {},
    InnerTorsos_Charter_Hill = {},
    Legss_Charter_Hill = {},
    OuterTorsos_Charter_Hill = {},
    Heads_Zane_Jagger = {},
    Faces_Zane_Jagger = {},
    Feets_Zane_Jagger = {},
    InnerTorsos_Zane_Jagger = {},
    Legss_Zane_Jagger = {},
    OuterTorsos_Zane_Jagger = {},
    Heads_corpo_plaza = {},
    Faces_corpo_plaza = {},
    Feets_corpo_plaza = {},
    InnerTorsos_corpo_plaza = {},
    Legss_corpo_plaza = {},
    OuterTorsos_corpo_plaza = {},
    Heads_Wellsprings = {},
    Faces_Wellsprings = {},
    Feets_Wellsprings = {},
    InnerTorsos_Wellsprings = {},
    Legss_Wellsprings = {},
    OuterTorsos_Wellsprings = {},
    Heads_arroyo = {},
    Faces_arroyo = {},
    Feets_arroyo = {},
    InnerTorsos_arroyo = {},
    Legss_arroyo = {},
    OuterTorsos_arroyo = {},
    Heads_rancho_coronado = {},
    Feets_rancho_coronado = {},
    InnerTorsos_rancho_coronado = {},
    Legss_rancho_coronado = {},
    OuterTorsos_rancho_coronado = {},
    Heads_west_wind_estate = {},
    Faces_west_wind_estate = {},
    Feets_west_wind_estate = {},
    InnerTorsos_west_wind_estate = {},
    Legss_west_wind_estate = {},
    OuterTorsos_west_wind_estate = {},
    Heads_david_walker = {},
    Faces_david_walker = {},
    Feets_david_walker = {},
    InnerTorsos_david_walker = {},
    Legss_david_walker = {},
    OuterTorsos_david_walker = {},
    Heads_satoshi_ueno = {},
    Faces_satoshi_ueno = {},
    Feets_satoshi_ueno = {},
    InnerTorsos_satoshi_ueno = {},
    Legss_satoshi_ueno = {},
    OuterTorsos_satoshi_ueno = {},
    Heads_red_peaks = {},
    Faces_red_peaks = {},
    Feets_red_peaks = {},
    InnerTorsos_red_peaks = {},
    Legss_red_peaks = {},
    OuterTorsos_red_peaks = {},
    -- Haeds_other = {},
    Johnny_Silverhand_set = {},
    V_corpo_set = {},
    V_nomad_set = {},
    V_streetkid_set = {},
    V_The_Rescue_set = {},
    Yorinubo_set = {},
    MaxTac_set = {},
    NUS_Agent_set = {},
    The_Star_set = {},
    The_sun_set = {},
    Temperance_set = {},
    Cop_set = {},
    Corporate_set = {},
    Fixer_set = {},
    Media_set = {},
    Netrunner_set = {},
    Nomad_set = {},
    Rocker_set = {},
    Solo_set = {},
    Techie_set = {}
}
ATT.translations            = require("trad/Interface")
ATT.selectedLanguage        = "en"

local function T(key)
    return ATT.translations[ATT.selectedLanguage][key] or key
end
-- local function loadTranslations()
--     local file = io.open("trad/Description.json", "r")
--     if not file then return {} end
    
--     local content = file:read("*a")
--     file:close()
    
--     local translationstests, _, err = json.decode(content)
--     if err then
--         print("❌ Erreur de décodage JSON :", err)
--         return {}
--     end
    
--     return translationstests
-- end

-- local translationstests = loadTranslations() or {}  -- ✅ Sécurisation

for _, head in ipairs(clothes.heads_northhside) do
    local headData = {
     recordID = head[1],
     name = head[2],
     acquisitionID = head[3]
    }
   local acquisitionData = translationstests[headData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
 
     if not groupedclothes.Heads_northhside[headData.name] then
         groupedclothes.Heads_northhside[headData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Heads_northhside[headData.name].recordIDs, headData.recordID)
 end
 for _, face in ipairs(clothes.faces_northhside) do
  local faceData = {
     recordID = face[1],
     name = face[2],
     acquisitionID = face[3]
    }
   local acquisitionData = translationstests[faceData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
 
     if not groupedclothes.Faces_northhside[faceData.name] then
         groupedclothes.Faces_northhside[faceData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Faces_northhside[faceData.name].recordIDs, faceData.recordID)
 end
 for _, feet in ipairs(clothes.feets_northhside) do
  local feetData = {
     recordID = feet[1],
     name = feet[2],
     acquisitionID = feet[3]
    }
    local acquisitionData = translationstests[feetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Feets_northhside[feetData.name] then
       groupedclothes.Feets_northhside[feetData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Feets_northhside[feetData.name].recordIDs, feetData.recordID)
 end
 for _, innertorso in ipairs(clothes.innertorsos_northhside) do
  local innertorsoData = {
     recordID = innertorso[1],
     name = innertorso[2],
     acquisitionID = innertorso[3]
    }
    local acquisitionData = translationstests[innertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.InnerTorsos_northhside[innertorsoData.name] then
     groupedclothes.InnerTorsos_northhside[innertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.InnerTorsos_northhside[innertorsoData.name].recordIDs, innertorsoData.recordID)
 end
 for _, legs in ipairs(clothes.legss_northhside) do
  local legsData = {
     recordID = legs[1],
     name = legs[2],
     acquisitionID = legs[3]
   }
   local acquisitionData = translationstests[legsData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
 
   if not groupedclothes.Legss_northhside[legsData.name] then
     groupedclothes.Legss_northhside[legsData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Legss_northhside[legsData.name].recordIDs, legsData.recordID)
 end
 for _, outertorso in ipairs(clothes.outertorsos_northhside) do
  local outertorsoData = {
     recordID = outertorso[1],
     name = outertorso[2],
     acquisitionID = outertorso[3]
    }
    local acquisitionData = translationstests[outertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.OuterTorsos_northhside[outertorsoData.name] then
     groupedclothes.OuterTorsos_northhside[outertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.OuterTorsos_northhside[outertorsoData.name].recordIDs, outertorsoData.recordID)
 end
 
 for _, head in ipairs(clothes.heads_kabuki) do
  local headData = {
     recordID = head[1],
     name = head[2],
     acquisitionID = head[3]
    }
    local acquisitionData = translationstests[headData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Heads_kabuki[headData.name] then
         groupedclothes.Heads_kabuki[headData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Heads_kabuki[headData.name].recordIDs, headData.recordID)
 end
 for _, face in ipairs(clothes.faces_kabuki) do
  local faceData = {
     recordID = face[1],
     name = face[2],
     acquisitionID = face[3]
    }
    local acquisitionData = translationstests[faceData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Faces_kabuki[faceData.name] then
         groupedclothes.Faces_kabuki[faceData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Faces_kabuki[faceData.name].recordIDs, faceData.recordID)
 end
 for _, feet in ipairs(clothes.feets_kabuki) do
  local feetData = {
     recordID = feet[1],
     name = feet[2],
     acquisitionID = feet[3]
    }
    local acquisitionData = translationstests[feetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Feets_kabuki[feetData.name] then
       groupedclothes.Feets_kabuki[feetData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Feets_kabuki[feetData.name].recordIDs, feetData.recordID)
 end
 for _, innertorso in ipairs(clothes.innertorsos_kabuki) do
  local innertorsoData = {
     recordID = innertorso[1],
     name = innertorso[2],
     acquisitionID = innertorso[3]
    }
    local acquisitionData = translationstests[innertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.InnerTorsos_kabuki[innertorsoData.name] then
     groupedclothes.InnerTorsos_kabuki[innertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.InnerTorsos_kabuki[innertorsoData.name].recordIDs, innertorsoData.recordID)
 end
 for _, legs in ipairs(clothes.legss_kabuki) do
  local legsData = {
     recordID = legs[1],
     name = legs[2],
     acquisitionID = legs[3]
    }
    local acquisitionData = translationstests[legsData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Legss_kabuki[legsData.name] then
     groupedclothes.Legss_kabuki[legsData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Legss_kabuki[legsData.name].recordIDs, legsData.recordID)
 end
 for _, outertorso in ipairs(clothes.outertorsos_kabuki) do
  local outertorsoData = {
     recordID = outertorso[1],
     name = outertorso[2],
     acquisitionID = outertorso[3]
    }
    local acquisitionData = translationstests[outertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.OuterTorsos_kabuki[outertorsoData.name] then
     groupedclothes.OuterTorsos_kabuki[outertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.OuterTorsos_kabuki[outertorsoData.name].recordIDs, outertorsoData.recordID)
 end
 
 for _, head in ipairs(clothes.heads_little_china) do
  local headData = {
     recordID = head[1],
     name = head[2],
     acquisitionID = head[3]
    }
    local acquisitionData = translationstests[headData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Heads_little_china[headData.name] then
         groupedclothes.Heads_little_china[headData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Heads_little_china[headData.name].recordIDs, headData.recordID)
 end
 for _, face in ipairs(clothes.faces_little_china) do
  local faceData = {
     recordID = face[1],
     name = face[2],
     acquisitionID = face[3]
    }
    local acquisitionData = translationstests[faceData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Faces_little_china[faceData.name] then
         groupedclothes.Faces_little_china[faceData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Faces_little_china[faceData.name].recordIDs, faceData.recordID)
 end
 for _, feet in ipairs(clothes.feets_little_china) do
  local feetData = {
     recordID = feet[1],
     name = feet[2],
     acquisitionID = feet[3]
    }
    local acquisitionData = translationstests[feetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Feets_little_china[feetData.name] then
       groupedclothes.Feets_little_china[feetData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Feets_little_china[feetData.name].recordIDs, feetData.recordID)
 end
 for _, innertorso in ipairs(clothes.innertorsos_little_china) do
  local innertorsoData = {
     recordID = innertorso[1],
     name = innertorso[2],
     acquisitionID = innertorso[3]
    }
    local acquisitionData = translationstests[innertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.InnerTorsos_little_china[innertorsoData.name] then
     groupedclothes.InnerTorsos_little_china[innertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.InnerTorsos_little_china[innertorsoData.name].recordIDs, innertorsoData.recordID)
 end
 for _, legs in ipairs(clothes.legss_little_china) do
  local legsData = {
     recordID = legs[1],
     name = legs[2],
     acquisitionID = legs[3]
    }
    local acquisitionData = translationstests[legsData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Legss_little_china[legsData.name] then
     groupedclothes.Legss_little_china[legsData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Legss_little_china[legsData.name].recordIDs, legsData.recordID)
 end
 for _, outertorso in ipairs(clothes.outertorsos_little_china) do
  local outertorsoData = {
     recordID = outertorso[1],
     name = outertorso[2],
     acquisitionID = outertorso[3]
    }
    local acquisitionData = translationstests[outertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
 
   if not groupedclothes.OuterTorsos_little_china[outertorsoData.name] then
     groupedclothes.OuterTorsos_little_china[outertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.OuterTorsos_little_china[outertorsoData.name].recordIDs, outertorsoData.recordID)
 end
 
 for _, head in ipairs(clothes.heads_Japantown) do
  local headData = {
     recordID = head[1],
     name = head[2],
     acquisitionID = head[3]
    }
    local acquisitionData = translationstests[headData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Heads_Japantown[headData.name] then
         groupedclothes.Heads_Japantown[headData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Heads_Japantown[headData.name].recordIDs, headData.recordID)
 end
 for _, face in ipairs(clothes.faces_Japantown) do
  local faceData = {
     recordID = face[1],
     name = face[2],
     acquisitionID = face[3]
    }
    local acquisitionData = translationstests[faceData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Faces_Japantown[faceData.name] then
         groupedclothes.Faces_Japantown[faceData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Faces_Japantown[faceData.name].recordIDs, faceData.recordID)
 end
 for _, feet in ipairs(clothes.feets_Japantown) do
  local feetData = {
     recordID = feet[1],
     name = feet[2],
     acquisitionID = feet[3]
    }
    local acquisitionData = translationstests[feetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Feets_Japantown[feetData.name] then
       groupedclothes.Feets_Japantown[feetData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Feets_Japantown[feetData.name].recordIDs, feetData.recordID)
 end
 for _, innertorso in ipairs(clothes.innertorsos_Japantown) do
  local innertorsoData = {
     recordID = innertorso[1],
     name = innertorso[2],
     acquisitionID = innertorso[3]
    }
    local acquisitionData = translationstests[innertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.InnerTorsos_Japantown[innertorsoData.name] then
     groupedclothes.InnerTorsos_Japantown[innertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.InnerTorsos_Japantown[innertorsoData.name].recordIDs, innertorsoData.recordID)
 end
 for _, legs in ipairs(clothes.legss_Japantown) do
  local legsData = {
     recordID = legs[1],
     name = legs[2],
     acquisitionID = legs[3]
    }
    local acquisitionData = translationstests[legsData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Legss_Japantown[legsData.name] then
     groupedclothes.Legss_Japantown[legsData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Legss_Japantown[legsData.name].recordIDs, legsData.recordID)
 end
 for _, outertorso in ipairs(clothes.outertorsos_Japantown) do
  local outertorsoData = {
     recordID = outertorso[1],
     name = outertorso[2],
     acquisitionID = outertorso[3]
    }
    local acquisitionData = translationstests[outertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.OuterTorsos_Japantown[outertorsoData.name] then
     groupedclothes.OuterTorsos_Japantown[outertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.OuterTorsos_Japantown[outertorsoData.name].recordIDs, outertorsoData.recordID)
 end
 
 for _, head in ipairs(clothes.heads_Karim_Noel) do
  local headData = {
     recordID = head[1],
     name = head[2],
     acquisitionID = head[3]
    }
    local acquisitionData = translationstests[headData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Heads_Karim_Noel[headData.name] then
         groupedclothes.Heads_Karim_Noel[headData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Heads_Karim_Noel[headData.name].recordIDs, headData.recordID)
 end
 for _, face in ipairs(clothes.faces_Karim_Noel) do
  local faceData = {
     recordID = face[1],
     name = face[2],
     acquisitionID = face[3]
    }
    local acquisitionData = translationstests[faceData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Faces_Karim_Noel[faceData.name] then
         groupedclothes.Faces_Karim_Noel[faceData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Faces_Karim_Noel[faceData.name].recordIDs, faceData.recordID)
 end
 for _, feet in ipairs(clothes.feets_Karim_Noel) do
  local feetData = {
     recordID = feet[1],
     name = feet[2],
     acquisitionID = feet[3]
    }
    local acquisitionData = translationstests[feetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Feets_Karim_Noel[feetData.name] then
       groupedclothes.Feets_Karim_Noel[feetData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Feets_Karim_Noel[feetData.name].recordIDs, feetData.recordID)
 end
 for _, innertorso in ipairs(clothes.innertorsos_Karim_Noel) do
  local innertorsoData = {
     recordID = innertorso[1],
     name = innertorso[2],
     acquisitionID = innertorso[3]
    }
    local acquisitionData = translationstests[innertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.InnerTorsos_Karim_Noel[innertorsoData.name] then
     groupedclothes.InnerTorsos_Karim_Noel[innertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.InnerTorsos_Karim_Noel[innertorsoData.name].recordIDs, innertorsoData.recordID)
 end
 for _, legs in ipairs(clothes.legss_Karim_Noel) do
  local legsData = {
     recordID = legs[1],
     name = legs[2],
     acquisitionID = legs[3]
    }
    local acquisitionData = translationstests[legsData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Legss_Karim_Noel[legsData.name] then
     groupedclothes.Legss_Karim_Noel[legsData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Legss_Karim_Noel[legsData.name].recordIDs, legsData.recordID)
 end
 for _, outertorso in ipairs(clothes.outertorsos_Karim_Noel) do
  local outertorsoData = {
     recordID = outertorso[1],
     name = outertorso[2],
     acquisitionID = outertorso[3]
    }
    local acquisitionData = translationstests[outertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.OuterTorsos_Karim_Noel[outertorsoData.name] then
     groupedclothes.OuterTorsos_Karim_Noel[outertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.OuterTorsos_Karim_Noel[outertorsoData.name].recordIDs, outertorsoData.recordID)
 end
 
 for _, head in ipairs(clothes.heads_Charter_Hill) do
  local headData = {
     recordID = head[1],
     name = head[2],
     acquisitionID = head[3]
    }
    local acquisitionData = translationstests[headData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Heads_Charter_Hill[headData.name] then
         groupedclothes.Heads_Charter_Hill[headData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Heads_Charter_Hill[headData.name].recordIDs, headData.recordID)
 end
 for _, face in ipairs(clothes.faces_Charter_Hill) do
  local faceData = {
     recordID = face[1],
     name = face[2],
     acquisitionID = face[3]
    }
    local acquisitionData = translationstests[faceData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Faces_Charter_Hill[faceData.name] then
         groupedclothes.Faces_Charter_Hill[faceData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Faces_Charter_Hill[faceData.name].recordIDs, faceData.recordID)
 end
 for _, feet in ipairs(clothes.feets_Charter_Hill) do
  local feetData = {
     recordID = feet[1],
     name = feet[2],
     acquisitionID = feet[3]
    }
    local acquisitionData = translationstests[feetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Feets_Charter_Hill[feetData.name] then
       groupedclothes.Feets_Charter_Hill[feetData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Feets_Charter_Hill[feetData.name].recordIDs, feetData.recordID)
 end
 for _, innertorso in ipairs(clothes.innertorsos_Charter_Hill) do
  local innertorsoData = {
     recordID = innertorso[1],
     name = innertorso[2],
     acquisitionID = innertorso[3]
    }
    local acquisitionData = translationstests[innertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.InnerTorsos_Charter_Hill[innertorsoData.name] then
     groupedclothes.InnerTorsos_Charter_Hill[innertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.InnerTorsos_Charter_Hill[innertorsoData.name].recordIDs, innertorsoData.recordID)
 end
 for _, legs in ipairs(clothes.legss_Charter_Hill) do
  local legsData = {
     recordID = legs[1],
     name = legs[2],
     acquisitionID = legs[3]
    }
    local acquisitionData = translationstests[legsData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Legss_Charter_Hill[legsData.name] then
     groupedclothes.Legss_Charter_Hill[legsData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Legss_Charter_Hill[legsData.name].recordIDs, legsData.recordID)
 end
 for _, outertorso in ipairs(clothes.outertorsos_Charter_Hill) do
  local outertorsoData = {
     recordID = outertorso[1],
     name = outertorso[2],
     acquisitionID = outertorso[3]
    }
    local acquisitionData = translationstests[outertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.OuterTorsos_Charter_Hill[outertorsoData.name] then
     groupedclothes.OuterTorsos_Charter_Hill[outertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.OuterTorsos_Charter_Hill[outertorsoData.name].recordIDs, outertorsoData.recordID)
 end
 for _, head in ipairs(clothes.heads_Zane_Jagger) do
  local headData = {
     recordID = head[1],
     name = head[2],
     acquisitionID = head[3]
    }
    local acquisitionData = translationstests[headData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Heads_Zane_Jagger[headData.name] then
         groupedclothes.Heads_Zane_Jagger[headData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Heads_Zane_Jagger[headData.name].recordIDs, headData.recordID)
 end
 for _, face in ipairs(clothes.faces_Zane_Jagger) do
  local faceData = {
     recordID = face[1],
     name = face[2],
     acquisitionID = face[3]
    }
    local acquisitionData = translationstests[faceData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Faces_Zane_Jagger[faceData.name] then
         groupedclothes.Faces_Zane_Jagger[faceData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Faces_Zane_Jagger[faceData.name].recordIDs, faceData.recordID)
 end
 for _, feet in ipairs(clothes.feets_Zane_Jagger) do
  local feetData = {
     recordID = feet[1],
     name = feet[2],
     acquisitionID = feet[3]
    }
    local acquisitionData = translationstests[feetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Feets_Zane_Jagger[feetData.name] then
       groupedclothes.Feets_Zane_Jagger[feetData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Feets_Zane_Jagger[feetData.name].recordIDs, feetData.recordID)
 end
 for _, innertorso in ipairs(clothes.innertorsos_Zane_Jagger) do
  local innertorsoData = {
     recordID = innertorso[1],
     name = innertorso[2],
     acquisitionID = innertorso[3]
    }
    local acquisitionData = translationstests[innertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.InnerTorsos_Zane_Jagger[innertorsoData.name] then
     groupedclothes.InnerTorsos_Zane_Jagger[innertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.InnerTorsos_Zane_Jagger[innertorsoData.name].recordIDs, innertorsoData.recordID)
 end
 for _, legs in ipairs(clothes.legss_Zane_Jagger) do
  local legsData = {
     recordID = legs[1],
     name = legs[2],
     acquisitionID = legs[3]
    }
    local acquisitionData = translationstests[legsData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Legss_Zane_Jagger[legsData.name] then
     groupedclothes.Legss_Zane_Jagger[legsData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Legss_Zane_Jagger[legsData.name].recordIDs, legsData.recordID)
 end
 for _, outertorso in ipairs(clothes.outertorsos_Zane_Jagger) do
  local outertorsoData = {
     recordID = outertorso[1],
     name = outertorso[2],
     acquisitionID = outertorso[3]
    }
    local acquisitionData = translationstests[outertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.OuterTorsos_Zane_Jagger[outertorsoData.name] then
     groupedclothes.OuterTorsos_Zane_Jagger[outertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.OuterTorsos_Zane_Jagger[outertorsoData.name].recordIDs, outertorsoData.recordID)
 end
 for _, head in ipairs(clothes.heads_corpo_plaza) do
  local headData = {
     recordID = head[1],
     name = head[2],
     acquisitionID = head[3]
    }
    local acquisitionData = translationstests[headData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Heads_corpo_plaza[headData.name] then
         groupedclothes.Heads_corpo_plaza[headData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Heads_corpo_plaza[headData.name].recordIDs, headData.recordID)
 end
 for _, face in ipairs(clothes.faces_corpo_plaza) do
  local faceData = {
     recordID = face[1],
     name = face[2],
     acquisitionID = face[3]
    }
    local acquisitionData = translationstests[faceData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Faces_corpo_plaza[faceData.name] then
         groupedclothes.Faces_corpo_plaza[faceData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Faces_corpo_plaza[faceData.name].recordIDs, faceData.recordID)
 end
 for _, feet in ipairs(clothes.feets_corpo_plaza) do
  local feetData = {
     recordID = feet[1],
     name = feet[2],
     acquisitionID = feet[3]
    }
    local acquisitionData = translationstests[feetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Feets_corpo_plaza[feetData.name] then
       groupedclothes.Feets_corpo_plaza[feetData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Feets_corpo_plaza[feetData.name].recordIDs, feetData.recordID)
 end
 for _, innertorso in ipairs(clothes.innertorsos_corpo_plaza) do
  local innertorsoData = {
     recordID = innertorso[1],
     name = innertorso[2],
     acquisitionID = innertorso[3]
    }
    local acquisitionData = translationstests[innertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.InnerTorsos_corpo_plaza[innertorsoData.name] then
     groupedclothes.InnerTorsos_corpo_plaza[innertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.InnerTorsos_corpo_plaza[innertorsoData.name].recordIDs, innertorsoData.recordID)
 end
 for _, legs in ipairs(clothes.legss_corpo_plaza) do
  local legsData = {
     recordID = legs[1],
     name = legs[2],
     acquisitionID = legs[3]
    }
    local acquisitionData = translationstests[legsData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Legss_corpo_plaza[legsData.name] then
     groupedclothes.Legss_corpo_plaza[legsData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Legss_corpo_plaza[legsData.name].recordIDs, legsData.recordID)
 end
 for _, outertorso in ipairs(clothes.outertorsos_corpo_plaza) do
  local outertorsoData = {
     recordID = outertorso[1],
     name = outertorso[2],
     acquisitionID = outertorso[3]
    }
    local acquisitionData = translationstests[outertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.OuterTorsos_corpo_plaza[outertorsoData.name] then
     groupedclothes.OuterTorsos_corpo_plaza[outertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.OuterTorsos_corpo_plaza[outertorsoData.name].recordIDs, outertorsoData.recordID)
 end
 for _, head in ipairs(clothes.heads_Wellsprings) do
  local headData = {
     recordID = head[1],
     name = head[2],
     acquisitionID = head[3]
    }
    local acquisitionData = translationstests[headData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Heads_Wellsprings[headData.name] then
         groupedclothes.Heads_Wellsprings[headData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Heads_Wellsprings[headData.name].recordIDs, headData.recordID)
 end
 for _, face in ipairs(clothes.faces_Wellsprings) do
  local faceData = {
     recordID = face[1],
     name = face[2],
     acquisitionID = face[3]
    }
    local acquisitionData = translationstests[faceData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Faces_Wellsprings[faceData.name] then
         groupedclothes.Faces_Wellsprings[faceData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Faces_Wellsprings[faceData.name].recordIDs, faceData.recordID)
 end
 for _, feet in ipairs(clothes.feets_Wellsprings) do
  local feetData = {
     recordID = feet[1],
     name = feet[2],
     acquisitionID = feet[3]
    }
    local acquisitionData = translationstests[feetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Feets_Wellsprings[feetData.name] then
       groupedclothes.Feets_Wellsprings[feetData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Feets_Wellsprings[feetData.name].recordIDs, feetData.recordID)
 end
 for _, innertorso in ipairs(clothes.innertorsos_Wellsprings) do
  local innertorsoData = {
     recordID = innertorso[1],
     name = innertorso[2],
     acquisitionID = innertorso[3]
    }
    local acquisitionData = translationstests[innertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.InnerTorsos_Wellsprings[innertorsoData.name] then
     groupedclothes.InnerTorsos_Wellsprings[innertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.InnerTorsos_Wellsprings[innertorsoData.name].recordIDs, innertorsoData.recordID)
 end
 for _, legs in ipairs(clothes.legss_Wellsprings) do
  local legsData = {
     recordID = legs[1],
     name = legs[2],
     acquisitionID = legs[3]
    }
    local acquisitionData = translationstests[legsData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Legss_Wellsprings[legsData.name] then
     groupedclothes.Legss_Wellsprings[legsData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Legss_Wellsprings[legsData.name].recordIDs, legsData.recordID)
 end
 for _, outertorso in ipairs(clothes.outertorsos_Wellsprings) do
  local outertorsoData = {
     recordID = outertorso[1],
     name = outertorso[2],
     acquisitionID = outertorso[3]
    }
    local acquisitionData = translationstests[outertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.OuterTorsos_Wellsprings[outertorsoData.name] then
     groupedclothes.OuterTorsos_Wellsprings[outertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.OuterTorsos_Wellsprings[outertorsoData.name].recordIDs, outertorsoData.recordID)
 end
 for _, head in ipairs(clothes.heads_arroyo) do
  local headData = {
     recordID = head[1],
     name = head[2],
     acquisitionID = head[3]
    }
    local acquisitionData = translationstests[headData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Heads_arroyo[headData.name] then
         groupedclothes.Heads_arroyo[headData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Heads_arroyo[headData.name].recordIDs, headData.recordID)
 end
 for _, face in ipairs(clothes.faces_arroyo) do
  local faceData = {
     recordID = face[1],
     name = face[2],
     acquisitionID = face[3]
    }
    local acquisitionData = translationstests[faceData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Faces_arroyo[faceData.name] then
         groupedclothes.Faces_arroyo[faceData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Faces_arroyo[faceData.name].recordIDs, faceData.recordID)
 end
 for _, feet in ipairs(clothes.feets_arroyo) do
  local feetData = {
     recordID = feet[1],
     name = feet[2],
     acquisitionID = feet[3]
    }
    local acquisitionData = translationstests[feetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Feets_arroyo[feetData.name] then
       groupedclothes.Feets_arroyo[feetData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Feets_arroyo[feetData.name].recordIDs, feetData.recordID)
 end
 for _, innertorso in ipairs(clothes.innertorsos_arroyo) do
  local innertorsoData = {
     recordID = innertorso[1],
     name = innertorso[2],
     acquisitionID = innertorso[3]
    }
    local acquisitionData = translationstests[innertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.InnerTorsos_arroyo[innertorsoData.name] then
     groupedclothes.InnerTorsos_arroyo[innertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.InnerTorsos_arroyo[innertorsoData.name].recordIDs, innertorsoData.recordID)
 end
 for _, legs in ipairs(clothes.legss_arroyo) do
  local legsData = {
     recordID = legs[1],
     name = legs[2],
     acquisitionID = legs[3]
    }
    local acquisitionData = translationstests[legsData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Legss_arroyo[legsData.name] then
     groupedclothes.Legss_arroyo[legsData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Legss_arroyo[legsData.name].recordIDs, legsData.recordID)
 end
 for _, outertorso in ipairs(clothes.outertorsos_arroyo) do
  local outertorsoData = {
     recordID = outertorso[1],
     name = outertorso[2],
     acquisitionID = outertorso[3]
    }
    local acquisitionData = translationstests[outertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.OuterTorsos_arroyo[outertorsoData.name] then
     groupedclothes.OuterTorsos_arroyo[outertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.OuterTorsos_arroyo[outertorsoData.name].recordIDs, outertorsoData.recordID)
 end
 for _, head in ipairs(clothes.heads_rancho_coronado) do
  local headData = {
     recordID = head[1],
     name = head[2],
     acquisitionID = head[3]
    }
    local acquisitionData = translationstests[headData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Heads_rancho_coronado[headData.name] then
         groupedclothes.Heads_rancho_coronado[headData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Heads_rancho_coronado[headData.name].recordIDs, headData.recordID)
 end
 for _, feet in ipairs(clothes.feets_rancho_coronado) do
  local feetData = {
     recordID = feet[1],
     name = feet[2],
     acquisitionID = feet[3]
    }
    local acquisitionData = translationstests[feetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Feets_rancho_coronado[feetData.name] then
       groupedclothes.Feets_rancho_coronado[feetData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Feets_rancho_coronado[feetData.name].recordIDs, feetData.recordID)
 end
 for _, innertorso in ipairs(clothes.innertorsos_rancho_coronado) do
  local innertorsoData = {
     recordID = innertorso[1],
     name = innertorso[2],
     acquisitionID = innertorso[3]
    }
    local acquisitionData = translationstests[innertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.InnerTorsos_rancho_coronado[innertorsoData.name] then
     groupedclothes.InnerTorsos_rancho_coronado[innertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.InnerTorsos_rancho_coronado[innertorsoData.name].recordIDs, innertorsoData.recordID)
 end
 for _, legs in ipairs(clothes.legss_rancho_coronado) do
  local legsData = {
     recordID = legs[1],
     name = legs[2],
     acquisitionID = legs[3]
    }
    local acquisitionData = translationstests[legsData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Legss_rancho_coronado[legsData.name] then
     groupedclothes.Legss_rancho_coronado[legsData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Legss_rancho_coronado[legsData.name].recordIDs, legsData.recordID)
 end
 for _, outertorso in ipairs(clothes.outertorsos_rancho_coronado) do
  local outertorsoData = {
     recordID = outertorso[1],
     name = outertorso[2],
     acquisitionID = outertorso[3]
    }
    local acquisitionData = translationstests[outertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.OuterTorsos_rancho_coronado[outertorsoData.name] then
     groupedclothes.OuterTorsos_rancho_coronado[outertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.OuterTorsos_rancho_coronado[outertorsoData.name].recordIDs, outertorsoData.recordID)
 end
 for _, head in ipairs(clothes.heads_west_wind_estate) do
  local headData = {
     recordID = head[1],
     name = head[2],
     acquisitionID = head[3]
    }
    local acquisitionData = translationstests[headData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Heads_west_wind_estate[headData.name] then
         groupedclothes.Heads_west_wind_estate[headData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Heads_west_wind_estate[headData.name].recordIDs, headData.recordID)
 end
 for _, face in ipairs(clothes.faces_west_wind_estate) do
  local faceData = {
     recordID = face[1],
     name = face[2],
     acquisitionID = face[3]
    }
    local acquisitionData = translationstests[faceData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Faces_west_wind_estate[faceData.name] then
         groupedclothes.Faces_west_wind_estate[faceData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Faces_west_wind_estate[faceData.name].recordIDs, faceData.recordID)
 end
 for _, feet in ipairs(clothes.feets_west_wind_estate) do
  local feetData = {
     recordID = feet[1],
     name = feet[2],
     acquisitionID = feet[3]
    }
    local acquisitionData = translationstests[feetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Feets_west_wind_estate[feetData.name] then
       groupedclothes.Feets_west_wind_estate[feetData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Feets_west_wind_estate[feetData.name].recordIDs, feetData.recordID)
 end
 for _, innertorso in ipairs(clothes.innertorsos_west_wind_estate) do
  local innertorsoData = {
     recordID = innertorso[1],
     name = innertorso[2],
     acquisitionID = innertorso[3]
    }
    local acquisitionData = translationstests[innertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.InnerTorsos_west_wind_estate[innertorsoData.name] then
     groupedclothes.InnerTorsos_west_wind_estate[innertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.InnerTorsos_west_wind_estate[innertorsoData.name].recordIDs, innertorsoData.recordID)
 end
 for _, legs in ipairs(clothes.legss_west_wind_estate) do
  local legsData = {
     recordID = legs[1],
     name = legs[2],
     acquisitionID = legs[3]
    }
    local acquisitionData = translationstests[legsData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Legss_west_wind_estate[legsData.name] then
     groupedclothes.Legss_west_wind_estate[legsData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Legss_west_wind_estate[legsData.name].recordIDs, legsData.recordID)
 end
 for _, outertorso in ipairs(clothes.outertorsos_west_wind_estate) do
  local outertorsoData = {
     recordID = outertorso[1],
     name = outertorso[2],
     acquisitionID = outertorso[3]
    }
    local acquisitionData = translationstests[outertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.OuterTorsos_west_wind_estate[outertorsoData.name] then
     groupedclothes.OuterTorsos_west_wind_estate[outertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.OuterTorsos_west_wind_estate[outertorsoData.name].recordIDs, outertorsoData.recordID)
 end
 for _, head in ipairs(clothes.heads_david_walker) do
  local headData = {
     recordID = head[1],
     name = head[2],
     acquisitionID = head[3]
    }
    local acquisitionData = translationstests[headData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Heads_david_walker[headData.name] then
         groupedclothes.Heads_david_walker[headData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Heads_david_walker[headData.name].recordIDs, headData.recordID)
 end
 for _, face in ipairs(clothes.faces_david_walker) do
  local faceData = {
     recordID = face[1],
     name = face[2],
     acquisitionID = face[3]
    }
    local acquisitionData = translationstests[faceData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Faces_david_walker[faceData.name] then
         groupedclothes.Faces_david_walker[faceData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Faces_david_walker[faceData.name].recordIDs, faceData.recordID)
 end
 for _, feet in ipairs(clothes.feets_david_walker) do
  local feetData = {
     recordID = feet[1],
     name = feet[2],
     acquisitionID = feet[3]
    }
    local acquisitionData = translationstests[feetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Feets_david_walker[feetData.name] then
       groupedclothes.Feets_david_walker[feetData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Feets_david_walker[feetData.name].recordIDs, feetData.recordID)
 end
 for _, innertorso in ipairs(clothes.innertorsos_david_walker) do
  local innertorsoData = {
     recordID = innertorso[1],
     name = innertorso[2],
     acquisitionID = innertorso[3]
    }
    local acquisitionData = translationstests[innertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.InnerTorsos_david_walker[innertorsoData.name] then
     groupedclothes.InnerTorsos_david_walker[innertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.InnerTorsos_david_walker[innertorsoData.name].recordIDs, innertorsoData.recordID)
 end
 for _, legs in ipairs(clothes.legss_david_walker) do
  local legsData = {
     recordID = legs[1],
     name = legs[2],
     acquisitionID = legs[3]
    }
    local acquisitionData = translationstests[legsData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Legss_david_walker[legsData.name] then
     groupedclothes.Legss_david_walker[legsData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Legss_david_walker[legsData.name].recordIDs, legsData.recordID)
 end
 for _, outertorso in ipairs(clothes.outertorsos_david_walker) do
  local outertorsoData = {
     recordID = outertorso[1],
     name = outertorso[2],
     acquisitionID = outertorso[3]
    }
    local acquisitionData = translationstests[outertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.OuterTorsos_david_walker[outertorsoData.name] then
     groupedclothes.OuterTorsos_david_walker[outertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.OuterTorsos_david_walker[outertorsoData.name].recordIDs, outertorsoData.recordID)
 end
 for _, head in ipairs(clothes.heads_satoshi_ueno) do
  local headData = {
     recordID = head[1],
     name = head[2],
     acquisitionID = head[3]
    }
    local acquisitionData = translationstests[headData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Heads_satoshi_ueno[headData.name] then
         groupedclothes.Heads_satoshi_ueno[headData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Heads_satoshi_ueno[headData.name].recordIDs, headData.recordID)
 end
 for _, face in ipairs(clothes.faces_satoshi_ueno) do
  local faceData = {
     recordID = face[1],
     name = face[2],
     acquisitionID = face[3]
    }
    local acquisitionData = translationstests[faceData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Faces_satoshi_ueno[faceData.name] then
         groupedclothes.Faces_satoshi_ueno[faceData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Faces_satoshi_ueno[faceData.name].recordIDs, faceData.recordID)
 end
 for _, feet in ipairs(clothes.feets_satoshi_ueno) do
  local feetData = {
     recordID = feet[1],
     name = feet[2],
     acquisitionID = feet[3]
    }
    local acquisitionData = translationstests[feetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Feets_satoshi_ueno[feetData.name] then
       groupedclothes.Feets_satoshi_ueno[feetData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Feets_satoshi_ueno[feetData.name].recordIDs, feetData.recordID)
 end
 for _, innertorso in ipairs(clothes.innertorsos_satoshi_ueno) do
  local innertorsoData = {
     recordID = innertorso[1],
     name = innertorso[2],
     acquisitionID = innertorso[3]
    }
    local acquisitionData = translationstests[innertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.InnerTorsos_satoshi_ueno[innertorsoData.name] then
     groupedclothes.InnerTorsos_satoshi_ueno[innertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.InnerTorsos_satoshi_ueno[innertorsoData.name].recordIDs, innertorsoData.recordID)
 end
 for _, legs in ipairs(clothes.legss_satoshi_ueno) do
  local legsData = {
     recordID = legs[1],
     name = legs[2],
     acquisitionID = legs[3]
    }
    local acquisitionData = translationstests[legsData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Legss_satoshi_ueno[legsData.name] then
     groupedclothes.Legss_satoshi_ueno[legsData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Legss_satoshi_ueno[legsData.name].recordIDs, legsData.recordID)
 end
 for _, outertorso in ipairs(clothes.outertorsos_satoshi_ueno) do
  local outertorsoData = {
     recordID = outertorso[1],
     name = outertorso[2],
     acquisitionID = outertorso[3]
    }
    local acquisitionData = translationstests[outertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.OuterTorsos_satoshi_ueno[outertorsoData.name] then
     groupedclothes.OuterTorsos_satoshi_ueno[outertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.OuterTorsos_satoshi_ueno[outertorsoData.name].recordIDs, outertorsoData.recordID)
 end
 for _, head in ipairs(clothes.heads_red_peaks) do
  local headData = {
     recordID = head[1],
     name = head[2],
     acquisitionID = head[3]
    }
    local acquisitionData = translationstests[headData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Heads_red_peaks[headData.name] then
         groupedclothes.Heads_red_peaks[headData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Heads_red_peaks[headData.name].recordIDs, headData.recordID)
 end
 for _, face in ipairs(clothes.faces_red_peaks) do
  local faceData = {
     recordID = face[1],
     name = face[2],
     acquisitionID = face[3]
    }
    local acquisitionData = translationstests[faceData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
     if not groupedclothes.Faces_red_peaks[faceData.name] then
         groupedclothes.Faces_red_peaks[faceData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
     end
     table.insert(groupedclothes.Faces_red_peaks[faceData.name].recordIDs, faceData.recordID)
 end
 for _, feet in ipairs(clothes.feets_red_peaks) do
  local feetData = {
     recordID = feet[1],
     name = feet[2],
     acquisitionID = feet[3]
    }
    local acquisitionData = translationstests[feetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Feets_red_peaks[feetData.name] then
       groupedclothes.Feets_red_peaks[feetData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Feets_red_peaks[feetData.name].recordIDs, feetData.recordID)
 end
 for _, innertorso in ipairs(clothes.innertorsos_red_peaks) do
  local innertorsoData = {
     recordID = innertorso[1],
     name = innertorso[2],
     acquisitionID = innertorso[3]
    }
    local acquisitionData = translationstests[innertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.InnerTorsos_red_peaks[innertorsoData.name] then
     groupedclothes.InnerTorsos_red_peaks[innertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.InnerTorsos_red_peaks[innertorsoData.name].recordIDs, innertorsoData.recordID)
 end
 for _, legs in ipairs(clothes.legss_red_peaks) do
  local legsData = {
     recordID = legs[1],
     name = legs[2],
     acquisitionID = legs[3]
    }
    local acquisitionData = translationstests[legsData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Legss_red_peaks[legsData.name] then
     groupedclothes.Legss_red_peaks[legsData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Legss_red_peaks[legsData.name].recordIDs, legsData.recordID)
 end
 for _, outertorso in ipairs(clothes.outertorsos_red_peaks) do
  local outertorsoData = {
     recordID = outertorso[1],
     name = outertorso[2],
     acquisitionID = outertorso[3]
    }
    local acquisitionData = translationstests[outertorsoData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.OuterTorsos_red_peaks[outertorsoData.name] then
     groupedclothes.OuterTorsos_red_peaks[outertorsoData.name] = { recordIDs = {}, acquisitionen = acquisitionData.en,
         acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.OuterTorsos_red_peaks[outertorsoData.name].recordIDs, outertorsoData.recordID)
 end
 for _, JohnnySilverhandset in ipairs(clothes.johnny_Silverhand_set) do
    local JohnnySilverhandsetData = {
     recordID = JohnnySilverhandset[1],
     name = JohnnySilverhandset[2],
     acquisitionID = JohnnySilverhandset[3]
    }
   local acquisitionData = translationstests[JohnnySilverhandsetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
 
   if not groupedclothes.Johnny_Silverhand_set[JohnnySilverhandsetData.name] then
     groupedclothes.Johnny_Silverhand_set[JohnnySilverhandsetData.name] = { 
       recordIDs = {}, 
       acquisitionen = acquisitionData.en,
       acquisitiontrad = acquisitionData.trad
      }
   end
   table.insert(groupedclothes.Johnny_Silverhand_set[JohnnySilverhandsetData.name].recordIDs, JohnnySilverhandsetData.recordID)
 end
 for _, vcorposet in ipairs(clothes.v_corpo_set) do
    local vcorposetData = {
     recordID = vcorposet[1],
     name = vcorposet[2],
     acquisitionID = vcorposet[3]
    }
    local acquisitionData = translationstests[vcorposetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.V_corpo_set[vcorposetData.name] then
     groupedclothes.V_corpo_set[vcorposetData.name] = { 
      recordIDs = {},  
      acquisitionen = acquisitionData.en,
      acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.V_corpo_set[vcorposetData.name].recordIDs, vcorposetData.recordID)
 end
 for _, vnomadset in ipairs(clothes.v_nomad_set) do
   local vnomadsetData = {
     recordID = vnomadset[1],
     name = vnomadset[2],
     acquisitionID = vnomadset[3]
    }
    local acquisitionData = translationstests[vnomadsetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.V_nomad_set[vnomadsetData.name] then
     groupedclothes.V_nomad_set[vnomadsetData.name] = { recordIDs = {},  
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.V_nomad_set[vnomadsetData.name].recordIDs, vnomadsetData.recordID)
 end
 for _, vstreetkidset in ipairs(clothes.v_streetkid_set) do
   local vstreetkidsetData = {
     recordID = vstreetkidset[1],
     name = vstreetkidset[2],
     acquisitionID = vstreetkidset[3]
    }
    local acquisitionData = translationstests[vstreetkidsetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.V_streetkid_set[vstreetkidsetData.name] then
     groupedclothes.V_streetkid_set[vstreetkidsetData.name] = { recordIDs = {},  
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.V_streetkid_set[vstreetkidsetData.name].recordIDs, vstreetkidsetData.recordID)
 end
 for _, vTheRescueset in ipairs(clothes.v_The_Rescue_set) do
   local vTheRescuesetData = {
     recordID = vTheRescueset[1],
     name = vTheRescueset[2],
     acquisitionID = vTheRescueset[3]
    }
    local acquisitionData = translationstests[vTheRescuesetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.V_The_Rescue_set[vTheRescuesetData.name] then
     groupedclothes.V_The_Rescue_set[vTheRescuesetData.name] = { recordIDs = {},   
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.V_The_Rescue_set[vTheRescuesetData.name].recordIDs, vTheRescuesetData.recordID)
 end
 for _, yorinuboset in ipairs(clothes.yorinubo_set) do
 local yorinubosetData = {
     recordID = yorinuboset[1],
     name = yorinuboset[2],
     acquisitionID = yorinuboset[3]
    }
    local acquisitionData = translationstests[yorinubosetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Yorinubo_set[yorinubosetData.name] then
     groupedclothes.Yorinubo_set[yorinubosetData.name] = { recordIDs = {},   
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Yorinubo_set[yorinubosetData.name].recordIDs, yorinubosetData.recordID)
 end
 for _, maxTacset in ipairs(clothes.maxTac_set) do
 local maxTacsetData = {
     recordID = maxTacset[1],
     name = maxTacset[2],
     acquisitionID = maxTacset[3]
    }
    local acquisitionData = translationstests[maxTacsetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.MaxTac_set[maxTacsetData.name] then
     groupedclothes.MaxTac_set[maxTacsetData.name] = { recordIDs = {},   
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.MaxTac_set[maxTacsetData.name].recordIDs, maxTacsetData.recordID)
 end
 for _, nUSAgentset in ipairs(clothes.nUS_Agent_set) do
 local nUSAgentsetData = {
     recordID = nUSAgentset[1],
     name = nUSAgentset[2],
     acquisitionID = nUSAgentset[3]
    }
   local acquisitionData = translationstests[nUSAgentsetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.NUS_Agent_set[nUSAgentsetData.name] then
     groupedclothes.NUS_Agent_set[nUSAgentsetData.name] = {
       recordIDs = {},
       acquisitionen = acquisitionData.en,
       acquisitiontrad = acquisitionData.trad
     }
   end
   table.insert(groupedclothes.NUS_Agent_set[nUSAgentsetData.name].recordIDs, nUSAgentsetData.recordID)
 end
 for _, theStarset in ipairs(clothes.the_Star_set) do
 local theStarsetData = {
     recordID = theStarset[1],
     name = theStarset[2],
     acquisitionID = theStarset[3]
    }
    local acquisitionData = translationstests[theStarsetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.The_Star_set[theStarsetData.name] then
     groupedclothes.The_Star_set[theStarsetData.name] = { recordIDs = {},   
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.The_Star_set[theStarsetData.name].recordIDs, theStarsetData.recordID)
 end
 for _, thesunset in ipairs(clothes.the_sun_set) do
 local thesunsetData = {
     recordID = thesunset[1],
     name = thesunset[2],
     acquisitionID = thesunset[3]
    }
    local acquisitionData = translationstests[thesunsetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.The_sun_set[thesunsetData.name] then
     groupedclothes.The_sun_set[thesunsetData.name] = { recordIDs = {},   
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.The_sun_set[thesunsetData.name].recordIDs, thesunsetData.recordID)
 end
 for _, temperanceset in ipairs(clothes.temperance_set) do
 local temperancesetData = {
     recordID = temperanceset[1],
     name = temperanceset[2],
     acquisitionID = temperanceset[3]
    }
    local acquisitionData = translationstests[temperancesetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Temperance_set[temperancesetData.name] then
     groupedclothes.Temperance_set[temperancesetData.name] = { recordIDs = {},   
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Temperance_set[temperancesetData.name].recordIDs, temperancesetData.recordID)
 end
 for _, copset in ipairs(clothes.cop_set) do
 local copsetData = {
     recordID = copset[1],
     name = copset[2],
     acquisitionID = copset[3]
    }
    local acquisitionData = translationstests[copsetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Cop_set[copsetData.name] then
     groupedclothes.Cop_set[copsetData.name] = { recordIDs = {},   
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Cop_set[copsetData.name].recordIDs, copsetData.recordID)
 end
 for _, corporateset in ipairs(clothes.corporate_set) do
 local corporatesetData = {
     recordID = corporateset[1],
     name = corporateset[2],
     acquisitionID = corporateset[3]
    }
    local acquisitionData = translationstests[corporatesetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Corporate_set[corporatesetData.name] then
     groupedclothes.Corporate_set[corporatesetData.name] = { recordIDs = {},   
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Corporate_set[corporatesetData.name].recordIDs, corporatesetData.recordID)
 end
 for _, fixerset in ipairs(clothes.fixer_set) do
 local fixersetData = {
     recordID = fixerset[1],
     name = fixerset[2],
     acquisitionID = fixerset[3]
    }
    local acquisitionData = translationstests[fixersetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Fixer_set[fixersetData.name] then
     groupedclothes.Fixer_set[fixersetData.name] = { recordIDs = {},   
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Fixer_set[fixersetData.name].recordIDs, fixersetData.recordID)
 end
 for _, mediaset in ipairs(clothes.media_set) do
 local mediasetData = {
     recordID = mediaset[1],
     name = mediaset[2],
     acquisitionID = mediaset[3]
    }
    local acquisitionData = translationstests[mediasetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Media_set[mediasetData.name] then
     groupedclothes.Media_set[mediasetData.name] = { recordIDs = {},   
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Media_set[mediasetData.name].recordIDs, mediasetData.recordID)
 end
 for _, netrunnerset in ipairs(clothes.netrunner_set) do
 local netrunnersetData = {
     recordID = netrunnerset[1],
     name = netrunnerset[2],
     acquisitionID = netrunnerset[3]
    }
    local acquisitionData = translationstests[netrunnersetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Netrunner_set[netrunnersetData.name] then
     groupedclothes.Netrunner_set[netrunnersetData.name] = { recordIDs = {},   
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Netrunner_set[netrunnersetData.name].recordIDs, netrunnersetData.recordID)
 end
 for _, nomadset in ipairs(clothes.nomad_set) do
 local nomadsetData = {
     recordID = nomadset[1],
     name = nomadset[2],
     acquisitionID = nomadset[3]
    }
    local acquisitionData = translationstests[nomadsetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Nomad_set[nomadsetData.name] then
     groupedclothes.Nomad_set[nomadsetData.name] = { recordIDs = {},   
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Nomad_set[nomadsetData.name].recordIDs, nomadsetData.recordID)
 end
 for _, rockerset in ipairs(clothes.rocker_set) do
 local rockersetData = {
     recordID = rockerset[1],
     name = rockerset[2],
     acquisitionID = rockerset[3]
    }
    local acquisitionData = translationstests[rockersetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Rocker_set[rockersetData.name] then
     groupedclothes.Rocker_set[rockersetData.name] = { recordIDs = {},   
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Rocker_set[rockersetData.name].recordIDs, rockersetData.recordID)
 end
 for _, soloset in ipairs(clothes.solo_set) do
 local solosetData = {
     recordID = soloset[1],
     name = soloset[2],
     acquisitionID = soloset[3]
    }
    local acquisitionData = translationstests[solosetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Solo_set[solosetData.name] then
     groupedclothes.Solo_set[solosetData.name] = { recordIDs = {},   
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Solo_set[solosetData.name].recordIDs, solosetData.recordID)
 end
 for _, techieset in ipairs(clothes.techie_set) do
 local techiesetData = {
     recordID = techieset[1],
     name = techieset[2],
     acquisitionID = techieset[3]
    }
    local acquisitionData = translationstests[techiesetData.acquisitionID] or { en = "Unknown", trad = "Unknown" }
   if not groupedclothes.Techie_set[techiesetData.name] then
     groupedclothes.Techie_set[techiesetData.name] = { recordIDs = {},   
     acquisitionen = acquisitionData.en,
     acquisitiontrad = acquisitionData.trad }
   end
   table.insert(groupedclothes.Techie_set[techiesetData.name].recordIDs, techiesetData.recordID)
 end

-- Clothesui.knownClothesIDs = {}

-- function Clothesui.BuildClotheIndex()
--     for _, clothesGroup in pairs(groupedclothes) do
--         for name, data in pairs(clothesGroup) do
--             for _, recordID in ipairs(data.recordIDs or {}) do
--                 Clothesui.knownClothesIDs[recordID] = name
--             end
--         end
--     end
-- end

-- Clothesui.BuildClotheIndex()

Clothesui.inventoryCache = {}
function Clothesui.UpdateInventoryCache()
    Clothesui.inventoryCache = {}
    local transactionSystem = Game.GetTransactionSystem()
    local player = GetPlayer()

    if not transactionSystem or not player then
        print("❌ ERREUR : Impossible d'obtenir `Game.GetTransactionSystem()` ou `GetPlayer()`.")
        return
    end

    -- 🔍 Vérifie les items du joueur
    local success, playerItems = transactionSystem:GetItemList(player)
    if success and playerItems then
        for _, item in ipairs(playerItems) do
            local itemRecordID = item:GetID().id.value
            Clothesui.inventoryCache[itemRecordID] = true
        end
    end

    -- 🔍 Vérifie les items du coffre
    local stash = Game.FindEntityByID(EntityID.new({ hash = 16570246047455160070ULL }))
    if stash then
        local stashSuccess, stashItems = transactionSystem:GetItemList(stash)
        if stashSuccess and stashItems then
            for _, item in ipairs(stashItems) do
                local itemRecordID = item:GetID().id.value
                Clothesui.inventoryCache[itemRecordID] = true
            end
        end
    end
end
-- Clothesui.oldInventoryCache = {}
-- Clothesui.toast = nil
-- Clothesui.initialized = false

-- function Clothesui.UpdateInventoryCache()
--   Clothesui.oldInventoryCache = Clothesui.inventoryCache or {}
--   Clothesui.inventoryCache = {}

--   local transactionSystem = Game.GetTransactionSystem()
--   local player = GetPlayer()

--   local newItems = {} 

--   local function checkAndAddItems(entity)
--       local success, items = transactionSystem:GetItemList(entity)
--       if success and items then
--           for _, item in ipairs(items) do
--               local recordID = item:GetID().id.value
--               Clothesui.inventoryCache[recordID] = true

--               if not Clothesui.oldInventoryCache[recordID] and Clothesui.knownClothesIDs[recordID] then
--                   table.insert(newItems, recordID)
--               end
--           end
--       end
--   end

--   checkAndAddItems(player)
--   local stash = Game.FindEntityByID(EntityID.new({ hash = 16570246047455160070ULL }))
--   checkAndAddItems(stash)

--   -- ✅ Ne notifier qu'une seule fois
--   if not Clothesui.initialized then
--       Clothesui.initialized = true
--       return
--   end

--   if #newItems > 0 then
--       Clothesui.NotifyNewItems(newItems)
--   end
-- end
-- function Clothesui.UpdateInventoryCache()
--   local transactionSystem = Game.GetTransactionSystem()
--   local player = GetPlayer()
--   local newItems = {}
-- Clothesui.inventoryCache = Clothesui.inventoryCache or {}
--   -- On ne copie pas tout l'inventaire, on vérifie seulement les nouveaux items
--   local function checkAndAddItems(entity)
--     local success, items = transactionSystem:GetItemList(entity)
--     if success and items then
--       for _, item in ipairs(items) do
--         local recordID = item:GetID().id.value
--         -- Si l'item n'était pas dans le cache précédent, c'est un nouvel item
--         if not Clothesui.inventoryCache[recordID] and Clothesui.knownClothesIDs[recordID] then
--           table.insert(newItems, recordID)
--         end
--         -- On met à jour le cache courant
--         Clothesui.inventoryCache[recordID] = true
--       end
--     end
--   end

--   -- -- On garde une copie du cache précédent
--   -- Clothesui.oldInventoryCache = Clothesui.inventoryCache or {}
--   -- Clothesui.inventoryCache = {}

--   checkAndAddItems(player)
--   local stash = Game.FindEntityByID(EntityID.new({ hash = 16570246047455160070ULL }))
--   checkAndAddItems(stash)

--   -- Ne notifier qu'une seule fois au démarrage
--   if not Clothesui.initialized then
--     Clothesui.initialized = true
--     return
--   end

--   if #newItems > 0 then
--     Clothesui.NotifyNewItems(newItems)
--   end
-- end
-- function Clothesui.NotifyNewItems(recordIDs)
--   if ATT.enableNotifications then return end
--   local notified = {}

--   local newlyDiscoveredNames = {}

--   for _, recordID in ipairs(recordIDs) do
--       local name = Clothesui.knownClothesIDs[recordID]
--       if name then
--           newlyDiscoveredNames[name] = true
--       end
--   end

--   for name, _ in pairs(newlyDiscoveredNames) do
--       local found = false
--       local group = groupedclothes -- raccourci
--       for _, data in pairs(group) do
--           if data[name] then
--               for _, id in ipairs(data[name].recordIDs) do
--                   if Clothesui.oldInventoryCache[id] then
--                       found = true 
--                       break
--                   end
--               end
--           end
--           if found then break end
--       end

--       if not found then
--           ATT.GameHUD.ShowMessage(T("ATT_Collected_Item") .. ":\n" .. name)
--       end
--   end

-- end

function Clothesui.CheckInStashAndInventory(recordID)
    return Clothesui.inventoryCache[recordID] or false
end

function Clothesui.displayWeaponGroup(name, group)
    local width, _ = ImGui.GetContentRegionAvail() 

    for weaponName, data in pairs(group or {}) do  
        local inInventory = false
        for _, recordID in ipairs(data.recordIDs) do
            if Clothesui.CheckInStashAndInventory(recordID) then
                inInventory = true
                break
            end
        end

        if ATT.hideOwnedItems and inInventory then
          goto continue  
      end
      if ATT.hideUnownedItems and not inInventory then
          goto continue  
      end

        if inInventory then
            ImGui.PushStyleColor(ImGuiCol.Text, 0.0, 1.0, 0.0, 1.0)  
        else
            ImGui.PushStyleColor(ImGuiCol.Text, 1.0, 0.0, 0.0, 1.0)  
        end

        if ImGui.Selectable(weaponName, Clothesui.selectedName == weaponName) then
            Clothesui.selectedName = weaponName
        end

        ImGui.PopStyleColor()
        ::continue:: 

    end

    
end

function Clothesui.CountOwnedWeapons(group)
    Clothesui.ownedCount = 0
    Clothesui.totalCount = 0
  
    for _, data in pairs(group or {}) do
        Clothesui.totalCount = Clothesui.totalCount + 1
        for _, recordID in ipairs(data.recordIDs) do
            if Clothesui.CheckInStashAndInventory(recordID) then
                Clothesui.ownedCount = Clothesui.ownedCount + 1
                break
            end
        end
    end
  
    return Clothesui.ownedCount, Clothesui.totalCount
end

function Clothesui.count()
    --vetement nothside
    Clothesui.ownedHeads_northhside, Clothesui.totalHeads_northhside = Clothesui.CountOwnedWeapons(groupedclothes.Heads_northhside)
      Clothesui.ownedFaces_northhside, Clothesui.totalFaces_northhside = Clothesui.CountOwnedWeapons(groupedclothes.Faces_northhside)
      Clothesui.ownedFeets_northhside, Clothesui.totalFeets_northhside = Clothesui.CountOwnedWeapons(groupedclothes.Feets_northhside)
      Clothesui.ownedInnerTorsos_northhside, Clothesui.totalInnerTorsos_northhside = Clothesui.CountOwnedWeapons(groupedclothes.InnerTorsos_northhside)
      Clothesui.ownedLegss_northhside, Clothesui.totalLegss_northhside = Clothesui.CountOwnedWeapons(groupedclothes.Legss_northhside)
      Clothesui.ownedOuterTorsos_northhside, Clothesui.totalOuterTorsos_northhside = Clothesui.CountOwnedWeapons(groupedclothes.OuterTorsos_northhside)
                                --vetement kabuki
      Clothesui.ownedHeads_kabuki, Clothesui.totalHeads_kabuki = Clothesui.CountOwnedWeapons(groupedclothes.Heads_kabuki)
      Clothesui.ownedFaces_kabuki, Clothesui.totalFaces_kabuki = Clothesui.CountOwnedWeapons(groupedclothes.Faces_kabuki)
      Clothesui.ownedFeets_kabuki, Clothesui.totalFeets_kabuki = Clothesui.CountOwnedWeapons(groupedclothes.Feets_kabuki)
      Clothesui.ownedInnerTorsos_kabuki, Clothesui.totalInnerTorsos_kabuki = Clothesui.CountOwnedWeapons(groupedclothes.InnerTorsos_kabuki)
      Clothesui.ownedLegss_kabuki, Clothesui.totalLegss_kabuki = Clothesui.CountOwnedWeapons(groupedclothes.Legss_kabuki)
      Clothesui.ownedOuterTorsos_kabuki, Clothesui.totalOuterTorsos_kabuki = Clothesui.CountOwnedWeapons(groupedclothes.OuterTorsos_kabuki)
                                --vetement little_china
      Clothesui.ownedHeads_little_china, Clothesui.totalHeads_little_china = Clothesui.CountOwnedWeapons(groupedclothes.Heads_little_china)
      Clothesui.ownedFaces_little_china, Clothesui.totalFaces_little_china = Clothesui.CountOwnedWeapons(groupedclothes.Faces_little_china)
      Clothesui.ownedFeets_little_china, Clothesui.totalFeets_little_china = Clothesui.CountOwnedWeapons(groupedclothes.Feets_little_china)
      Clothesui.ownedInnerTorsos_little_china, Clothesui.totalInnerTorsos_little_china = Clothesui.CountOwnedWeapons(groupedclothes.InnerTorsos_little_china)
      Clothesui.ownedLegss_little_china, Clothesui.totalLegss_little_china = Clothesui.CountOwnedWeapons(groupedclothes.Legss_little_china)
      Clothesui.ownedOuterTorsos_little_china, Clothesui.totalOuterTorsos_little_china = Clothesui.CountOwnedWeapons(groupedclothes.OuterTorsos_little_china)
                                --vetement little_china
      Clothesui.ownedHeads_Japantown, Clothesui.totalHeads_Japantown = Clothesui.CountOwnedWeapons(groupedclothes.Heads_Japantown)
      Clothesui.ownedFaces_Japantown, Clothesui.totalFaces_Japantown = Clothesui.CountOwnedWeapons(groupedclothes.Faces_Japantown)
      Clothesui.ownedFeets_Japantown, Clothesui.totalFeets_Japantown = Clothesui.CountOwnedWeapons(groupedclothes.Feets_Japantown)
      Clothesui.ownedInnerTorsos_Japantown, Clothesui.totalInnerTorsos_Japantown = Clothesui.CountOwnedWeapons(groupedclothes.InnerTorsos_Japantown)
      Clothesui.ownedLegss_Japantown, Clothesui.totalLegss_Japantown = Clothesui.CountOwnedWeapons(groupedclothes.Legss_Japantown)
      Clothesui.ownedOuterTorsos_Japantown, Clothesui.totalOuterTorsos_Japantown = Clothesui.CountOwnedWeapons(groupedclothes.OuterTorsos_Japantown)
                                --vetement little_china
      Clothesui.ownedHeads_Karim_Noel, Clothesui.totalHeads_Karim_Noel = Clothesui.CountOwnedWeapons(groupedclothes.Heads_Karim_Noel)
      Clothesui.ownedFaces_Karim_Noel, Clothesui.totalFaces_Karim_Noel = Clothesui.CountOwnedWeapons(groupedclothes.Faces_Karim_Noel)
      Clothesui.ownedFeets_Karim_Noel, Clothesui.totalFeets_Karim_Noel = Clothesui.CountOwnedWeapons(groupedclothes.Feets_Karim_Noel)
      Clothesui.ownedInnerTorsos_Karim_Noel, Clothesui.totalInnerTorsos_Karim_Noel = Clothesui.CountOwnedWeapons(groupedclothes.InnerTorsos_Karim_Noel)
      Clothesui.ownedLegss_Karim_Noel, Clothesui.totalLegss_Karim_Noel = Clothesui.CountOwnedWeapons(groupedclothes.Legss_Karim_Noel)
      Clothesui.ownedOuterTorsos_Karim_Noel, Clothesui.totalOuterTorsos_Karim_Noel = Clothesui.CountOwnedWeapons(groupedclothes.OuterTorsos_Karim_Noel)
                                --vetement little_china
      Clothesui.ownedHeads_Charter_Hill, Clothesui.totalHeads_Charter_Hill = Clothesui.CountOwnedWeapons(groupedclothes.Heads_Charter_Hill)
      Clothesui.ownedFaces_Charter_Hill, Clothesui.totalFaces_Charter_Hill = Clothesui.CountOwnedWeapons(groupedclothes.Faces_Charter_Hill)
      Clothesui.ownedFeets_Charter_Hill, Clothesui.totalFeets_Charter_Hill = Clothesui.CountOwnedWeapons(groupedclothes.Feets_Charter_Hill)
      Clothesui.ownedInnerTorsos_Charter_Hill, Clothesui.totalInnerTorsos_Charter_Hill = Clothesui.CountOwnedWeapons(groupedclothes.InnerTorsos_Charter_Hill)
      Clothesui.ownedLegss_Charter_Hill, Clothesui.totalLegss_Charter_Hill = Clothesui.CountOwnedWeapons(groupedclothes.Legss_Charter_Hill)
      Clothesui.ownedOuterTorsos_Charter_Hill, Clothesui.totalOuterTorsos_Charter_Hill = Clothesui.CountOwnedWeapons(groupedclothes.OuterTorsos_Charter_Hill)
                                --vetement little_china
      Clothesui.ownedHeads_Zane_Jagger, Clothesui.totalHeads_Zane_Jagger = Clothesui.CountOwnedWeapons(groupedclothes.Heads_Zane_Jagger)
      Clothesui.ownedFaces_Zane_Jagger, Clothesui.totalFaces_Zane_Jagger = Clothesui.CountOwnedWeapons(groupedclothes.Faces_Zane_Jagger)
      Clothesui.ownedFeets_Zane_Jagger, Clothesui.totalFeets_Zane_Jagger = Clothesui.CountOwnedWeapons(groupedclothes.Feets_Zane_Jagger)
      Clothesui.ownedInnerTorsos_Zane_Jagger, Clothesui.totalInnerTorsos_Zane_Jagger = Clothesui.CountOwnedWeapons(groupedclothes.InnerTorsos_Zane_Jagger)
      Clothesui.ownedLegss_Zane_Jagger, Clothesui.totalLegss_Zane_Jagger = Clothesui.CountOwnedWeapons(groupedclothes.Legss_Zane_Jagger)
      Clothesui.ownedOuterTorsos_Zane_Jagger, Clothesui.totalOuterTorsos_Zane_Jagger = Clothesui.CountOwnedWeapons(groupedclothes.OuterTorsos_Zane_Jagger)
                                --vetement little_china
      Clothesui.ownedHeads_corpo_plaza, Clothesui.totalHeads_corpo_plaza = Clothesui.CountOwnedWeapons(groupedclothes.Heads_corpo_plaza)
      Clothesui.ownedFaces_corpo_plaza, Clothesui.totalFaces_corpo_plaza = Clothesui.CountOwnedWeapons(groupedclothes.Faces_corpo_plaza)
      Clothesui.ownedFeets_corpo_plaza, Clothesui.totalFeets_corpo_plaza = Clothesui.CountOwnedWeapons(groupedclothes.Feets_corpo_plaza)
      Clothesui.ownedInnerTorsos_corpo_plaza, Clothesui.totalInnerTorsos_corpo_plaza = Clothesui.CountOwnedWeapons(groupedclothes.InnerTorsos_corpo_plaza)
      Clothesui.ownedLegss_corpo_plaza, Clothesui.totalLegss_corpo_plaza = Clothesui.CountOwnedWeapons(groupedclothes.Legss_corpo_plaza)
      Clothesui.ownedOuterTorsos_corpo_plaza, Clothesui.totalOuterTorsos_corpo_plaza = Clothesui.CountOwnedWeapons(groupedclothes.OuterTorsos_corpo_plaza)
                                --vetement little_china
      Clothesui.ownedHeads_Wellsprings, Clothesui.totalHeads_Wellsprings = Clothesui.CountOwnedWeapons(groupedclothes.Heads_Wellsprings)
      Clothesui.ownedFaces_Wellsprings, Clothesui.totalFaces_Wellsprings = Clothesui.CountOwnedWeapons(groupedclothes.Faces_Wellsprings)
      Clothesui.ownedFeets_Wellsprings, Clothesui.totalFeets_Wellsprings = Clothesui.CountOwnedWeapons(groupedclothes.Feets_Wellsprings)
      Clothesui.ownedInnerTorsos_Wellsprings, Clothesui.totalInnerTorsos_Wellsprings = Clothesui.CountOwnedWeapons(groupedclothes.InnerTorsos_Wellsprings)
      Clothesui.ownedLegss_Wellsprings, Clothesui.totalLegss_Wellsprings = Clothesui.CountOwnedWeapons(groupedclothes.Legss_Wellsprings)
      Clothesui.ownedOuterTorsos_Wellsprings, Clothesui.totalOuterTorsos_Wellsprings = Clothesui.CountOwnedWeapons(groupedclothes.OuterTorsos_Wellsprings)
                                --vetement little_china
      Clothesui.ownedHeads_arroyo, Clothesui.totalHeads_arroyo = Clothesui.CountOwnedWeapons(groupedclothes.Heads_arroyo)
      Clothesui.ownedFaces_arroyo, Clothesui.totalFaces_arroyo = Clothesui.CountOwnedWeapons(groupedclothes.Faces_arroyo)
      Clothesui.ownedFeets_arroyo, Clothesui.totalFeets_arroyo = Clothesui.CountOwnedWeapons(groupedclothes.Feets_arroyo)
      Clothesui.ownedInnerTorsos_arroyo, Clothesui.totalInnerTorsos_arroyo = Clothesui.CountOwnedWeapons(groupedclothes.InnerTorsos_arroyo)
      Clothesui.ownedLegss_arroyo, Clothesui.totalLegss_arroyo = Clothesui.CountOwnedWeapons(groupedclothes.Legss_arroyo)
      Clothesui.ownedOuterTorsos_arroyo, Clothesui.totalOuterTorsos_arroyo= Clothesui.CountOwnedWeapons(groupedclothes.OuterTorsos_arroyo)
                                --vetement little_china
      Clothesui.ownedHeads_rancho_coronado, Clothesui.totalHeads_rancho_coronado = Clothesui.CountOwnedWeapons(groupedclothes.Heads_rancho_coronado)
      -- Clothesui.ownedFaces_rancho_coronado, Clothesui.totalFaces_rancho_coronado = Clothesui.CountOwnedWeapons(groupedclothes.Faces_rancho_coronado)
      Clothesui.ownedFeets_rancho_coronado, Clothesui.totalFeets_rancho_coronado = Clothesui.CountOwnedWeapons(groupedclothes.Feets_rancho_coronado)
      Clothesui.ownedInnerTorsos_rancho_coronado, Clothesui.totalInnerTorsos_rancho_coronado = Clothesui.CountOwnedWeapons(groupedclothes.InnerTorsos_rancho_coronado)
      Clothesui.ownedLegss_rancho_coronado, Clothesui.totalLegss_rancho_coronado = Clothesui.CountOwnedWeapons(groupedclothes.Legss_rancho_coronado)
      Clothesui.ownedOuterTorsos_rancho_coronado, Clothesui.totalOuterTorsos_rancho_coronado = Clothesui.CountOwnedWeapons(groupedclothes.OuterTorsos_rancho_coronado)
                                --vetement little_china
      Clothesui.ownedHeads_west_wind_estate, Clothesui.totalHeads_west_wind_estate = Clothesui.CountOwnedWeapons(groupedclothes.Heads_west_wind_estate)
      Clothesui.ownedFaces_west_wind_estate, Clothesui.totalFaces_west_wind_estate = Clothesui.CountOwnedWeapons(groupedclothes.Faces_west_wind_estate)
      Clothesui.ownedFeets_west_wind_estate, Clothesui.totalFeets_west_wind_estate = Clothesui.CountOwnedWeapons(groupedclothes.Feets_west_wind_estate)
      Clothesui.ownedInnerTorsos_west_wind_estate, Clothesui.totalInnerTorsos_west_wind_estate = Clothesui.CountOwnedWeapons(groupedclothes.InnerTorsos_west_wind_estate)
      Clothesui.ownedLegss_west_wind_estate, Clothesui.totalLegss_west_wind_estate = Clothesui.CountOwnedWeapons(groupedclothes.Legss_west_wind_estate)
      Clothesui.ownedOuterTorsos_west_wind_estate, Clothesui.totalOuterTorsos_west_wind_estate = Clothesui.CountOwnedWeapons(groupedclothes.OuterTorsos_west_wind_estate)
                                --vetement little_china
      Clothesui.ownedHeads_david_walker, Clothesui.totalHeads_david_walker = Clothesui.CountOwnedWeapons(groupedclothes.Heads_david_walker)
      Clothesui.ownedFaces_david_walker, Clothesui.totalFaces_david_walker = Clothesui.CountOwnedWeapons(groupedclothes.Faces_david_walker)
      Clothesui.ownedFeets_david_walker, Clothesui.totalFeets_david_walker = Clothesui.CountOwnedWeapons(groupedclothes.Feets_david_walker)
      Clothesui.ownedInnerTorsos_david_walker, Clothesui.totalInnerTorsos_david_walker = Clothesui.CountOwnedWeapons(groupedclothes.InnerTorsos_david_walker)
      Clothesui.ownedLegss_david_walker, Clothesui.totalLegss_david_walker = Clothesui.CountOwnedWeapons(groupedclothes.Legss_david_walker)
      Clothesui.ownedOuterTorsos_david_walker, Clothesui.totalOuterTorsos_david_walker = Clothesui.CountOwnedWeapons(groupedclothes.OuterTorsos_david_walker)
                                --vetement little_china
      Clothesui.ownedHeads_satoshi_ueno, Clothesui.totalHeads_satoshi_ueno = Clothesui.CountOwnedWeapons(groupedclothes.Heads_satoshi_ueno)
      Clothesui.ownedFaces_satoshi_ueno, Clothesui.totalFaces_satoshi_ueno = Clothesui.CountOwnedWeapons(groupedclothes.Faces_satoshi_ueno)
      Clothesui.ownedFeets_satoshi_ueno, Clothesui.totalFeets_satoshi_ueno = Clothesui.CountOwnedWeapons(groupedclothes.Feets_satoshi_ueno)
      Clothesui.ownedInnerTorsos_satoshi_ueno, Clothesui.totalInnerTorsos_satoshi_ueno = Clothesui.CountOwnedWeapons(groupedclothes.InnerTorsos_satoshi_ueno)
      Clothesui.ownedLegss_satoshi_ueno, Clothesui.totalLegss_satoshi_ueno = Clothesui.CountOwnedWeapons(groupedclothes.Legss_satoshi_ueno)
      Clothesui.ownedOuterTorsos_satoshi_ueno, Clothesui.totalOuterTorsos_satoshi_ueno = Clothesui.CountOwnedWeapons(groupedclothes.OuterTorsos_satoshi_ueno)
      --epilogue
      Clothesui.ownedThe_Star, Clothesui.totalThe_Star = Clothesui.CountOwnedWeapons(groupedclothes.The_Star_set)
      Clothesui.ownedTemperance, Clothesui.totalTemperance = Clothesui.CountOwnedWeapons(groupedclothes.Temperance_set)
      Clothesui.ownedThe_sun, Clothesui.totalThe_sun = Clothesui.CountOwnedWeapons(groupedclothes.The_sun_set)

      Clothesui.ownedNUS_Agent, Clothesui.totalNUS_Agent = Clothesui.CountOwnedWeapons(groupedclothes.NUS_Agent_set)
      Clothesui.ownedMaxTac, Clothesui.totalMaxTac = Clothesui.CountOwnedWeapons(groupedclothes.MaxTac_set)
      Clothesui.ownedYorinubo, Clothesui.totalYorinubo = Clothesui.CountOwnedWeapons(groupedclothes.Yorinubo_set)
      Clothesui.ownedThe_Rescue, Clothesui.totalThe_Rescue = Clothesui.CountOwnedWeapons(groupedclothes.V_The_Rescue_set)
      Clothesui.ownedStreetkid, Clothesui.totalStreetkid = Clothesui.CountOwnedWeapons(groupedclothes.V_streetkid_set)
      Clothesui.ownedNomad, Clothesui.totalNomad = Clothesui.CountOwnedWeapons(groupedclothes.V_nomad_set)
      Clothesui.ownedCorpo, Clothesui.totalCorpo = Clothesui.CountOwnedWeapons(groupedclothes.V_corpo_set)
      Clothesui.ownedJohnny_Silverhand, Clothesui.totalJohnny_Silverhand = Clothesui.CountOwnedWeapons(groupedclothes.Johnny_Silverhand_set)
      --Epilogue Sets
      Clothesui.ownedcop, Clothesui.totalcop = Clothesui.CountOwnedWeapons(groupedclothes.Cop_set)
      Clothesui.ownedCorporate, Clothesui.totalCorporate = Clothesui.CountOwnedWeapons(groupedclothes.Corporate_set)
      Clothesui.ownedFixer, Clothesui.totalFixer = Clothesui.CountOwnedWeapons(groupedclothes.Fixer_set)
      Clothesui.ownedMedia, Clothesui.totalMedia = Clothesui.CountOwnedWeapons(groupedclothes.Media_set)
      Clothesui.ownedNetrunner, Clothesui.totalNetrunner = Clothesui.CountOwnedWeapons(groupedclothes.Netrunner_set)
      Clothesui.ownedNomadset, Clothesui.totalNomadset = Clothesui.CountOwnedWeapons(groupedclothes.Nomad_set)
      Clothesui.ownedRocker, Clothesui.totalRocker = Clothesui.CountOwnedWeapons(groupedclothes.Rocker_set)
      Clothesui.ownedSolo, Clothesui.totalSolo = Clothesui.CountOwnedWeapons(groupedclothes.Solo_set)
      Clothesui.ownedTechie, Clothesui.totalTechie = Clothesui.CountOwnedWeapons(groupedclothes.Techie_set)
      -- Clothesui.totalOwnedHeadOther, Clothesui.totalClothesHeadOther = Clothesui.CountOwnedWeapons(groupedclothes.Haeds_other)

                                --vetement little_china
      Clothesui.ownedHeads_red_peaks, Clothesui.totalHeads_red_peaks = Clothesui.CountOwnedWeapons(groupedclothes.Heads_red_peaks)
      Clothesui.ownedFaces_red_peaks, Clothesui.totalFaces_red_peaks = Clothesui.CountOwnedWeapons(groupedclothes.Faces_red_peaks)
      Clothesui.ownedFeets_red_peaks, Clothesui.totalFeets_red_peaks = Clothesui.CountOwnedWeapons(groupedclothes.Feets_red_peaks)
      Clothesui.ownedInnerTorsos_red_peaks, Clothesui.totalInnerTorsos_red_peaks = Clothesui.CountOwnedWeapons(groupedclothes.InnerTorsos_red_peaks)
      Clothesui.ownedLegss_red_peaks, Clothesui.totalLegss_red_peaks = Clothesui.CountOwnedWeapons(groupedclothes.Legss_red_peaks)
    Clothesui.ownedOuterTorsos_red_peaks, Clothesui.totalOuterTorsos_red_peaks = Clothesui.CountOwnedWeapons(groupedclothes.OuterTorsos_red_peaks)

    Clothesui.ownedTotalHeads_northhside = Clothesui.ownedHeads_northhside or 0
      Clothesui.ownedTotalFaces_northhside = Clothesui.ownedFaces_northhside or 0
      Clothesui.ownedTotalFeets_northhside = Clothesui.ownedFeets_northhside or 0
      Clothesui.ownedTotalInnerTorsos_northhside = Clothesui.ownedInnerTorsos_northhside or 0
      Clothesui.ownedTotalLegss_northhside = Clothesui.ownedLegss_northhside or 0
      Clothesui.ownedTotalOuterTorsos_northhside = Clothesui.ownedOuterTorsos_northhside or 0
      Clothesui.totalHeads_northhside = Clothesui.totalHeads_northhside or 0
      Clothesui.totalFaces_northhside = Clothesui.totalFaces_northhside or 0
      Clothesui.totalFeets_northhside = Clothesui.totalFeets_northhside or 0
      Clothesui.totalInnerTorsos_northhside = Clothesui.totalInnerTorsos_northhside or 0
      Clothesui.totalLegss_northhside = Clothesui.totalLegss_northhside or 0
      Clothesui.totalOuterTorsos_northhside = Clothesui.totalOuterTorsos_northhside or 0

      Clothesui.ownedTotalHeads_kabuki = Clothesui.ownedHeads_kabuki or 0
      Clothesui.ownedTotalFaces_kabuki = Clothesui.ownedFaces_kabuki or 0
      Clothesui.ownedTotalFeets_kabuki = Clothesui.ownedFeets_kabuki or 0
      Clothesui.ownedTotalInnerTorsos_kabuki = Clothesui.ownedInnerTorsos_kabuki or 0
      Clothesui.ownedTotalLegss_kabuki = Clothesui.ownedLegss_kabuki or 0
      Clothesui.ownedTotalOuterTorsos_kabuki = Clothesui.ownedOuterTorsos_kabuki or 0
      Clothesui.totalHeads_kabuki = Clothesui.totalHeads_kabuki or 0
      Clothesui.totalFaces_kabuki = Clothesui.totalFaces_kabuki or 0
      Clothesui.totalFeets_kabuki = Clothesui.totalFeets_kabuki or 0
      Clothesui.totalInnerTorsos_kabuki = Clothesui.totalInnerTorsos_kabuki or 0
      Clothesui.totalLegss_kabuki = Clothesui.totalLegss_kabuki or 0
      Clothesui.totalOuterTorsos_kabuki = Clothesui.totalOuterTorsos_kabuki or 0

      Clothesui.ownedTotalHeads_little_china = Clothesui.ownedHeads_little_china or 0
      Clothesui.ownedTotalFaces_little_china = Clothesui.ownedFaces_little_china or 0
      Clothesui.ownedTotalFeets_little_china = Clothesui.ownedFeets_little_china or 0
      Clothesui.ownedTotalInnerTorsos_little_china = Clothesui.ownedInnerTorsos_little_china or 0
      Clothesui.ownedTotalLegss_little_china = Clothesui.ownedLegss_little_china or 0
      Clothesui.ownedTotalOuterTorsos_little_china = Clothesui.ownedOuterTorsos_little_china or 0
      Clothesui.totalHeads_little_china = Clothesui.totalHeads_little_china or 0
      Clothesui.totalFaces_little_china = Clothesui.totalFaces_little_china or 0
      Clothesui.totalFeets_little_china = Clothesui.totalFeets_little_china or 0
      Clothesui.totalInnerTorsos_little_china = Clothesui.totalInnerTorsos_little_china or 0
      Clothesui.totalLegss_little_china = Clothesui.totalLegss_little_china or 0
      Clothesui.totalOuterTorsos_little_china = Clothesui.totalOuterTorsos_little_china or 0

      Clothesui.ownedTotalHeads_Japantown = Clothesui.ownedHeads_Japantown or 0
      Clothesui.ownedTotalFaces_Japantown = Clothesui.ownedFaces_Japantown or 0
      Clothesui.ownedTotalFeets_Japantown = Clothesui.ownedFeets_Japantown or 0
      Clothesui.ownedTotalInnerTorsos_Japantown = Clothesui.ownedInnerTorsos_Japantown or 0
      Clothesui.ownedTotalLegss_Japantown = Clothesui.ownedLegss_Japantown or 0
      Clothesui.ownedTotalOuterTorsos_Japantown = Clothesui.ownedOuterTorsos_Japantown or 0
      Clothesui.totalHeads_Japantown = Clothesui.totalHeads_Japantown or 0
      Clothesui.totalFaces_Japantown = Clothesui.totalFaces_Japantown or 0
      Clothesui.totalFeets_Japantown = Clothesui.totalFeets_Japantown or 0
      Clothesui.totalInnerTorsos_Japantown = Clothesui.totalInnerTorsos_Japantown or 0
      Clothesui.totalLegss_Japantown = Clothesui.totalLegss_Japantown or 0
      Clothesui.totalOuterTorsos_Japantown = Clothesui.totalOuterTorsos_Japantown or 0

      Clothesui.ownedTotalHeads_Karim_Noel = Clothesui.ownedHeads_Karim_Noel or 0
      Clothesui.ownedTotalFaces_Karim_Noel = Clothesui.ownedFaces_Karim_Noel or 0
      Clothesui.ownedTotalFeets_Karim_Noel = Clothesui.ownedFeets_Karim_Noel or 0
      Clothesui.ownedTotalInnerTorsos_Karim_Noel = Clothesui.ownedInnerTorsos_Karim_Noel or 0
      Clothesui.ownedTotalLegss_Karim_Noel = Clothesui.ownedLegss_Karim_Noel or 0
      Clothesui.ownedTotalOuterTorsos_Karim_Noel = Clothesui.ownedOuterTorsos_Karim_Noel or 0
      Clothesui.totalHeads_Karim_Noel = Clothesui.totalHeads_Karim_Noel or 0
      Clothesui.totalFaces_Karim_Noel = Clothesui.totalFaces_Karim_Noel or 0
      Clothesui.totalFeets_Karim_Noel = Clothesui.totalFeets_Karim_Noel or 0
      Clothesui.totalInnerTorsos_Karim_Noel = Clothesui.totalInnerTorsos_Karim_Noel or 0
      Clothesui.totalLegss_Karim_Noel = Clothesui.totalLegss_Karim_Noel or 0
      Clothesui.totalOuterTorsos_Karim_Noel = Clothesui.totalOuterTorsos_Karim_Noel or 0

      Clothesui.ownedTotalHeads_Charter_Hill = Clothesui.ownedHeads_Charter_Hill or 0
      Clothesui.ownedTotalFaces_Charter_Hill = Clothesui.ownedFaces_Charter_Hill or 0
      Clothesui.ownedTotalFeets_Charter_Hill = Clothesui.ownedFeets_Charter_Hill or 0
      Clothesui.ownedTotalInnerTorsos_Charter_Hill = Clothesui.ownedInnerTorsos_Charter_Hill or 0
      Clothesui.ownedTotalLegss_Charter_Hill = Clothesui.ownedLegss_Charter_Hill or 0
      Clothesui.ownedTotalOuterTorsos_Charter_Hill = Clothesui.ownedOuterTorsos_Charter_Hill or 0
      Clothesui.totalHeads_Charter_Hill = Clothesui.totalHeads_Charter_Hill or 0
      Clothesui.totalFaces_Charter_Hill = Clothesui.totalFaces_Charter_Hill or 0
      Clothesui.totalFeets_Charter_Hill = Clothesui.totalFeets_Charter_Hill or 0
      Clothesui.totalInnerTorsos_Charter_Hill = Clothesui.totalInnerTorsos_Charter_Hill or 0
      Clothesui.totalLegss_Charter_Hill = Clothesui.totalLegss_Charter_Hill or 0
      Clothesui.totalOuterTorsos_Charter_Hill = Clothesui.totalOuterTorsos_Charter_Hill or 0

      Clothesui.ownedTotalHeads_Zane_Jagger = Clothesui.ownedHeads_Zane_Jagger or 0
      Clothesui.ownedTotalFaces_Zane_Jagger = Clothesui.ownedFaces_Zane_Jagger or 0
      Clothesui.ownedTotalFeets_Zane_Jagger = Clothesui.ownedFeets_Zane_Jagger or 0
      Clothesui.ownedTotalInnerTorsos_Zane_Jagger = Clothesui.ownedInnerTorsos_Zane_Jagger or 0
      Clothesui.ownedTotalLegss_Zane_Jagger = Clothesui.ownedLegss_Zane_Jagger or 0
      Clothesui.ownedTotalOuterTorsos_Zane_Jagger = Clothesui.ownedOuterTorsos_Zane_Jagger or 0
      Clothesui.totalHeads_Zane_Jagger = Clothesui.totalHeads_Zane_Jagger or 0
      Clothesui.totalFaces_Zane_Jagger = Clothesui.totalFaces_Zane_Jagger or 0
      Clothesui.totalFeets_Zane_Jagger = Clothesui.totalFeets_Zane_Jagger or 0
      Clothesui.totalInnerTorsos_Zane_Jagger = Clothesui.totalInnerTorsos_Zane_Jagger or 0
      Clothesui.totalLegss_Zane_Jagger = Clothesui.totalLegss_Zane_Jagger or 0
      Clothesui.totalOuterTorsos_Zane_Jagger = Clothesui.totalOuterTorsos_Zane_Jagger or 0

      Clothesui.ownedTotalHeads_corpo_plaza = Clothesui.ownedHeads_corpo_plaza or 0
      Clothesui.ownedTotalFaces_corpo_plaza = Clothesui.ownedFaces_corpo_plaza or 0
      Clothesui.ownedTotalFeets_corpo_plaza = Clothesui.ownedFeets_corpo_plaza or 0
      Clothesui.ownedTotalInnerTorsos_corpo_plaza = Clothesui.ownedInnerTorsos_corpo_plaza or 0
      Clothesui.ownedTotalLegss_corpo_plaza = Clothesui.ownedLegss_corpo_plaza or 0
      Clothesui.ownedTotalOuterTorsos_corpo_plaza = Clothesui.ownedOuterTorsos_corpo_plaza or 0
      Clothesui.totalHeads_corpo_plaza = Clothesui.totalHeads_corpo_plaza or 0
      Clothesui.totalFaces_corpo_plaza = Clothesui.totalFaces_corpo_plaza or 0
      Clothesui.totalFeets_corpo_plaza = Clothesui.totalFeets_corpo_plaza or 0
      Clothesui.totalInnerTorsos_corpo_plaza = Clothesui.totalInnerTorsos_corpo_plaza or 0
      Clothesui.totalLegss_corpo_plaza = Clothesui.totalLegss_corpo_plaza or 0
      Clothesui.totalOuterTorsos_corpo_plaza = Clothesui.totalOuterTorsos_corpo_plaza or 0

      Clothesui.ownedTotalHeads_Wellsprings = Clothesui.ownedHeads_Wellsprings or 0
      Clothesui.ownedTotalFaces_Wellsprings = Clothesui.ownedFaces_Wellsprings or 0
      Clothesui.ownedTotalFeets_Wellsprings = Clothesui.ownedFeets_Wellsprings or 0
      Clothesui.ownedTotalInnerTorsos_Wellsprings = Clothesui.ownedInnerTorsos_Wellsprings or 0
      Clothesui.ownedTotalLegss_Wellsprings = Clothesui.ownedLegss_Wellsprings or 0
      Clothesui.ownedTotalOuterTorsos_Wellsprings = Clothesui.ownedOuterTorsos_Wellsprings or 0
      Clothesui.totalHeads_Wellsprings = Clothesui.totalHeads_Wellsprings or 0
      Clothesui.totalFaces_Wellsprings = Clothesui.totalFaces_Wellsprings or 0
      Clothesui.totalFeets_Wellsprings = Clothesui.totalFeets_Wellsprings or 0
      Clothesui.totalInnerTorsos_Wellsprings = Clothesui.totalInnerTorsos_Wellsprings or 0
      Clothesui.totalLegss_Wellsprings = Clothesui.totalLegss_Wellsprings or 0
      Clothesui.totalOuterTorsos_Wellsprings = Clothesui.totalOuterTorsos_Wellsprings or 0

      Clothesui.ownedTotalHeads_arroyo = Clothesui.ownedHeads_arroyo or 0
      Clothesui.ownedTotalFaces_arroyo = Clothesui.ownedFaces_arroyo or 0
      Clothesui.ownedTotalFeets_arroyo = Clothesui.ownedFeets_arroyo or 0
      Clothesui.ownedTotalInnerTorsos_arroyo = Clothesui.ownedInnerTorsos_arroyo or 0
      Clothesui.ownedTotalLegss_arroyo = Clothesui.ownedLegss_arroyo or 0
      Clothesui.ownedTotalOuterTorsos_arroyo = Clothesui.ownedOuterTorsos_arroyo or 0
      Clothesui.totalHeads_arroyo = Clothesui.totalHeads_arroyo or 0
      Clothesui.totalFaces_arroyo = Clothesui.totalFaces_arroyo or 0
      Clothesui.totalFeets_arroyo = Clothesui.totalFeets_arroyo or 0
      Clothesui.totalInnerTorsos_arroyo = Clothesui.totalInnerTorsos_arroyo or 0
      Clothesui.totalLegss_arroyo = Clothesui.totalLegss_arroyo or 0
      Clothesui.totalOuterTorsos_arroyo = Clothesui.totalOuterTorsos_arroyo or 0

      Clothesui.ownedTotalHeads_rancho_coronado = Clothesui.ownedHeads_rancho_coronado or 0
      Clothesui.ownedTotalFeets_rancho_coronado = Clothesui.ownedFeets_rancho_coronado or 0
      Clothesui.ownedTotalInnerTorsos_rancho_coronado = Clothesui.ownedInnerTorsos_rancho_coronado or 0
      Clothesui.ownedTotalLegss_rancho_coronado = Clothesui.ownedLegss_rancho_coronado or 0
      Clothesui.ownedTotalOuterTorsos_rancho_coronado = Clothesui.ownedOuterTorsos_rancho_coronado or 0
      Clothesui.totalHeads_rancho_coronado = Clothesui.totalHeads_rancho_coronado or 0
      Clothesui.totalFeets_rancho_coronado = Clothesui.totalFeets_rancho_coronado or 0
      Clothesui.totalInnerTorsos_rancho_coronado = Clothesui.totalInnerTorsos_rancho_coronado or 0
      Clothesui.totalLegss_rancho_coronado = Clothesui.totalLegss_rancho_coronado or 0
      Clothesui.totalOuterTorsos_rancho_coronado = Clothesui.totalOuterTorsos_rancho_coronado or 0

      Clothesui.ownedTotalHeads_west_wind_estate = Clothesui.ownedHeads_west_wind_estate or 0
      Clothesui.ownedTotalFaces_west_wind_estate = Clothesui.ownedFaces_west_wind_estate or 0
      Clothesui.ownedTotalFeets_west_wind_estate = Clothesui.ownedFeets_west_wind_estate or 0
      Clothesui.ownedTotalInnerTorsos_west_wind_estate = Clothesui.ownedInnerTorsos_west_wind_estate or 0
      Clothesui.ownedTotalLegss_west_wind_estate = Clothesui.ownedLegss_west_wind_estate or 0
      Clothesui.ownedTotalOuterTorsos_west_wind_estate = Clothesui.ownedOuterTorsos_west_wind_estate or 0
      Clothesui.totalHeads_west_wind_estate = Clothesui.totalHeads_west_wind_estate or 0
      Clothesui.totalFaces_west_wind_estate = Clothesui.totalFaces_west_wind_estate or 0
      Clothesui.totalFeets_west_wind_estate = Clothesui.totalFeets_west_wind_estate or 0
      Clothesui.totalInnerTorsos_west_wind_estate = Clothesui.totalInnerTorsos_west_wind_estate or 0
      Clothesui.totalLegss_west_wind_estate = Clothesui.totalLegss_west_wind_estate or 0
      Clothesui.totalOuterTorsos_west_wind_estate = Clothesui.totalOuterTorsos_west_wind_estate or 0

      Clothesui.ownedTotalHeads_david_walker = Clothesui.ownedHeads_david_walker or 0
      Clothesui.ownedTotalFaces_david_walker = Clothesui.ownedFaces_david_walker or 0
      Clothesui.ownedTotalFeets_david_walker = Clothesui.ownedFeets_david_walker or 0
      Clothesui.ownedTotalInnerTorsos_david_walker = Clothesui.ownedInnerTorsos_david_walker or 0
      Clothesui.ownedTotalLegss_david_walker = Clothesui.ownedLegss_david_walker or 0
      Clothesui.ownedTotalOuterTorsos_david_walker = Clothesui.ownedOuterTorsos_david_walker or 0
      Clothesui.totalHeads_david_walker = Clothesui.totalHeads_david_walker or 0
      Clothesui.totalFaces_david_walker = Clothesui.totalFaces_david_walker or 0
      Clothesui.totalFeets_david_walker = Clothesui.totalFeets_david_walker or 0
      Clothesui.totalInnerTorsos_david_walker = Clothesui.totalInnerTorsos_david_walker or 0
      Clothesui.totalLegss_david_walker = Clothesui.totalLegss_david_walker or 0
      Clothesui.totalOuterTorsos_david_walker = Clothesui.totalOuterTorsos_david_walker or 0

      Clothesui.ownedTotalHeads_satoshi_ueno = Clothesui.ownedHeads_satoshi_ueno or 0
      Clothesui.ownedTotalFaces_satoshi_ueno = Clothesui.ownedFaces_satoshi_ueno or 0
      Clothesui.ownedTotalFeets_satoshi_ueno = Clothesui.ownedFeets_satoshi_ueno or 0
      Clothesui.ownedTotalInnerTorsos_satoshi_ueno = Clothesui.ownedInnerTorsos_satoshi_ueno or 0
      Clothesui.ownedTotalLegss_satoshi_ueno = Clothesui.ownedLegss_satoshi_ueno or 0
      Clothesui.ownedTotalOuterTorsos_satoshi_ueno = Clothesui.ownedOuterTorsos_satoshi_ueno or 0
      Clothesui.totalHeads_satoshi_ueno = Clothesui.totalHeads_satoshi_ueno or 0
      Clothesui.totalFaces_satoshi_ueno = Clothesui.totalFaces_satoshi_ueno or 0
      Clothesui.totalFeets_satoshi_ueno = Clothesui.totalFeets_satoshi_ueno or 0
      Clothesui.totalInnerTorsos_satoshi_ueno = Clothesui.totalInnerTorsos_satoshi_ueno or 0
      Clothesui.totalLegss_satoshi_ueno = Clothesui.totalLegss_satoshi_ueno or 0
      Clothesui.totalOuterTorsos_satoshi_ueno = Clothesui.totalOuterTorsos_satoshi_ueno or 0

      Clothesui.ownedTotalThe_Star = Clothesui.ownedThe_Star or 0
      Clothesui.ownedTotalTemperance = Clothesui.ownedTemperance or 0
      Clothesui.ownedTotalThe_sun = Clothesui.ownedThe_sun or 0
      Clothesui.totalThe_Star = Clothesui.totalThe_Star or 0
      Clothesui.totalTemperance = Clothesui.totalTemperance or 0
      Clothesui.totalThe_sun = Clothesui.totalThe_sun or 0

      Clothesui.ownedTotalNUS_Agent = Clothesui.ownedNUS_Agent or 0
      Clothesui.ownedTotalMaxTac = Clothesui.ownedMaxTac or 0
      Clothesui.ownedTotalYorinubo = Clothesui.ownedYorinubo or 0
      Clothesui.ownedTotalThe_Rescue = Clothesui.ownedThe_Rescue or 0
      Clothesui.ownedTotalStreetkid = Clothesui.ownedStreetkid or 0
      Clothesui.ownedTotalNomad = Clothesui.ownedNomad or 0
      Clothesui.ownedTotalCorpo = Clothesui.ownedCorpo or 0
      Clothesui.ownedTotalJohnny_Silverhand = Clothesui.ownedJohnny_Silverhand or 0
      Clothesui.totalNUS_Agent = Clothesui.totalNUS_Agent or 0
      Clothesui.totalMaxTac = Clothesui.totalMaxTac or 0
      Clothesui.totalYorinubo = Clothesui.totalYorinubo or 0
      Clothesui.totalThe_Rescue = Clothesui.totalThe_Rescue or 0
      Clothesui.totalStreetkid = Clothesui.totalStreetkid or 0
      Clothesui.totalNomad = Clothesui.totalNomad or 0
      Clothesui.totalCorpo = Clothesui.totalCorpo or 0
      Clothesui.totalJohnny_Silverhand = Clothesui.totalJohnny_Silverhand or 0

      Clothesui.ownedTotalcop = Clothesui.ownedcop or 0
      Clothesui.ownedtotalCorporate = Clothesui.ownedCorporate or 0
      Clothesui.ownedTotalFixer = Clothesui.ownedFixer or 0
      Clothesui.ownedTotalMedia = Clothesui.ownedMedia or 0
      Clothesui.ownedTotalNetrunner = Clothesui.ownedNetrunner or 0
      Clothesui.ownedTotalNomadset = Clothesui.ownedNomadset or 0
      Clothesui.ownedTotalRocker = Clothesui.ownedRocker or 0
      Clothesui.ownedTotalSolo = Clothesui.ownedSolo or 0
      Clothesui.ownedTotalTechie = Clothesui.ownedTechie or 0
      -- Clothesui.ownedTotalHeadOther = Clothesui.ownedHeadOther or 0
      Clothesui.totalcop = Clothesui.totalcop or 0
      Clothesui.totalCorporate = Clothesui.totalCorporate or 0
      Clothesui.totalFixer = Clothesui.totalFixer or 0
      Clothesui.totalMedia = Clothesui.totalMedia or 0
      Clothesui.totalNetrunner = Clothesui.totalNetrunner or 0
      Clothesui.totalNomadset = Clothesui.totalNomadset or 0
      Clothesui.totalRocker = Clothesui.totalRocker or 0
      Clothesui.totalSolo = Clothesui.totalSolo or 0
      Clothesui.totalTechie = Clothesui.totalTechie or 0
      -- Clothesui.totalHeadOther = Clothesui.totalClothesHeadOther or 0

      Clothesui.ownedTotalHeads_red_peaks = Clothesui.ownedHeads_red_peaks or 0
      Clothesui.ownedTotalFaces_red_peaks = Clothesui.ownedFaces_red_peaks or 0
      Clothesui.ownedTotalFeets_red_peaks = Clothesui.ownedFeets_red_peaks or 0
      Clothesui.ownedTotalInnerTorsos_red_peaks = Clothesui.ownedInnerTorsos_red_peaks or 0
      Clothesui.ownedTotalLegss_red_peaks = Clothesui.ownedLegss_red_peaks or 0
      Clothesui.ownedTotalOuterTorsos_red_peaks = Clothesui.ownedOuterTorsos_red_peaks or 0
      Clothesui.totalHeads_red_peaks = Clothesui.totalHeads_red_peaks or 0
      Clothesui.totalFaces_red_peaks = Clothesui.totalFaces_red_peaks or 0
      Clothesui.totalFeets_red_peaks = Clothesui.totalFeets_red_peaks or 0
      Clothesui.totalInnerTorsos_red_peaks = Clothesui.totalInnerTorsos_red_peaks or 0
      Clothesui.totalLegss_red_peaks = Clothesui.totalLegss_red_peaks or 0
    Clothesui.totalOuterTorsos_red_peaks = Clothesui.totalOuterTorsos_red_peaks or 0


    Clothesui.ownedTotalnorthside =
    Clothesui.ownedTotalHeads_northhside +
    Clothesui.ownedTotalFaces_northhside +
    Clothesui.ownedTotalFeets_northhside +
    Clothesui.ownedTotalInnerTorsos_northhside +
    Clothesui.ownedTotalLegss_northhside +
    Clothesui.ownedTotalOuterTorsos_northhside 
   

    Clothesui.totalTotalnorthside =
    Clothesui.totalHeads_northhside +
    Clothesui.totalFaces_northhside +
    Clothesui.totalFeets_northhside +
    Clothesui.totalInnerTorsos_northhside +
    Clothesui.totalLegss_northhside +
    Clothesui.totalOuterTorsos_northhside 
    
    Clothesui.ownedTotalkabuki =
    Clothesui.ownedTotalHeads_kabuki +
    Clothesui.ownedTotalFaces_kabuki +
    Clothesui.ownedTotalFeets_kabuki +
    Clothesui.ownedTotalInnerTorsos_kabuki +
    Clothesui.ownedTotalLegss_kabuki +
    Clothesui.ownedTotalOuterTorsos_kabuki 
   

    Clothesui.totalTotalkabuki =
    Clothesui.totalHeads_kabuki +
    Clothesui.totalFaces_kabuki +
    Clothesui.totalFeets_kabuki +
    Clothesui.totalInnerTorsos_kabuki +
    Clothesui.totalLegss_kabuki +
    Clothesui.totalOuterTorsos_kabuki  

    Clothesui.ownedTotallittle_china =
    Clothesui.ownedTotalHeads_little_china +
    Clothesui.ownedTotalFaces_little_china +
    Clothesui.ownedTotalFeets_little_china +
    Clothesui.ownedTotalInnerTorsos_little_china +
    Clothesui.ownedTotalLegss_little_china +
    Clothesui.ownedTotalOuterTorsos_little_china 
   

    Clothesui.totalTotallittle_china =
    Clothesui.totalHeads_little_china +
    Clothesui.totalFaces_little_china +
    Clothesui.totalFeets_little_china +
    Clothesui.totalInnerTorsos_little_china +
    Clothesui.totalLegss_little_china +
    Clothesui.totalOuterTorsos_little_china 


    Clothesui.ownedTotalJapantown =
    Clothesui.ownedTotalHeads_Japantown +
    Clothesui.ownedTotalFaces_Japantown +
    Clothesui.ownedTotalFeets_Japantown +
    Clothesui.ownedTotalInnerTorsos_Japantown +
    Clothesui.ownedTotalLegss_Japantown +
    Clothesui.ownedTotalOuterTorsos_Japantown 
   

    Clothesui.totalTotalJapantown =
    Clothesui.totalHeads_Japantown +
    Clothesui.totalFaces_Japantown +
    Clothesui.totalFeets_Japantown +
    Clothesui.totalInnerTorsos_Japantown +
    Clothesui.totalLegss_Japantown +
    Clothesui.totalOuterTorsos_Japantown 


    Clothesui.ownedTotalKarim_Noel =
    Clothesui.ownedTotalHeads_Karim_Noel +
    Clothesui.ownedTotalFaces_Karim_Noel +
    Clothesui.ownedTotalFeets_Karim_Noel +
    Clothesui.ownedTotalInnerTorsos_Karim_Noel +
    Clothesui.ownedTotalLegss_Karim_Noel +
    Clothesui.ownedTotalOuterTorsos_Karim_Noel 
   

    Clothesui.totalTotalKarim_Noel =
    Clothesui.totalHeads_Karim_Noel +
    Clothesui.totalFaces_Karim_Noel +
    Clothesui.totalFeets_Karim_Noel +
    Clothesui.totalInnerTorsos_Karim_Noel +
    Clothesui.totalLegss_Karim_Noel +
    Clothesui.totalOuterTorsos_Karim_Noel 

    Clothesui.ownedTotalCharter_Hill =
    Clothesui.ownedTotalHeads_Charter_Hill +
    Clothesui.ownedTotalFaces_Charter_Hill +
    Clothesui.ownedTotalFeets_Charter_Hill +
    Clothesui.ownedTotalInnerTorsos_Charter_Hill +
    Clothesui.ownedTotalLegss_Charter_Hill +
    Clothesui.ownedTotalOuterTorsos_Charter_Hill 
   

    Clothesui.totalTotalCharter_Hill =
    Clothesui.totalHeads_Charter_Hill +
    Clothesui.totalFaces_Charter_Hill +
    Clothesui.totalFeets_Charter_Hill +
    Clothesui.totalInnerTorsos_Charter_Hill +
    Clothesui.totalLegss_Charter_Hill +
    Clothesui.totalOuterTorsos_Charter_Hill 

    Clothesui.ownedTotalZane_Jagger =
    Clothesui.ownedTotalHeads_Zane_Jagger +
    Clothesui.ownedTotalFaces_Zane_Jagger +
    Clothesui.ownedTotalFeets_Zane_Jagger +
    Clothesui.ownedTotalInnerTorsos_Zane_Jagger +
    Clothesui.ownedTotalLegss_Zane_Jagger +
    Clothesui.ownedTotalOuterTorsos_Zane_Jagger 
   

    Clothesui.totalTotalZane_Jagger =
    Clothesui.totalHeads_Zane_Jagger +
    Clothesui.totalFaces_Zane_Jagger +
    Clothesui.totalFeets_Zane_Jagger +
    Clothesui.totalInnerTorsos_Zane_Jagger +
    Clothesui.totalLegss_Zane_Jagger +
    Clothesui.totalOuterTorsos_Zane_Jagger 

    Clothesui.ownedTotalcorpo_plaza =
    Clothesui.ownedTotalHeads_corpo_plaza +
    Clothesui.ownedTotalFaces_corpo_plaza +
    Clothesui.ownedTotalFeets_corpo_plaza +
    Clothesui.ownedTotalInnerTorsos_corpo_plaza +
    Clothesui.ownedTotalLegss_corpo_plaza +
    Clothesui.ownedTotalOuterTorsos_corpo_plaza 
   

    Clothesui.totalTotalcorpo_plaza =
    Clothesui.totalHeads_corpo_plaza +
    Clothesui.totalFaces_corpo_plaza +
    Clothesui.totalFeets_corpo_plaza +
    Clothesui.totalInnerTorsos_corpo_plaza +
    Clothesui.totalLegss_corpo_plaza +
    Clothesui.totalOuterTorsos_corpo_plaza 

    Clothesui.ownedTotalWellsprings =
    Clothesui.ownedTotalHeads_Wellsprings +
    Clothesui.ownedTotalFaces_Wellsprings +
    Clothesui.ownedTotalFeets_Wellsprings +
    Clothesui.ownedTotalInnerTorsos_Wellsprings +
    Clothesui.ownedTotalLegss_Wellsprings +
    Clothesui.ownedTotalOuterTorsos_Wellsprings 
   

    Clothesui.totalTotalWellsprings =
    Clothesui.totalHeads_Wellsprings +
    Clothesui.totalFaces_Wellsprings +
    Clothesui.totalFeets_Wellsprings +
    Clothesui.totalInnerTorsos_Wellsprings +
    Clothesui.totalLegss_Wellsprings +
    Clothesui.totalOuterTorsos_Wellsprings 

    Clothesui.ownedTotalarroyo =
    Clothesui.ownedTotalHeads_arroyo +
    Clothesui.ownedTotalFaces_arroyo +
    Clothesui.ownedTotalFeets_arroyo +
    Clothesui.ownedTotalInnerTorsos_arroyo +
    Clothesui.ownedTotalLegss_arroyo +
    Clothesui.ownedTotalOuterTorsos_arroyo 
   

    Clothesui.totalTotalarroyo =
    Clothesui.totalHeads_arroyo +
    Clothesui.totalFaces_arroyo +
    Clothesui.totalFeets_arroyo +
    Clothesui.totalInnerTorsos_arroyo +
    Clothesui.totalLegss_arroyo +
    Clothesui.totalOuterTorsos_arroyo 

   
    Clothesui.ownedTotalrancho_coronado =
    Clothesui.ownedTotalHeads_rancho_coronado +
    Clothesui.ownedTotalFeets_rancho_coronado +
    Clothesui.ownedTotalInnerTorsos_rancho_coronado +
    Clothesui.ownedTotalLegss_rancho_coronado +
    Clothesui.ownedTotalOuterTorsos_rancho_coronado 
   

    Clothesui.totalTotalrancho_coronado =
    Clothesui.totalHeads_rancho_coronado +
    Clothesui.totalFeets_rancho_coronado +
    Clothesui.totalInnerTorsos_rancho_coronado +
    Clothesui.totalLegss_rancho_coronado +
    Clothesui.totalOuterTorsos_rancho_coronado 

    Clothesui.ownedTotalwest_wind_estate =
    Clothesui.ownedTotalHeads_west_wind_estate +
    Clothesui.ownedTotalFeets_west_wind_estate +
    Clothesui.ownedTotalFaces_west_wind_estate +
    Clothesui.ownedTotalInnerTorsos_west_wind_estate +
    Clothesui.ownedTotalOuterTorsos_west_wind_estate +
    Clothesui.ownedTotalLegss_west_wind_estate 
   

    Clothesui.totalTotalwest_wind_estate =
    Clothesui.totalHeads_west_wind_estate +
    Clothesui.totalFeets_west_wind_estate +
    Clothesui.totalFaces_west_wind_estate +
    Clothesui.totalInnerTorsos_west_wind_estate +
    Clothesui.totalOuterTorsos_west_wind_estate +
    Clothesui.totalLegss_west_wind_estate 

    Clothesui.ownedTotaldavid_walker =
    Clothesui.ownedTotalHeads_david_walker +
    Clothesui.ownedTotalFeets_david_walker +
    Clothesui.ownedTotalFaces_david_walker +
    Clothesui.ownedTotalInnerTorsos_david_walker +
    Clothesui.ownedTotalOuterTorsos_david_walker + 
    Clothesui.ownedTotalLegss_david_walker 
   

    Clothesui.totalTotaldavid_walker =
    Clothesui.totalHeads_david_walker +
    Clothesui.totalFeets_david_walker +
    Clothesui.totalFaces_david_walker +
    Clothesui.totalInnerTorsos_david_walker +
    Clothesui.totalOuterTorsos_david_walker + 
    Clothesui.totalLegss_david_walker 

    Clothesui.ownedTotalsatoshi_ueno =
    Clothesui.ownedTotalHeads_satoshi_ueno +
    Clothesui.ownedTotalFaces_satoshi_ueno +
    Clothesui.ownedTotalFeets_satoshi_ueno +
    Clothesui.ownedTotalInnerTorsos_satoshi_ueno +
    Clothesui.ownedTotalLegss_satoshi_ueno +
    Clothesui.ownedTotalOuterTorsos_satoshi_ueno 
   

    Clothesui.totalTotalsatoshi_ueno =
    Clothesui.totalHeads_satoshi_ueno +
    Clothesui.totalFaces_satoshi_ueno +
    Clothesui.totalFeets_satoshi_ueno +
    Clothesui.totalInnerTorsos_satoshi_ueno +
    Clothesui.totalOuterTorsos_satoshi_ueno +
    Clothesui.totalLegss_satoshi_ueno 

    Clothesui.ownedTotalred_peaks =
    Clothesui.ownedTotalHeads_red_peaks +
    Clothesui.ownedTotalFaces_red_peaks +
    Clothesui.ownedTotalFeets_red_peaks +
    Clothesui.ownedTotalInnerTorsos_red_peaks +
    Clothesui.ownedTotalOuterTorsos_red_peaks +
    Clothesui.ownedTotalLegss_red_peaks 
   

    Clothesui.totalTotalred_peaks =
    Clothesui.totalHeads_red_peaks +
    Clothesui.totalFaces_red_peaks +
    Clothesui.totalFeets_red_peaks +
    Clothesui.totalInnerTorsos_red_peaks +
    Clothesui.totalLegss_red_peaks +
    Clothesui.totalOuterTorsos_red_peaks 

    Clothesui.ownedTotalSets =
    Clothesui.ownedTotalNUS_Agent +
    Clothesui.ownedTotalMaxTac +
    Clothesui.ownedTotalYorinubo +
    Clothesui.ownedTotalThe_Rescue +
    -- Clothesui.ownedTotalStreetkid or
    -- Clothesui.ownedTotalNomad or
    -- Clothesui.ownedTotalCorpo +
    Clothesui.ownedTotalJohnny_Silverhand 
   

    Clothesui.totalTotalSets =
    Clothesui.totalNUS_Agent +
    Clothesui.totalMaxTac +
    Clothesui.totalYorinubo +
    Clothesui.totalThe_Rescue +
    -- Clothesui.totalStreetkid or
    -- Clothesui.totalNomad or
    -- Clothesui.totalCorpo +
    Clothesui.totalJohnny_Silverhand 

    if ATT.currentProfile == "nomad" then
        Clothesui.ownedTotalSets = Clothesui.ownedTotalSets + Clothesui.ownedTotalNomad 
        Clothesui.totalTotalSets = Clothesui.totalTotalSets + Clothesui.totalNomad 
    elseif ATT.currentProfile == "att1" then
        Clothesui.ownedTotalSets = Clothesui.ownedTotalSets + Clothesui.ownedTotalStreetkid 
        Clothesui.totalTotalSets = Clothesui.totalTotalSets + Clothesui.totalStreetkid 
    elseif ATT.currentProfile == "att2" then
        Clothesui.ownedTotalSets = Clothesui.ownedTotalSets + Clothesui.ownedTotalCorpo 
        Clothesui.totalTotalSets = Clothesui.totalTotalSets + Clothesui.totalCorpo 
    end
        
    Clothesui.ownedTotalepilogue =
    Clothesui.ownedTotalThe_Star +
    Clothesui.ownedTotalTemperance +
    Clothesui.ownedTotalThe_sun 
   

    Clothesui.totalTotalepilogue =
    Clothesui.totalThe_Star +
    Clothesui.totalTemperance +
    Clothesui.totalThe_sun 
   
        
    Clothesui.ownedTotalroleset =
    Clothesui.ownedTotalcop +
    Clothesui.ownedtotalCorporate +
    Clothesui.ownedTotalFixer +
    Clothesui.ownedTotalMedia +
    Clothesui.ownedTotalNetrunner +
    Clothesui.ownedTotalNomadset +
    Clothesui.ownedTotalRocker +
    Clothesui.ownedTotalSolo +
    Clothesui.ownedTotalTechie --+
    -- Clothesui.ownedTotalHeadOther 
   

    Clothesui.totalTotalroleset =
    Clothesui.totalcop +
    Clothesui.totalCorporate +
    Clothesui.totalFixer +
    Clothesui.totalMedia +
    Clothesui.totalNetrunner +
    Clothesui.totalNomadset +
    Clothesui.totalRocker +
    Clothesui.totalSolo +
    Clothesui.totalTechie --+
    -- Clothesui.totalHeadOther 
   
   



    Clothesui.ownedTotalwattson = 
    Clothesui.ownedTotalnorthside +
    Clothesui.ownedTotalkabuki +
    Clothesui.ownedTotallittle_china
    
    Clothesui.totalTotalwattson =
    Clothesui.totalTotalnorthside +
    Clothesui.totalTotalkabuki +
    Clothesui.totalTotallittle_china

    Clothesui.ownedTotalsantodomingo = 
    Clothesui.ownedTotalarroyo +
    Clothesui.ownedTotalrancho_coronado 
    
    Clothesui.totalTotalsantodomingo =
    Clothesui.totalTotalarroyo +
    Clothesui.totalTotalrancho_coronado

    Clothesui.ownedTotalwestbrook = 
    Clothesui.ownedTotalJapantown +
    Clothesui.ownedTotalCharter_Hill 
    
    Clothesui.totalTotalwestbrook =
    Clothesui.totalTotalJapantown +
    Clothesui.totalTotalCharter_Hill 

    Clothesui.ownedTotalcitycenter = 
    Clothesui.ownedTotalZane_Jagger +
    Clothesui.ownedTotalcorpo_plaza 
    
    Clothesui.totalTotalcitycenter =
    Clothesui.totalTotalZane_Jagger +
    Clothesui.totalTotalcorpo_plaza 

    Clothesui.ownedTotalbadlands = 
    Clothesui.ownedTotalred_peaks 
    
    Clothesui.totalTotalbadlands =
    Clothesui.totalTotalred_peaks 

    Clothesui.ownedTotalheywood = 
    Clothesui.ownedTotalWellsprings
    
    Clothesui.totalTotalheywood =
    Clothesui.totalTotalWellsprings

    Clothesui.ownedTotalpacifica = 
    Clothesui.ownedTotalwest_wind_estate +
    Clothesui.ownedTotaldavid_walker +
    Clothesui.ownedTotalsatoshi_ueno
    
    Clothesui.totalTotalpacifica =
    Clothesui.totalTotalwest_wind_estate +
    Clothesui.totalTotaldavid_walker +
    Clothesui.totalTotalsatoshi_ueno


    -- Clothesui.ownedTotalroleOther = 
    -- Clothesui.ownedTotalHeadOther
    -- Clothesui.totalTotalroleOther =
    -- Clothesui.totalHeadOther



    Clothesui.ownedTotalsetcosmetic = 
    Clothesui.ownedTotalSets +
    Clothesui.ownedTotalepilogue +
    Clothesui.ownedTotalroleset --+
    -- Clothesui.ownedTotalroleOther  

    
    Clothesui.totalTotalsetcosmetic =
    Clothesui.totalTotalSets +
    Clothesui.totalTotalepilogue +
    Clothesui.totalTotalroleset-- +
    -- Clothesui.totalTotalroleOther 

    Clothesui.ownedTotalClothesui=
    Clothesui.ownedTotalwattson +
    Clothesui.ownedTotalsantodomingo +
    Clothesui.ownedTotalwestbrook +
    Clothesui.ownedTotalcitycenter +
    Clothesui.ownedTotalbadlands +
    Clothesui.ownedTotalheywood +
    Clothesui.ownedTotalpacifica +
    -- Clothesui.ownedTotalroleOther +
    Clothesui.ownedTotalsetcosmetic
    
    Clothesui.totalTotalClothesui=
    Clothesui.totalTotalwattson +
    Clothesui.totalTotalsantodomingo +
    Clothesui.totalTotalwestbrook +
    Clothesui.totalTotalcitycenter +
    Clothesui.totalTotalbadlands +
    Clothesui.totalTotalheywood +
    Clothesui.totalTotalpacifica +
    -- Clothesui.totalTotalroleOther +
    Clothesui.totalTotalsetcosmetic



return Clothesui.ownedTotalClothesui, Clothesui.totalTotalClothesui








end

function Clothesui.uiclothes()
    Clothesui.uiclothesWattson()
    Clothesui.uiclothessantodomingo()
    Clothesui.uiclotheswestbrook()
    Clothesui.uiclothescitycenter()
    Clothesui.uiclothesbadlands()
    Clothesui.uiclothesheywood()
    Clothesui.uiclothespacifica()
    Clothesui.uiclothessetcosmetic()
end

function Clothesui.uiclothesWattson()
  
  if ImGui.CollapsingHeader(string.format("Wattson (%d/%d)",Clothesui.ownedTotalwattson or 0, Clothesui.totalTotalwattson or 0)) then
    ImGui.Indent(20)
    if ImGui.CollapsingHeader(string.format("northside (%d/%d)",Clothesui.ownedTotalnorthside or 0, Clothesui.totalTotalnorthside or 0)) then
      ImGui.Indent(20)
      if ImGui.Button(string.format(T("ATT_HEAD") .."(%d/%d)",Clothesui.ownedTotalHeads_northhside or 0, Clothesui.totalHeads_northhside or 0), -1, 0) then
        setActive("Clothesui", "showHeads_northhside")
      end
      if ImGui.Button(string.format(T("ATT_FEET") .." (%d/%d)",Clothesui.ownedTotalFeets_northhside or 0, Clothesui.totalFeets_northhside or 0), -1, 0) then
        setActive("Clothesui", "showFeets_northhside")
      end
      if ImGui.Button(string.format(T("ATT_FACE") .." (%d/%d)",Clothesui.ownedTotalFaces_northhside or 0, Clothesui.totalFaces_northhside or 0), -1, 0) then
              setActive("Clothesui", "showFaces_northhside")
      end
      if ImGui.Button(string.format(T("ATT_INNERTORSOS") .." (%d/%d)",Clothesui.ownedTotalInnerTorsos_northhside or 0, Clothesui.totalInnerTorsos_northhside or 0), -1, 0) then
              setActive("Clothesui", "showInnerTorsos_northhside")
      end
      if ImGui.Button(string.format(T("ATT_OUTERTORSOS") .." (%d/%d)",Clothesui.ownedTotalOuterTorsos_northhside or 0, Clothesui.totalOuterTorsos_northhside or 0), -1, 0) then
              setActive("Clothesui", "showOuterTorsos_northhside")
      end
      if ImGui.Button(string.format(T("ATT_LEGS") .." (%d/%d)",Clothesui.ownedTotalLegss_northhside or 0, Clothesui.totalLegss_northhside or 0), -1, 0) then
              setActive("Clothesui", "showLegss_northhside")
      end
      ImGui.Unindent(20)
    end
    if ImGui.CollapsingHeader(string.format("kabuki (%d/%d)",Clothesui.ownedTotalkabuki or 0, Clothesui.totalTotalkabuki or 0)) then
      ImGui.Indent(20)
      if ImGui.Button(string.format(T("ATT_HEAD") .."(%d/%d)",Clothesui.ownedTotalHeads_kabuki or 0, Clothesui.totalHeads_kabuki or 0), -1, 0) then
              setActive("Clothesui", "showHeads_kabuki")
      end
      if ImGui.Button(string.format(T("ATT_FEET") .." (%d/%d)",Clothesui.ownedTotalFeets_kabuki or 0, Clothesui.totalFeets_kabuki or 0), -1, 0) then
              setActive("Clothesui", "showFeets_kabuki")
      end
      if ImGui.Button(string.format(T("ATT_FACE") .." (%d/%d)",Clothesui.ownedTotalFaces_kabuki or 0, Clothesui.totalFaces_kabuki or 0), -1, 0) then
              setActive("Clothesui", "showFaces_kabuki")
      end
      if ImGui.Button(string.format(T("ATT_INNERTORSOS") .." (%d/%d)",Clothesui.ownedTotalInnerTorsos_kabuki or 0, Clothesui.totalInnerTorsos_kabuki or 0), -1, 0) then
              setActive("Clothesui", "showInnerTorsos_kabuki")
      end
      if ImGui.Button(string.format(T("ATT_OUTERTORSOS") .." (%d/%d)",Clothesui.ownedTotalOuterTorsos_kabuki or 0, Clothesui.totalOuterTorsos_kabuki or 0), -1, 0) then
              setActive("Clothesui", "showOuterTorsos_kabuki")
      end
      if ImGui.Button(string.format(T("ATT_LEGS") .." (%d/%d)",Clothesui.ownedTotalLegss_kabuki or 0, Clothesui.totalLegss_kabuki or 0), -1, 0) then
              setActive("Clothesui", "showLegss_kabuki")
      end
      ImGui.Unindent(20)
    end
    if ImGui.CollapsingHeader(string.format("little_china (%d/%d)",Clothesui.ownedTotallittle_china or 0, Clothesui.totalTotallittle_china or 0)) then
      ImGui.Indent(20)
      if ImGui.Button(string.format(T("ATT_HEAD") .."(%d/%d)",Clothesui.ownedTotalHeads_little_china or 0, Clothesui.totalHeads_little_china or 0), -1, 0) then
              setActive("Clothesui", "showHeads_little_china")
      end
      if ImGui.Button(string.format(T("ATT_FEET") .." (%d/%d)",Clothesui.ownedTotalFeets_little_china or 0, Clothesui.totalFeets_little_china or 0), -1, 0) then
              setActive("Clothesui", "showFeets_little_china")
      end
      if ImGui.Button(string.format(T("ATT_FACE") .." (%d/%d)",Clothesui.ownedTotalFaces_little_china or 0, Clothesui.totalFaces_little_china or 0), -1, 0) then
              setActive("Clothesui", "showFaces_little_china")
      end
      if ImGui.Button(string.format(T("ATT_INNERTORSOS") .." (%d/%d)",Clothesui.ownedTotalInnerTorsos_little_china or 0, Clothesui.totalInnerTorsos_little_china or 0), -1, 0) then
              setActive("Clothesui", "showInnerTorsos_little_china")
      end
      if ImGui.Button(string.format(T("ATT_OUTERTORSOS") .." (%d/%d)",Clothesui.ownedTotalOuterTorsos_little_china or 0, Clothesui.totalOuterTorsos_little_china or 0), -1, 0) then
              setActive("Clothesui", "showOuterTorsos_little_china")
      end
      if ImGui.Button(string.format(T("ATT_LEGS") .." (%d/%d)",Clothesui.ownedTotalLegss_little_china or 0, Clothesui.totalLegss_little_china or 0), -1, 0) then
              setActive("Clothesui", "showLegss_little_china")
      end
      ImGui.Unindent(20)
    end
    ImGui.Unindent(20)
  end
end
function Clothesui.uiclothessantodomingo()
  if ImGui.CollapsingHeader(string.format("santo domingo (%d/%d)",Clothesui.ownedTotalsantodomingo or 0, Clothesui.totalTotalsantodomingo or 0)) then
    ImGui.Indent(20)
    if ImGui.CollapsingHeader(string.format("arroyo (%d/%d)",Clothesui.ownedTotalarroyo or 0, Clothesui.totalTotalarroyo or 0)) then
    ImGui.Indent(20)
    if ImGui.Button(string.format(T("ATT_HEAD") .."(%d/%d)",Clothesui.ownedTotalHeads_arroyo or 0, Clothesui.totalHeads_arroyo or 0), -1, 0) then
              setActive("Clothesui", "showHeads_arroyo")
    end
    if ImGui.Button(string.format(T("ATT_FEET") .." (%d/%d)",Clothesui.ownedTotalFeets_arroyo or 0, Clothesui.totalFeets_arroyo or 0), -1, 0) then
              setActive("Clothesui", "showFeets_arroyo")
    end
    if ImGui.Button(string.format(T("ATT_FACE") .." (%d/%d)",Clothesui.ownedTotalFaces_arroyo or 0, Clothesui.totalFaces_arroyo or 0), -1, 0) then
              setActive("Clothesui", "showFaces_arroyo")
    end
    if ImGui.Button(string.format(T("ATT_INNERTORSOS") .." (%d/%d)",Clothesui.ownedTotalInnerTorsos_arroyo or 0, Clothesui.totalInnerTorsos_arroyo or 0), -1, 0) then
              setActive("Clothesui", "showInnerTorsos_arroyo")
    end
    if ImGui.Button(string.format(T("ATT_OUTERTORSOS") .." (%d/%d)",Clothesui.ownedTotalOuterTorsos_arroyo or 0, Clothesui.totalOuterTorsos_arroyo or 0), -1, 0) then
              setActive("Clothesui", "showOuterTorsos_arroyo")
    end
    if ImGui.Button(string.format(T("ATT_LEGS") .." (%d/%d)",Clothesui.ownedTotalLegss_arroyo or 0, Clothesui.totalLegss_arroyo or 0), -1, 0) then
              setActive("Clothesui", "showLegss_arroyo")
    end
    ImGui.Unindent(20)
    end
    if ImGui.CollapsingHeader(string.format("rancho_coronado (%d/%d)",Clothesui.ownedTotalrancho_coronado or 0, Clothesui.totalTotalrancho_coronado or 0)) then
    ImGui.Indent(20)
    if ImGui.Button(string.format(T("ATT_HEAD") .."(%d/%d)",Clothesui.ownedTotalHeads_rancho_coronado or 0, Clothesui.totalHeads_rancho_coronado or 0), -1, 0) then
              setActive("Clothesui", "showHeads_rancho_coronado")
    end
    if ImGui.Button(string.format(T("ATT_FEET") .." (%d/%d)",Clothesui.ownedTotalFeets_rancho_coronado or 0, Clothesui.totalFeets_rancho_coronado or 0), -1, 0) then
              setActive("Clothesui", "showFeets_rancho_coronado")
    end
    if ImGui.Button(string.format(T("ATT_INNERTORSOS") .." (%d/%d)",Clothesui.ownedTotalInnerTorsos_rancho_coronado or 0, Clothesui.totalInnerTorsos_rancho_coronado or 0), -1, 0) then
              setActive("Clothesui", "showInnerTorsos_rancho_coronado")
    end
    if ImGui.Button(string.format(T("ATT_OUTERTORSOS") .." (%d/%d)",Clothesui.ownedTotalOuterTorsos_rancho_coronado or 0, Clothesui.totalOuterTorsos_rancho_coronado or 0), -1, 0) then
              setActive("Clothesui", "showOuterTorsos_rancho_coronado")
    end
    if ImGui.Button(string.format(T("ATT_LEGS") .." (%d/%d)",Clothesui.ownedTotalLegss_rancho_coronado or 0, Clothesui.totalLegss_rancho_coronado or 0), -1, 0) then
              setActive("Clothesui", "showLegss_rancho_coronado")
    end
    ImGui.Unindent(20)
    end
    ImGui.Unindent(20)
  end
end
function Clothesui.uiclotheswestbrook()
  if ImGui.CollapsingHeader(string.format("westbrook (%d/%d)",Clothesui.ownedTotalwestbrook or 0, Clothesui.totalTotalwestbrook or 0)) then
    ImGui.Indent(20)
    if ImGui.CollapsingHeader(string.format("Japantown (%d/%d)",Clothesui.ownedTotalJapantown or 0, Clothesui.totalTotalJapantown or 0)) then
    ImGui.Indent(20)
    if ImGui.Button(string.format(T("ATT_HEAD") .."(%d/%d)",Clothesui.ownedTotalHeads_Japantown or 0, Clothesui.totalHeads_Japantown or 0), -1, 0) then
              setActive("Clothesui", "showHeads_Japantown")
    end
    if ImGui.Button(string.format(T("ATT_FEET") .." (%d/%d)",Clothesui.ownedTotalFeets_Japantown or 0, Clothesui.totalFeets_Japantown or 0), -1, 0) then
              setActive("Clothesui", "showFeets_Japantown")
    end
    if ImGui.Button(string.format(T("ATT_FACE") .." (%d/%d)",Clothesui.ownedTotalFaces_Japantown or 0, Clothesui.totalFaces_Japantown or 0), -1, 0) then
              setActive("Clothesui", "showFaces_Japantown")
    end
    if ImGui.Button(string.format(T("ATT_INNERTORSOS") .." (%d/%d)",Clothesui.ownedTotalInnerTorsos_Japantown or 0, Clothesui.totalInnerTorsos_Japantown or 0), -1, 0) then
              setActive("Clothesui", "showInnerTorsos_Japantown")
    end
    if ImGui.Button(string.format(T("ATT_OUTERTORSOS") .." (%d/%d)",Clothesui.ownedTotalOuterTorsos_Japantown or 0, Clothesui.totalOuterTorsos_Japantown or 0), -1, 0) then
              setActive("Clothesui", "showOuterTorsos_Japantown")
    end
    if ImGui.Button(string.format(T("ATT_LEGS") .." (%d/%d)",Clothesui.ownedTotalLegss_Japantown or 0, Clothesui.totalLegss_Japantown or 0), -1, 0) then
              setActive("Clothesui", "showLegss_Japantown")
    end
    ImGui.Unindent(20)
    end
    if ImGui.CollapsingHeader(string.format("Charter_Hill (%d/%d)",Clothesui.ownedTotalCharter_Hill or 0, Clothesui.totalTotalCharter_Hill or 0)) then
    ImGui.Indent(20)
    if ImGui.Button(string.format(T("ATT_HEAD") .."(%d/%d)",Clothesui.ownedTotalHeads_Charter_Hill or 0, Clothesui.totalHeads_Charter_Hill or 0), -1, 0) then
              setActive("Clothesui", "showHeads_Charter_Hill")
    end
    if ImGui.Button(string.format(T("ATT_FEET") .." (%d/%d)",Clothesui.ownedTotalFeets_Charter_Hill or 0, Clothesui.totalFeets_Charter_Hill or 0), -1, 0) then
              setActive("Clothesui", "showFeets_Charter_Hill")
    end
    if ImGui.Button(string.format(T("ATT_FACE") .." (%d/%d)",Clothesui.ownedTotalFaces_Charter_Hill or 0, Clothesui.totalFaces_Charter_Hill or 0), -1, 0) then
              setActive("Clothesui", "showFaces_Charter_Hill")
    end
    if ImGui.Button(string.format(T("ATT_INNERTORSOS") .." (%d/%d)",Clothesui.ownedTotalInnerTorsos_Charter_Hill or 0, Clothesui.totalInnerTorsos_Charter_Hill or 0), -1, 0) then
              setActive("Clothesui", "showInnerTorsos_Charter_Hill")
    end
    if ImGui.Button(string.format(T("ATT_OUTERTORSOS") .." (%d/%d)",Clothesui.ownedTotalOuterTorsos_Charter_Hill or 0, Clothesui.totalOuterTorsos_Charter_Hill or 0), -1, 0) then
              setActive("Clothesui", "showOuterTorsos_Charter_Hill")
    end
    if ImGui.Button(string.format(T("ATT_LEGS") .." (%d/%d)",Clothesui.ownedTotalLegss_Charter_Hill or 0, Clothesui.totalLegss_Charter_Hill or 0), -1, 0) then
              setActive("Clothesui", "showLegss_Charter_Hill")
    end
    ImGui.Unindent(20)
    end
    ImGui.Unindent(20)
  end
end
function Clothesui.uiclothescitycenter()
  if ImGui.CollapsingHeader(string.format("city center (%d/%d)",Clothesui.ownedTotalcitycenter or 0, Clothesui.totalTotalcitycenter or 0)) then
    ImGui.Indent(20)
    if ImGui.CollapsingHeader(string.format("downtown (%d/%d)",Clothesui.ownedTotalZane_Jagger or 0, Clothesui.totalTotalZane_Jagger or 0)) then
      ImGui.Indent(20)
      if ImGui.Button(string.format(T("ATT_HEAD") .."(%d/%d)",Clothesui.ownedTotalHeads_Zane_Jagger or 0, Clothesui.totalHeads_Zane_Jagger or 0), -1, 0) then
              setActive("Clothesui", "showHeads_Zane_Jagger")
      end
      if ImGui.Button(string.format(T("ATT_FEET") .." (%d/%d)",Clothesui.ownedTotalFeets_Zane_Jagger or 0, Clothesui.totalFeets_Zane_Jagger or 0), -1, 0) then
              setActive("Clothesui", "showFeets_Zane_Jagger")
      end
      if ImGui.Button(string.format(T("ATT_FACE") .." (%d/%d)",Clothesui.ownedTotalFaces_Zane_Jagger or 0, Clothesui.totalFaces_Zane_Jagger or 0), -1, 0) then
              setActive("Clothesui", "showFaces_Zane_Jagger")
      end
      if ImGui.Button(string.format(T("ATT_INNERTORSOS") .." (%d/%d)",Clothesui.ownedTotalInnerTorsos_Zane_Jagger or 0, Clothesui.totalInnerTorsos_Zane_Jagger or 0), -1, 0) then
              setActive("Clothesui", "showInnerTorsos_Zane_Jagger")
      end
      if ImGui.Button(string.format(T("ATT_OUTERTORSOS") .." (%d/%d)",Clothesui.ownedTotalHeads_northhside or 0, Clothesui.totalHeads_northhside or 0), -1, 0) then
              setActive("Clothesui", "showOuterTorsos_Zane_Jagger")
      end
      if ImGui.Button(string.format(T("ATT_LEGS") .." (%d/%d)",Clothesui.ownedTotalOuterTorsos_Zane_Jagger or 0, Clothesui.totalOuterTorsos_Zane_Jagger or 0), -1, 0) then
              setActive("Clothesui", "showLegss_Zane_Jagger")
      end
      ImGui.Unindent(20)
    end
    if ImGui.CollapsingHeader(string.format("corpo_plaza (%d/%d)",Clothesui.ownedTotalcorpo_plaza or 0, Clothesui.totalTotalcorpo_plaza or 0)) then
      ImGui.Indent(20)
      if ImGui.Button(string.format(T("ATT_HEAD") .."(%d/%d)",Clothesui.ownedTotalHeads_corpo_plaza or 0, Clothesui.totalHeads_corpo_plaza or 0), -1, 0) then
              setActive("Clothesui", "showHeads_corpo_plaza")
      end
      if ImGui.Button(string.format(T("ATT_FEET") .." (%d/%d)",Clothesui.ownedTotalFeets_corpo_plaza or 0, Clothesui.totalFeets_corpo_plaza or 0), -1, 0) then
              setActive("Clothesui", "showFeets_corpo_plaza")
      end
      if ImGui.Button(string.format(T("ATT_FACE") .." (%d/%d)",Clothesui.ownedTotalFaces_corpo_plaza or 0, Clothesui.totalFaces_corpo_plaza or 0), -1, 0) then
              setActive("Clothesui", "showFaces_corpo_plaza")
      end
      if ImGui.Button(string.format(T("ATT_INNERTORSOS") .." (%d/%d)",Clothesui.ownedTotalInnerTorsos_corpo_plaza or 0, Clothesui.totalInnerTorsos_corpo_plaza or 0), -1, 0) then
              setActive("Clothesui", "showInnerTorsos_corpo_plaza")
      end
      if ImGui.Button(string.format(T("ATT_OUTERTORSOS") .." (%d/%d)",Clothesui.ownedTotalOuterTorsos_corpo_plaza or 0, Clothesui.totalOuterTorsos_corpo_plaza or 0), -1, 0) then
              setActive("Clothesui", "showOuterTorsos_corpo_plaza")
      end
      if ImGui.Button(string.format(T("ATT_LEGS") .." (%d/%d)",Clothesui.ownedTotalLegss_corpo_plaza or 0, Clothesui.totalLegss_corpo_plaza or 0), -1, 0) then
              setActive("Clothesui", "showLegss_corpo_plaza")
      end
      ImGui.Unindent(20)
    end
    ImGui.Unindent(20)
  end
end
function Clothesui.uiclothesbadlands()
  if ImGui.CollapsingHeader(string.format("badlands (%d/%d)",Clothesui.ownedTotalbadlands or 0, Clothesui.totalTotalbadlands or 0)) then
    ImGui.Indent(20)
    if ImGui.CollapsingHeader(string.format("red_peaks (%d/%d)",Clothesui.ownedTotalred_peaks or 0, Clothesui.totalTotalred_peaks or 0)) then
      ImGui.Indent(20)
      if ImGui.Button(string.format(T("ATT_HEAD") .."(%d/%d)",Clothesui.ownedTotalHeads_red_peaks or 0, Clothesui.totalHeads_red_peaks or 0), -1, 0) then
              setActive("Clothesui", "showHeads_red_peaks")
      end
      if ImGui.Button(string.format(T("ATT_FEET") .." (%d/%d)",Clothesui.ownedTotalFeets_red_peaks or 0, Clothesui.totalFeets_red_peaks or 0), -1, 0) then
              setActive("Clothesui", "showFeets_red_peaks")
      end
      if ImGui.Button(string.format(T("ATT_FACE") .." (%d/%d)",Clothesui.ownedTotalFaces_red_peaks or 0, Clothesui.totalFaces_red_peaks or 0), -1, 0) then
              setActive("Clothesui", "showFaces_red_peaks")
      end
      if ImGui.Button(string.format(T("ATT_INNERTORSOS") .." (%d/%d)",Clothesui.ownedTotalInnerTorsos_red_peaks or 0, Clothesui.totalInnerTorsos_red_peaks or 0), -1, 0) then
              setActive("Clothesui", "showInnerTorsos_red_peaks")
      end
      if ImGui.Button(string.format(T("ATT_OUTERTORSOS") .." (%d/%d)",Clothesui.ownedTotalOuterTorsos_red_peaks or 0, Clothesui.totalOuterTorsos_red_peaks or 0), -1, 0) then
              setActive("Clothesui", "showOuterTorsos_red_peaks")
      end
      if ImGui.Button(string.format(T("ATT_LEGS") .." (%d/%d)",Clothesui.ownedTotalLegss_red_peaks or 0, Clothesui.totalLegss_red_peaks or 0), -1, 0) then
              setActive("Clothesui", "showLegss_red_peaks")
      end
      ImGui.Unindent(20)
    end
    ImGui.Unindent(20)
  end
end
function Clothesui.uiclothesheywood()
  if ImGui.CollapsingHeader(string.format("heywood (%d/%d)",Clothesui.ownedTotalheywood or 0, Clothesui.totalTotalheywood or 0)) then
    ImGui.Indent(20)
    if ImGui.CollapsingHeader(string.format("Wellsprings (%d/%d)",Clothesui.ownedTotalWellsprings or 0, Clothesui.totalTotalWellsprings or 0)) then
      ImGui.Indent(20)
      if ImGui.Button(string.format(T("ATT_HEAD") .."(%d/%d)",Clothesui.ownedTotalHeads_Wellsprings or 0, Clothesui.totalHeads_Wellsprings or 0), -1, 0) then
              setActive("Clothesui", "showHeads_Wellsprings")
      end
      if ImGui.Button(string.format(T("ATT_FEET") .." (%d/%d)",Clothesui.ownedTotalFeets_Wellsprings or 0, Clothesui.totalFeets_Wellsprings or 0), -1, 0) then
              setActive("Clothesui", "showFeets_Wellsprings")
      end
      if ImGui.Button(string.format(T("ATT_FACE") .." (%d/%d)",Clothesui.ownedTotalFaces_Wellsprings or 0, Clothesui.totalFaces_Wellsprings or 0), -1, 0) then
              setActive("Clothesui", "showFaces_Wellsprings")
      end
      if ImGui.Button(string.format(T("ATT_INNERTORSOS") .." (%d/%d)",Clothesui.ownedTotalInnerTorsos_Wellsprings or 0, Clothesui.totalInnerTorsos_Wellsprings or 0), -1, 0) then
              setActive("Clothesui", "showInnerTorsos_Wellsprings")
      end
      if ImGui.Button(string.format(T("ATT_OUTERTORSOS") .." (%d/%d)",Clothesui.ownedTotalOuterTorsos_Wellsprings or 0, Clothesui.totalOuterTorsos_Wellsprings or 0), -1, 0) then
              setActive("Clothesui", "showOuterTorsos_Wellsprings")
      end
      if ImGui.Button(string.format(T("ATT_LEGS") .." (%d/%d)",Clothesui.ownedTotalLegss_Wellsprings or 0, Clothesui.totalLegss_Wellsprings or 0), -1, 0) then
              setActive("Clothesui", "showLegss_Wellsprings")
      end
      ImGui.Unindent(20)
    end
    ImGui.Unindent(20)
  end
end
function Clothesui.uiclothespacifica()
  if ImGui.CollapsingHeader(string.format("pacifica (%d/%d)",Clothesui.ownedTotalpacifica or 0, Clothesui.totalTotalpacifica or 0)) then
    ImGui.Indent(20)
    if ImGui.CollapsingHeader(string.format("west_wind_estate (%d/%d)",Clothesui.ownedTotalwest_wind_estate or 0, Clothesui.totalTotalwest_wind_estate or 0)) then
  ImGui.Indent(20)
  if ImGui.Button(string.format(T("ATT_HEAD") .."(%d/%d)",Clothesui.ownedTotalHeads_west_wind_estate or 0, Clothesui.totalHeads_west_wind_estate or 0), -1, 0) then
              setActive("Clothesui", "showHeads_west_wind_estate")
  end
  if ImGui.Button(string.format(T("ATT_FEET") .." (%d/%d)",Clothesui.ownedTotalFeets_west_wind_estate or 0, Clothesui.totalFeets_west_wind_estate or 0), -1, 0) then
              setActive("Clothesui", "showFeets_west_wind_estate")
  end
  if ImGui.Button(string.format(T("ATT_FACE") .." (%d/%d)",Clothesui.ownedTotalFaces_west_wind_estate or 0, Clothesui.totalFaces_west_wind_estate or 0), -1, 0) then
              setActive("Clothesui", "showFaces_west_wind_estate")
  end
  if ImGui.Button(string.format(T("ATT_INNERTORSOS") .." (%d/%d)",Clothesui.ownedTotalInnerTorsos_west_wind_estate or 0, Clothesui.totalInnerTorsos_west_wind_estate or 0), -1, 0) then
              setActive("Clothesui", "showInnerTorsos_west_wind_estate")
  end
  if ImGui.Button(string.format(T("ATT_OUTERTORSOS") .." (%d/%d)",Clothesui.ownedTotalOuterTorsos_west_wind_estate or 0, Clothesui.totalOuterTorsos_west_wind_estate or 0), -1, 0) then
              setActive("Clothesui", "showOuterTorsos_west_wind_estate")
  end
  if ImGui.Button(string.format(T("ATT_LEGS") .." (%d/%d)",Clothesui.ownedTotalLegss_west_wind_estate or 0, Clothesui.totalLegss_west_wind_estate or 0), -1, 0) then
              setActive("Clothesui", "showLegss_west_wind_estate")
  end
  ImGui.Unindent(20)
    end
    if ImGui.CollapsingHeader(string.format("dogtown (%d/%d)",Clothesui.ownedTotalsatoshi_ueno or 0, Clothesui.totalTotalsatoshi_ueno or 0)) then
  ImGui.Indent(20)
  if ImGui.Button(string.format(T("ATT_HEAD") .."(%d/%d)",Clothesui.ownedTotalHeads_satoshi_ueno or 0, Clothesui.totalHeads_satoshi_ueno or 0), -1, 0) then
              setActive("Clothesui", "showHeads_satoshi_ueno")
  end
  if ImGui.Button(string.format(T("ATT_FEET") .." (%d/%d)",Clothesui.ownedTotalFaces_satoshi_ueno or 0, Clothesui.totalFaces_satoshi_ueno or 0), -1, 0) then
              setActive("Clothesui", "showFeets_satoshi_ueno")
  end
  if ImGui.Button(string.format(T("ATT_FACE") .." (%d/%d)",Clothesui.ownedTotalFeets_satoshi_ueno or 0, Clothesui.totalFeets_satoshi_ueno or 0), -1, 0) then
              setActive("Clothesui", "showFaces_satoshi_ueno")
  end
  if ImGui.Button(string.format(T("ATT_INNERTORSOS") .." (%d/%d)",Clothesui.ownedTotalInnerTorsos_satoshi_ueno or 0, Clothesui.totalInnerTorsos_satoshi_ueno or 0), -1, 0) then
              setActive("Clothesui", "showInnerTorsos_satoshi_ueno")
  end
  if ImGui.Button(string.format(T("ATT_OUTERTORSOS") .." (%d/%d)",Clothesui.ownedTotalLegss_satoshi_ueno or 0, Clothesui.totalOuterTorsos_satoshi_ueno or 0), -1, 0) then
              setActive("Clothesui", "showOuterTorsos_satoshi_ueno")
  end
  if ImGui.Button(string.format(T("ATT_LEGS") .." (%d/%d)",Clothesui.ownedTotalOuterTorsos_satoshi_ueno or 0, Clothesui.totalLegss_satoshi_ueno or 0), -1, 0) then
              setActive("Clothesui", "showLegss_satoshi_ueno")
  end
  ImGui.Unindent(20)
    end
    if ImGui.CollapsingHeader(string.format("stade (%d/%d)",Clothesui.ownedTotaldavid_walker or 0, Clothesui.totalTotaldavid_walker or 0)) then
  ImGui.Indent(20)
  if ImGui.Button(string.format(T("ATT_HEAD") .."(%d/%d)",Clothesui.ownedTotalHeads_david_walker or 0, Clothesui.totalHeads_david_walker or 0), -1, 0) then
              setActive("Clothesui", "showHeads_david_walker")
  end
  if ImGui.Button(string.format(T("ATT_FEET") .." (%d/%d)",Clothesui.ownedTotalFeets_david_walker or 0, Clothesui.totalFeets_david_walker or 0), -1, 0) then
              setActive("Clothesui", "showFeets_david_walker")
  end
  if ImGui.Button(string.format(T("ATT_FACE") .." (%d/%d)",Clothesui.ownedTotalFaces_david_walker or 0, Clothesui.totalFaces_david_walker or 0), -1, 0) then
              setActive("Clothesui", "showFaces_david_walker")
  end
  if ImGui.Button(string.format(T("ATT_INNERTORSOS") .." (%d/%d)",Clothesui.ownedTotalInnerTorsos_david_walker or 0, Clothesui.totalInnerTorsos_david_walker or 0), -1, 0) then
              setActive("Clothesui", "showInnerTorsos_david_walker")
  end
  if ImGui.Button(string.format(T("ATT_OUTERTORSOS") .." (%d/%d)",Clothesui.ownedTotalOuterTorsos_david_walker or 0, Clothesui.totalOuterTorsos_david_walker or 0), -1, 0) then
              setActive("Clothesui", "showOuterTorsos_david_walker")
  end
  if ImGui.Button(string.format(T("ATT_LEGS") .." (%d/%d)",Clothesui.ownedTotalLegss_david_walker or 0, Clothesui.totalLegss_david_walker or 0), -1, 0) then
              setActive("Clothesui", "showLegss_david_walker")
  end
  ImGui.Unindent(20)
    end
    ImGui.Unindent(20)
end
end
function Clothesui.uiclothesnomad()
  if ImGui.Button(string.format("nomad (%d/%d)",Clothesui.ownedTotalNomad or 0, Clothesui.totalNomad or 0), -1, 0) then
    setActive("Clothesui", "showV_nomad_set")
  end
end
function Clothesui.uiclothesstreetkid()
  if ImGui.Button(string.format("streetkid (%d/%d)",Clothesui.ownedTotalStreetkid or 0, Clothesui.totalStreetkid or 0), -1, 0) then
    setActive("Clothesui", "showV_streetkid_set")
  end
end
function Clothesui.uiclothecorpo()
  if ImGui.Button(string.format("Corpo (%d/%d)",Clothesui.ownedTotalCorpo or 0, Clothesui.totalCorpo or 0), -1, 0) then
    setActive("Clothesui", "showV_corpo_set")
  end
end
function Clothesui.uiclothessetcosmetic()
  if ImGui.CollapsingHeader(string.format(T("ATT_COSMETICS") .."(%d/%d)",Clothesui.ownedTotalsetcosmetic or 0, Clothesui.totalTotalsetcosmetic or 0)) then
    ImGui.Indent(20)
   if ImGui.CollapsingHeader(string.format("set (%d/%d)",Clothesui.ownedTotalSets or 0, Clothesui.totalTotalSets or 0)) then
    ImGui.Indent(20)
    if ImGui.Button(string.format("Johnny Silvehand (%d/%d)",Clothesui.ownedTotalJohnny_Silverhand or 0, Clothesui.totalJohnny_Silverhand or 0), -1, 0) then
              setActive("Clothesui", "showJohnny_Silverhand_set")
    end
    if ATT.currentProfile == "nomad" then
      Clothesui.uiclothesnomad()
    end
    if ATT.currentProfile == "att1" then
      Clothesui.uiclothesstreetkid()
    end
    if ATT.currentProfile == "att2" then
      Clothesui.uiclothecorpo()
    end
    if ImGui.Button(string.format("the rescue (%d/%d)",Clothesui.ownedTotalThe_Rescue or 0, Clothesui.totalThe_Rescue or 0), -1, 0) then
              setActive("Clothesui", "showV_The_Rescue_set")
    end
    if ImGui.Button(string.format("yorinubo (%d/%d)",Clothesui.ownedTotalYorinubo or 0, Clothesui.totalYorinubo or 0), -1, 0) then
              setActive("Clothesui", "showYorinubo_set")
    end
    if ImGui.Button(string.format("max tac (%d/%d)",Clothesui.ownedTotalMaxTac or 0, Clothesui.totalMaxTac or 0), -1, 0) then
              setActive("Clothesui", "showMaxTac_set")
    end
    if ImGui.Button(string.format("nus agent (%d/%d)",Clothesui.ownedTotalNUS_Agent or 0, Clothesui.totalNUS_Agent or 0), -1, 0) then
              setActive("Clothesui", "showNUS_Agent_set")
    end
    ImGui.Unindent(20)
   end
   if ImGui.CollapsingHeader(string.format("epilogue (%d/%d)",Clothesui.ownedTotalepilogue or 0, Clothesui.totalTotalepilogue or 0)) then              
    ImGui.Indent(20)
    if ImGui.Button(string.format("the star (%d/%d)",Clothesui.ownedTotalThe_Star or 0, Clothesui.totalThe_Star or 0), -1, 0) then
              setActive("Clothesui", "showThe_Star_set")
    end
    if ImGui.Button(string.format("the sun (%d/%d)",Clothesui.ownedTotalThe_sun or 0, Clothesui.totalThe_sun or 0), -1, 0) then
              setActive("Clothesui", "showThe_sun_set")
    end
    if ImGui.Button(string.format("temperance (%d/%d)",Clothesui.ownedTotalTemperance or 0, Clothesui.totalTemperance or 0), -1, 0) then
              setActive("Clothesui", "showTemperance_set")
    end
    ImGui.Unindent(20)
   end
   if ImGui.CollapsingHeader(string.format("Role set (%d/%d)",Clothesui.ownedTotalroleset or 0, Clothesui.totalTotalroleset or 0)) then
    ImGui.Indent(20)
    if ImGui.Button(string.format(T("ATT_COP") .." (%d/%d)",Clothesui.ownedTotalcop or 0, Clothesui.totalcop or 0), -1, 0) then
              setActive("Clothesui", "showCop_set")
    end
    if ImGui.Button(string.format("corpo (%d/%d)",Clothesui.ownedtotalCorporate or 0, Clothesui.totalCorporate or 0), -1, 0) then
              setActive("Clothesui", "showCorporate_set")
    end
    if ImGui.Button(string.format("fixer (%d/%d)",Clothesui.ownedTotalFixer or 0, Clothesui.totalFixer or 0), -1, 0) then
              setActive("Clothesui", "showFixer_set")
    end
    if ImGui.Button(string.format("media (%d/%d)",Clothesui.ownedTotalMedia or 0, Clothesui.totalMedia or 0), -1, 0) then
              setActive("Clothesui", "showMedia_set")
    end
    if ImGui.Button(string.format("netrunner (%d/%d)",Clothesui.ownedTotalNetrunner or 0, Clothesui.totalNetrunner or 0), -1, 0) then
              setActive("Clothesui", "showNetrunner_set")
    end
    if ImGui.Button(string.format("nomad (%d/%d)",Clothesui.ownedTotalNomadset or 0, Clothesui.totalNomadset or 0), -1, 0) then
              setActive("Clothesui", "showNomad_set")
    end
    if ImGui.Button(string.format("rocker (%d/%d)",Clothesui.ownedTotalRocker or 0, Clothesui.totalRocker or 0), -1, 0) then
              setActive("Clothesui", "showRocker_set")
    end
    if ImGui.Button(string.format("solo (%d/%d)",Clothesui.ownedTotalSolo or 0, Clothesui.totalSolo or 0), -1, 0) then
              setActive("Clothesui", "showSolo_set")
    end
    if ImGui.Button(string.format(T("ATT_TECHIE") .." (%d/%d)",Clothesui.ownedTotalTechie or 0, Clothesui.totalTechie or 0), -1, 0) then
              setActive("Clothesui", "showTechie_set")
    end
   end
    ImGui.Unindent(20)
end
end


Clothesui.groupedclothes = groupedclothes


return Clothesui