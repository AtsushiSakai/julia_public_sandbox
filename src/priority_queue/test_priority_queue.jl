module mymodule

using Test

include("priority_queue.jl")

function test1()
    pq = PriorityQueue{Int64, String}()
    push!(pq, Pair(10, "10"))
    push!(pq, Pair(5, "5"))
    push!(pq, Pair(7, "7"))
    @test highest(pq).first == 10
    @test highest(pq).second == "10"
    @test lowest(pq).first == 5
    @test lowest(pq).second == "5"
    @test pop_highest!(pq).first == 10
    @test pop_highest!(pq).first == 7
    push!(pq, Pair(15, "15"))
    @test pop_highest!(pq).first == 15

    push!(pq, Pair(-1, "-1"))
    push!(pq, Pair(9, "9"))
    @test pop_lowest!(pq).first == -1
end

function test2()
    pq = PriorityQueue{Int64, String}()
    @test highest(pq) == nothing
    @test lowest(pq) == nothing
end

test1()
test2()

end # module
