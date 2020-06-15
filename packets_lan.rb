puts "==================================================="
puts "testing network received packets in bytes in 1s:..."
base = '/sys/class/net'
filenames = `ls #{base}`.split
original_col = []
filenames.each do |network|
    total_bytes = `cat #{base}/#{network}/statistics/rx_bytes`.to_i
    original_col << total_bytes
end

sleep 10

cur_col = []
filenames.each do |network|
    total_bytes = `cat #{base}/#{network}/statistics/rx_bytes`.to_i
    cur_col << total_bytes
end
puts "original: #{original_col}"

final = cur_col.zip(original_col, filenames).map do |k|
    [(k[0] - k[1])/10, k[2]]
end

final.each do |packets, wln|
    puts "#{wln}: #{packets}"
end
