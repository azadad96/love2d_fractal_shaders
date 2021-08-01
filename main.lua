function love.load()
    shader = love.graphics.newShader("shaders/mandelbrot.glsl")
    love.window.setMode(1920, 1080, {vsync = -1})
    love.window.setFullscreen(true)
end

function love.draw()
    w, h = love.graphics.getDimensions()
    love.graphics.setShader(shader)
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", 0, 0, w, h)
    love.graphics.setShader()
end
