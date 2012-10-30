# DIM = 32
# RADIUS = (DIM / 2.0) - 0.5
RADIUS = (ARGV[0] || 6.5).to_f
DIM = (RADIUS + 1) * 2

a = [ ]
center = RADIUS + 1.0/2

for z in (0..DIM) do
  a[z] = [ ]
  for y in (0..DIM) do
    a[z][y] = ['.'] * DIM
    for x in (0..DIM) do
      xd = center - x
      yd = center - y
      zd = center - z
      distance = Math.sqrt(xd*xd + yd*yd + zd*zd)
      if distance < RADIUS then
        a[z][y][x] = '*'
      end
    end
    print '.'; $stdout.flush
  end
  puts " (#{z})"
end

prev_plate = nil
a.each do |plate|
  plate.each_with_index do |row, rowi|
    row.each_with_index do |char, chari|
      if prev_plate and prev_plate[rowi][chari] == '*' then
        if char == '*'
          print 'x'
        else
          print '-'
        end
      else
        print char
      end
    end
    puts
  end
  puts
  prev_plate = plate
end

