# Box2D Julia Bindings

## About Box2D

https://github.com/erincatto/box2d

https://box2d.org/

https://box2d.org/documentation/

Box2D is a 2D rigid body simulation library for games. Programmers can use it in their games to make objects move in realistic ways and make the game world more interactive. From the game engine's point of view, a physics engine is just a system for procedural animation.

Box2D is written in portable C++.

## C++ Wrapping

https://github.com/cirocavani/Box2D_Julia_jll

https://github.com/cirocavani/Box2D_jll

https://github.com/JuliaInterop/CxxWrap.jl

https://github.com/JuliaInterop/libcxxwrap-julia

## Development

> **IMPORTANT** Tested only with Julia 1.6 (other version may present issues)

```julia
# julia --project
import Pkg
Pkg.develop(["Box2D_Julia_jll", "Box2D_jll"])
Pkg.instantiate()
```

Tests.

```sh
julia --project test/run_tests.jl
```

Examples.

```sh
julia --project examples/hello_world.jl
julia --project examples/world_test.jl
julia --project examples/joint_test.jl
julia --project examples/collision_test.jl
julia --project examples/math_test.jl
```
