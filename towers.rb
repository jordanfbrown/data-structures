input = File.open('boxes.txt').read().split(/\n/)
num_boxes = input.shift.to_i

boxes = input.each_with_index.map do |box, i|
  break if i + 1 > num_boxes
  box.split(/\s/).map(&:to_i).sort
end.sort

height = 0
previousDimensions = nil
boxes.each do |box|
  max = box.max

  if previousDimensions
  else
    dimensions = box.reject { |dim| dim == max }
    puts dimensions
  end
end


