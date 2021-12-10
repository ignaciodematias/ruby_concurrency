class Wrapper

    def self.deliver(&block)
      wrap = WrapBuilder.new(&block).wrap
      wrap.show_top100
    end
  
    Wrap = Struct.new(:artist, :album, :song, :duration) do 
      def show_top100
        sleep(0.3)      
        puts "Artist: #{artist}"
        puts "Album: #{album}"
        puts "Song: #{song}"
        puts "Duration: #{duration}"
      end
  
      
    end
  
    class WrapBuilder
      def initialize(&block)
        @wrap = Wrap.new
        instance_eval(&block)
      end
      
      attr_reader :wrap
  
      %w(artist album song duration).each do |i|
        define_method(i) do |output|
          @wrap.send("#{i}=", output)
        end
      end
    end
  end