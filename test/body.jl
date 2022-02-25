gravity = Vec2(0f0, -10f0)
world = World(gravity)
body_def = BodyDef()
body = create_body(world, CxxPtr(body_def))

set_transform(body, Vec2(3f0, 4f0), 10f0)
@test get_x(get_position(body)) == 3f0
@test get_y(get_position(body)) == 4f0
@test get_angle(body) == 10f0

destroy_body(world, body)
