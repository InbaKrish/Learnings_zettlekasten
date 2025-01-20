def product_except_self(nums)
    prefix_prd = []
    suffix_prd = []

    i = 0
    j = -1
    n = nums.size

    while i < n && j > -n do
        if prefix_prd.last
            prefix_prd << prefix_prd.last * nums[i]
        else
            prefix_prd << nums[i]
        end

        if suffix_prd.last
            suffix_prd << suffix_prd.last * nums[j]
        else
            suffix_prd << nums[j]
        end

        i += 1
        j -= 1
    end

    result = [suffix_prd[-1]]
    i = 0

    while i < n - 2 do
        result << prefix_prd[i] * suffix_prd[-(i+2)]
        i += 1
    end

    result << prefix_prd[-1]

    result
end

def pes_opt_sol(nums)
    n = nums.size
    result = Array.new(n, 0)

    prefix_prd = 1
    for i in 0...n
        result[i] = prefix_prd
        prefix_prd *= nums[i]
    end

    suffix_prd = 1
    for i in (n-1).downto(0)
        result[i] *= suffix_prd
        suffix_prd *= nums[i]
    end

    result
end


def pes1bf(nums)
    result = []
    (0..nums.size - 1).each do |i|
        prefix = i.zero? ? [] : nums.slice(..i-1)
        suffix = nums.slice(i+1..)
        cur_r = 1
        prefix.each { |k| cur_r *= k }
        suffix.each { |k| cur_r *= k }
        result << cur_r
    end
    result
end

nums = [1,2,3,4]