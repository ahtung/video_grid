require 'chunky_png'
require 'fileutils'

width, height = 16, 16
range = 255

for i in (0..255) do
  folder = "samples/#{i.to_s.rjust(3, '0')}"
  FileUtils::mkdir_p(folder)
  png = ChunkyPNG::Image.new(width, height, ChunkyPNG::Color::TRANSPARENT)
  for w in (0..(width-1)) do
    for h in (0..(height-1)) do
      png[w, h] = ChunkyPNG::Color.rgba(i, i, i, 255)
    end
  end
  png.save("#{folder}/file.png", interlace: true)
end

