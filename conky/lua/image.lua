require 'imlib2'

function conky_image(path, x, y, w, h)
    local img = imlib_load_image(path)
    if img then
        imlib_context_set_drawable(conky_window.drawable)

        -- Draw a hot pink background rectangle first
        imlib_context_set_color(255, 105, 180, 255) -- Hot pink RGBA
        imlib_image_fill_rectangle(x, y, w, h)

        -- Draw the image over it
        imlib_context_set_image(img)
        imlib_render_image_on_drawable(x, y)

        imlib_free_image()
    end
end

