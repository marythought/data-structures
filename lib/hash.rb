class HashTable

  def initialize(slots=1024)
    @slots = slots
  end

  def set(key, val)
    key = hash(key)
    val = val
  end

  def get(key)

  end

  def delete(key)
  end

  def hash(key)
  end
end
