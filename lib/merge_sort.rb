def merge_sort(ary)
  return ary if ary.size <= 1
  mid = ary.size / 2
  left = merge_sort(ary[0, mid])
  right = merge_sort(ary[mid, ary.size-1])
  combine(left, right)
end

def combine(left, right)
  if right.first > left.last
    return left.concat(right)
  elsif right.last < left.first
    return right.concat(left)
  else
    merged = []
    loop do
      return merged.concat(right) if left.empty?
      return merged.concat(left) if right.empty?
      left.first <= right.first ? merged << left.shift : merged << right.shift
    end
  end
end




