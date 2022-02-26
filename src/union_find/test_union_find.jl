module mymodule
include("union_find.jl")

using Test

function test1()
    uf = UnionFind(5)
    @show uf
    # uf = UnionFind([-1, -1, -1, -1, -1], [1, 1, 1, 1, 1])
    @show unite!(uf, 2, 3)
    # unite!(uf, 2, 3) = true
    @show unite!(uf, 2, 3)
    # unite!(uf, 2, 3) = false
    @show uf
    # uf = UnionFind([-1, -1, 2, -1, -1], [1, 2, 2, 1, 1])
    @show root!(uf, 2)
    # root!(uf, 2) = 2
    @show issame(uf, 1, 2)
    # issame(uf, 1, 2) = false
    @show issame(uf, 2, 3)
    # issame(uf, 2, 3) = true
    @show size(uf, 2)
    # size(uf, 2) = 2
    @show size(uf, 3)
    # size(uf, 3) = 2
    @show members(uf, 1)
    # members(uf, 1) = [1]
    @show members(uf, 2)
    # members(uf, 2) = [2, 3]
    @show members(uf, 3)
    # members(uf, 3) = [2, 3]
    @show members(uf, 4)
    # members(uf, 4) = [4]
    @show roots(uf)
    # roots(uf) = [1, 2, 4, 5]
    @show group_size(uf)
    # group_size(uf) = 4
    @show all_group_members(uf)
    # all_group_members(uf) = Dict(5 => [5], 4 => [4], 2 => [2, 3], 1 => [1])
    
end

test1()

end
