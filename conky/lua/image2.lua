require 'cairo'

function conky_image(path, x, y, w, h)
    if conky_window == nil then return end

    local cs = cairo_xlib_surface_create(
        conky_window.display,
        conky_window.drawable,
        conky_window.visual,
        conky_window.width,
        conky_window.height
    )

    local cr = cairo_create(cs)
    local image = cairo_image_surface_create_from_png(path)
    local iw = cairo_image_surface_get_width(image)
    local ih = cairo_image_surface_get_height(image)

    if w == 0 then w = iw end
    if h == 0 then h = ih end

    cairo_scale(cr, w / iw, h / ih)
    cairo_set_source_surface(cr, image, x / (w / iw), y / (h / ih))
    cairo_paint(cr)
    cairo_destroy(cr)
    cairo_surface_destroy(image)
    cairo_surface_destroy(cs)
end
