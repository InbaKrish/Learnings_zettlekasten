def product_except_self(nums)
    
end

def pes1bf(nums)
    (0..nums.size).each do |i|
        prefix = i.zero? ? [] : nums.slice(..i-1)
        suffix = nums.slice(i+1..)
        p prefix
        p suffix
    end
end

nums = [1,2,3,4]