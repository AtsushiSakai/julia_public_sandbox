struct UnionFind
    parent::Vector{Int} # Parent index of each index, when -1, it is root
    size::Vector{Int} # group size of each index
    UnionFind(N) = new(fill(-1, N), fill(1, N))
end

function root!(uf::UnionFind, x::Int)
    if uf.parent[x] == -1
        return x
    else
        # Path compuression   
        # Set the parent of the values traced from x as the root of x.
        return uf.parent[x] = root!(uf, uf.parent[x])
    end
end

function unite!(uf::UnionFind, x::Int, y::Int)
    x_root = root!(uf, x)
    y_root = root!(uf, y)
    x_root == y_root && return false
    if uf.size[x_root] < uf.size[y_root] # union by size
        uf.parent[x_root] = y_root
        uf.size[y_root] += uf.size[x_root]
        uf.size[x_root] = uf.size[y_root] 
    else
        uf.parent[y_root] = x_root
        uf.size[x_root] += uf.size[y_root]
        uf.size[y_root] = uf.size[x_root] 
    end
    return true
end

function members(uf::UnionFind, x::Int)
    x_root = root!(uf, x)
    return [x for x in 1:length(uf.parent) if root!(uf, x) == x_root]
end

function all_group_members(uf::UnionFind)
    group_members = Dict{Int, Vector{Int}}()
    for x in 1:length(uf.parent)
        x_root = root!(uf, x)
        haskey(group_members, x_root) || (group_members[x_root] = Int[])
        push!(group_members[x_root], x)
    end
    return group_members
end

roots(uf::UnionFind)=[x for x in 1:length(uf.parent) if uf.parent[x] == -1]
issame(uf::UnionFind, x::Int, y::Int)=root!(uf, x) == root!(uf, y)
size(uf::UnionFind, x::Int)=uf.size[x]
group_size(uf::UnionFind)=length(roots(uf))


