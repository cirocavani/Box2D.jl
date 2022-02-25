body_def = BodyDef()

p = position(body_def)
coordinates!(p, 3f0, 4f0)
@test get_x(p) == 3f0
@test get_y(p) == 4f0
@test length(p) == 5f0
@test position(body_def) === p

@test body_type(body_def) == STATIC_BODY

make_kinematic!(body_def)
@test body_type(body_def) == KINEMATIC_BODY

make_dynamic!(body_def)
@test body_type(body_def) == DYNAMIC_BODY

make_static!(body_def)
@test body_type(body_def) == STATIC_BODY
