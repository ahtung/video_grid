require 'rmagick'
require 'fileutils'

Dir.foreach('classify') do |item|
  next if item == '.' or item == '..' or item == '.DS_Store'

  img =  Magick::Image.read('classify/' + item).first
  gscale = img.quantize(256, Magick::GRAYColorspace)
  pix = gscale.scale(1, 1)
  avg = pix.pixel_color(0,0)
  avg_color = avg
  val = (avg_color.red / 257 + avg_color.green / 257 + avg_color.blue / 257) / 3
  random_name = (0...5).map { ('a'..'z').to_a[rand(26)] }.join

  puts "#{item} => #{val.to_s.rjust(3, '0')}/#{random_name}.jpg"

  scale_image = gscale.scale(16, 16)

  scale_image.write('samples/' + val.to_s.rjust(3, '0') + '/' + random_name + '.jpg')
end
