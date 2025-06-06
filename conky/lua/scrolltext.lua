scroll_offset = 0

function conky_scroll_text(text, width)
    if not text then return "" end

    -- Get text length
    local len = string.len(text)
    if len <= width then
        return text
    end

    -- Scroll loop
    scroll_offset = scroll_offset + 1
    if scroll_offset > len then
        scroll_offset = 0
    end

    -- Wrap around
    local s = scroll_offset
    local e = scroll_offset + width
    local scrolled = text:sub(s, e)
    
    -- Pad if at end
    if string.len(scrolled) < width then
        scrolled = scrolled .. " " .. text:sub(1, width - string.len(scrolled))
    end

    return scrolled
end
