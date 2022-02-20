
struct PriorityQueue{K, V}
    values::Array{Pair{K,V}}
    PriorityQueue{K,V}() where {K,V} = new(Array{Pair{K,V}}(undef, 0))
end

function push!(pq::PriorityQueue{K,V}, pair::Pair{K,V}) where {K,V}
    Base.push!(pq.values, pair)
    index = length(pq.values)
    while index > 1
        parent_index = div(index - 1, 2) + 1
        (pq.values[parent_index].first >= pair.first) && break
        pq.values[index] = pq.values[parent_index]
        index = parent_index
    end
    pq.values[index] = pair
    return nothing
end

function pop_highest!(pq::PriorityQueue)
    isempty(pq.values) && return nothing
    max_value = highest(pq) 
    value = pop!(pq.values)
    index = 1
    while (index * 2) <= length(pq.values)
        cind1, cind2 = index * 2, index * 2 + 1
        flag = (cind2 >= length(pq.values) || pq.values[cind1] > pq.values[cind2]) 
        bigger_index = flag ? cind1 : cind2
        pq.values[bigger_index] <= value && break
        pq.values[index] = pq.values[bigger_index]
        index = bigger_index
    end
    pq.values[index] = value
    return max_value
end

pop_lowest!(pq::PriorityQueue) = !isempty(pq.values) ? pop!(pq.values) : nothing
highest(pq::PriorityQueue) = !isempty(pq.values) ? pq.values[1] : nothing
lowest(pq::PriorityQueue) = !isempty(pq.values) ? pq.values[end] : nothing


