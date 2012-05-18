DIM = 32
# RADIUS = (DIM / 2.0) - 0.5
RADIUS = 15

a = [ ]
center = RADIUS + 1.0/2

for y in (0..DIM) do
  a[y] = ['.'] * DIM
  for x in (0..DIM) do
    xd = center - x
    yd = center - y
    distance = Math.sqrt(xd*xd + yd*yd)
    if distance < RADIUS then
      a[y][x] = '*'
    end
  end
  print '.'; $stdout.flush
end

a.each_with_index do |row, rowi|
  row.each_with_index do |char, chari|
    print char
  end
  puts
end

