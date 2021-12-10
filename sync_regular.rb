require "./wrapper"
require "benchmark"

puts Benchmark.measure{
  100.times do |i|   
    Wrapper.deliver do 
        artist      "Artist  (#{i})"
        album       "Album (#{i})"
        song        "Song (#{i})"
        duration    "Duration (#{i})"
    end
  end
  Process.waitall
}