local customColor = {
    [ "$pp_colour_addr" ] = 0.02,
    [ "$pp_colour_addg" ] = 0.02,
    [ "$pp_colour_addb" ] = 0,
    [ "$pp_colour_brightness" ] = 0,
    [ "$pp_colour_contrast" ] = 1,
    [ "$pp_colour_colour" ] = 3,
    [ "$pp_colour_mulr" ] = 0,
    [ "$pp_colour_mulg" ] = 0.02,
    [ "$pp_colour_mulb" ] = 0
}

local BasicColor = {
    [ "$pp_colour_addr" ] = 0,
    [ "$pp_colour_addg" ] = 0,
    [ "$pp_colour_addb" ] = 0,
    [ "$pp_colour_brightness" ] = 0,
    [ "$pp_colour_contrast" ] = 1,
    [ "$pp_colour_colour" ] = 1,
    [ "$pp_colour_mulr" ] = 1,
    [ "$pp_colour_mulg" ] = 0,
    [ "$pp_colour_mulb" ] = 0
}

local colorEnabled = false

local function EnableCustomColor()
    hook.Add("RenderScreenspaceEffects", "ColorModifier", function()
        DrawColorModify(customColor)
    end)
end

local function DisableCustomColor()
    hook.Remove("RenderScreenspaceEffects", "ColorModifier")
end


local function EnableCustomColor()
    hook.Add("RenderScreenspaceEffects", "ColorModifier", function()
        DrawColorModify(customColor)
    end)
end

local function DisableCustomColor()
    hook.Remove("RenderScreenspaceEffects", "ColorModifier")
end

local function OnContextMenuOptionSelected(option)
    if option == "Cartoon" then
        EnableCustomColor()
    else
        DisableCustomColor()
    end
end


hook.Add("OnPlayerChat", "ToggleColorCommand", function(ply, text)
    print("Chat command triggered:", text)
    if ply == LocalPlayer() and string.lower(text) == "!cartoon" then

        if not colorEnabled then
            EnableCustomColor()
            colorEnabled = true
         
        else
            DisableCustomColor()
            colorEnabled = false

        end
        return true
    end
end)
