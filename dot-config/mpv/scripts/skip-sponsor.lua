local mp = require 'mp'


local function skip_sponsor()
    local chapter = mp.get_property_number("chapter")
    if chapter == nil then
        return
    end
    local title = mp.get_property("chapter-list/" .. chapter .. "/title")
    if string.find(title, " Sponsor", 1, true) then
        local total = mp.get_property_number("chapters")
        if chapter and total and chapter < total - 1 then
            mp.set_property_number("chapter", chapter + 1)
            mp.osd_message("Skipped sponsor")
        end
    end
end


mp.observe_property("chapter", "number", function(_, _)
    skip_sponsor()
end)
