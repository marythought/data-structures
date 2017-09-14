class Tracer
  def initialize
    @server_allocations = {}
  end

  def self.lowest_available(array)
    lowest = 1
    array = array.sort
    array.each do |i|
      return lowest if lowest < i
      lowest += 1
    end
    lowest
  end

  def allocate(name)
    if @server_allocations.has_key?(name)
      @server_allocations[name] << self.class.lowest_available(@server_allocations[name])
    else
      @server_allocations[name] = [self.class.lowest_available([])]
    end
    name + @server_allocations[name][-1].to_s
  end

  def deallocate(name)
    if @server_allocations.has_key?(name)
      if @server_allocations[name].length == 0
        begin
          fail "group empty"
        rescue RuntimeError => e
          return e.message
        end
      end
      @server_allocations[name].shift
      return nil
    else
      begin
        fail "group does not exist"
      rescue RuntimeError => e
        return e.message
      end
    end
  end
end
