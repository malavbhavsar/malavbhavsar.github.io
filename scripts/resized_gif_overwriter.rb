#!/usr/bin/ruby

require 'rmagick'

assets_path = "./assets"
resized_path = "./assets/resized"

def resize_file(filepath, newwidth, newheight, newfilepath)
  File.open(filepath, 'rb') do |file|
    imgs = Magick::ImageList.new
    imgs.from_blob file.read

    imgs = imgs.coalesce

    imgs.each do |x|
      x.resize_to_fill!(newwidth, newheight)
    end

    imgs = imgs.optimize_layers( Magick::OptimizeLayer )

    File.delete(newfilepath)
    File.open(newfilepath, 'wb') do |f|
      f.write imgs.to_blob
    end
  end
end

original_gifs = Dir.glob("#{assets_path}/*.gif")
original_gifs.each do |orig|
  orig_basename = File.basename(orig, ".gif")
  res_gifs = Dir.glob("#{resized_path}/#{orig_basename}*gif")
  res_gifs.each do |res|
    res_basename = File.basename(res, ".gif")
    matchdata = /.*\-(\d*)x(\d*)/.match res_basename
    width = matchdata[1].to_f
    height = matchdata[2].to_f

    resize_file(orig, width, height, res)
  end
end
