# Box2D Collision Test
#
# https://github.com/erincatto/box2d/blob/v2.4.1/unit-test/collision_test.cpp
#

using Box2D

# const b2Vec2 center(100.0f, -50.0f);
# const float hx = 0.5f, hy = 1.5f;
# const float angle1 = 0.25f;
center_vec = Vec2(100f0, -50f0)
hx = 0.5f0
hy = 1.5f0
angle1 = 0.25f0

# // Data from issue #422. Not used because the data exceeds accuracy limits.
# //const b2Vec2 center(-15000.0f, -15000.0f);
# //const float hx = 0.72f, hy = 0.72f;
# //const float angle1 = 0.0f;

# b2PolygonShape polygon1;
# polygon1.SetAsBox(hx, hy, center, angle1);
polygon1 = PolygonShape()
make_box!(polygon1, hx, hy, center_vec, angle1)

# const float absTol = 2.0f * b2_epsilon;
# const float relTol = 2.0f * b2_epsilon;
abs_tol = 2f0 * eps(Float32)
rel_tol = 2f0 * eps(Float32)

# CHECK(b2Abs(polygon1.m_centroid.x - center.x) < absTol + relTol * b2Abs(center.x));
# CHECK(b2Abs(polygon1.m_centroid.y - center.y) < absTol + relTol * b2Abs(center.y));
@assert(abs(get_x(centroid(polygon1)) - get_x(center_vec)) < abs_tol + rel_tol * abs(get_x(center_vec)))
@assert(abs(get_y(centroid(polygon1)) - get_y(center_vec)) < abs_tol + rel_tol * abs(get_y(center_vec)))

# b2Vec2 vertices[4];
# vertices[0].Set(center.x - hx, center.y - hy);
# vertices[1].Set(center.x + hx, center.y - hy);
# vertices[2].Set(center.x - hx, center.y + hy);
# vertices[3].Set(center.x + hx, center.y + hy);
vertices = Any[
    Vec2(get_x(center_vec) - hx, get_y(center_vec) - hy),
    Vec2(get_x(center_vec) + hx, get_y(center_vec) - hy),
    Vec2(get_x(center_vec) - hx, get_y(center_vec) + hy),
    Vec2(get_x(center_vec) + hx, get_y(center_vec) + hy),
]

# b2PolygonShape polygon2;
# polygon2.Set(vertices, 4);
polygon2 = PolygonShape()
vertices!(polygon2, vertices)

# CHECK(b2Abs(polygon2.m_centroid.x - center.x) < absTol + relTol * b2Abs(center.x));
# CHECK(b2Abs(polygon2.m_centroid.y - center.y) < absTol + relTol * b2Abs(center.y));
@assert(abs(get_x(centroid(polygon2)) - get_x(center_vec)) < abs_tol + rel_tol * abs(get_x(center_vec)))
@assert(abs(get_y(centroid(polygon2)) - get_y(center_vec)) < abs_tol + rel_tol * abs(get_y(center_vec)))

# const float mass = 4.0f * hx * hy;
# const float inertia = (mass / 3.0f) * (hx * hx + hy * hy) + mass * b2Dot(center, center);
mass_value = 4f0 * hx * hy
inertia_value = (mass_value / 3f0) * (hx * hx + hy * hy) + mass_value * dot(center_vec, center_vec)

# b2MassData massData1;
# polygon1.ComputeMass(&massData1, 1.0f);
mass_data1 = MassData()
compute_mass(polygon1, CxxPtr(mass_data1), 1f0)

# CHECK(b2Abs(massData1.center.x - center.x) < absTol + relTol * b2Abs(center.x));
# CHECK(b2Abs(massData1.center.y - center.y) < absTol + relTol * b2Abs(center.y));
# CHECK(b2Abs(massData1.mass - mass) < 20.0f * (absTol + relTol * mass));
# CHECK(b2Abs(massData1.I - inertia) < 40.0f * (absTol + relTol * inertia));
@assert(abs(get_x(center(mass_data1)) - get_x(center_vec)) < abs_tol + rel_tol * abs(get_x(center_vec)))
@assert(abs(get_y(center(mass_data1)) - get_y(center_vec)) < abs_tol + rel_tol * abs(get_y(center_vec)))
@assert(abs(mass(mass_data1) - mass_value) < 20f0 * (abs_tol + rel_tol * mass_value))
@assert(abs(inertia(mass_data1) - inertia_value) < 40f0 * (abs_tol + rel_tol * inertia_value))

# b2MassData massData2;
# polygon2.ComputeMass(&massData2, 1.0f);
mass_data2 = MassData()
compute_mass(polygon2, CxxPtr(mass_data2), 1f0)

# CHECK(b2Abs(massData2.center.x - center.x) < absTol + relTol * b2Abs(center.x));
# CHECK(b2Abs(massData2.center.y - center.y) < absTol + relTol * b2Abs(center.y));
# CHECK(b2Abs(massData2.mass - mass) < 20.0f * (absTol + relTol * mass));
# CHECK(b2Abs(massData2.I - inertia) < 40.0f * (absTol + relTol * inertia));
@assert(abs(get_x(center(mass_data2)) - get_x(center_vec)) < abs_tol + rel_tol * abs(get_x(center_vec)))
@assert(abs(get_y(center(mass_data2)) - get_y(center_vec)) < abs_tol + rel_tol * abs(get_y(center_vec)))
@assert(abs(mass(mass_data2) - mass_value) < 20f0 * (abs_tol + rel_tol * mass_value))
@assert(abs(inertia(mass_data2) - inertia_value) < 40f0 * (abs_tol + rel_tol * inertia_value))
