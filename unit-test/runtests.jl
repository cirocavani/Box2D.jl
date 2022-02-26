using Test

excluded = ["runtests.jl"]

@testset "Box2D unit-tests" begin
  for f in filter(fname -> endswith(fname, ".jl") && fname ∉ excluded, readdir(@__DIR__))
    println("Running tests from $f...")
    include(f)
  end
end
