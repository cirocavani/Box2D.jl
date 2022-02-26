# Box2D Math Test
#
# https://github.com/erincatto/box2d/blob/v2.4.1/unit-test/math_test.cpp
#

using Box2D

# b2Sweep sweep{};
# sweep.localCenter.SetZero();
# sweep.c0.Set(-2.0f, 4.0f);
# sweep.c.Set(3.0f, 8.0f);
# sweep.a0 = 0.5f;
# sweep.a = 5.0f;
# sweep.alpha0 = 0.0f;
sweep = Sweep()
zero!(local_center(sweep))
coordinates!(get_c0(sweep), -2f0, 4f0)
coordinates!(get_c(sweep), 3f0, 8f0)
set_a0!(sweep, 0.5f0)
set_a!(sweep, 5f0)
set_alpha0!(sweep, 0.5f0)

# b2Transform transform;
transformation = Transform()

# sweep.GetTransform(&transform, 0.0f);
# DOCTEST_REQUIRE_EQ(transform.p.x, sweep.c0.x);
# DOCTEST_REQUIRE_EQ(transform.p.y, sweep.c0.y);
# DOCTEST_REQUIRE_EQ(transform.q.c, cosf(sweep.a0));
# DOCTEST_REQUIRE_EQ(transform.q.s, sinf(sweep.a0));
get_transform(sweep, CxxPtr(transformation), 0f0)
@assert(get_x(get_p(transformation)) == get_x(get_c0(sweep)))
@assert(get_y(get_p(transformation)) == get_y(get_c0(sweep)))
@assert(get_c(get_q(transformation)) == cos(get_a0(sweep)))
@assert(get_s(get_q(transformation)) == sin(get_a0(sweep)))

# sweep.GetTransform(&transform, 1.0f);
# DOCTEST_REQUIRE_EQ(transform.p.x, sweep.c.x);
# DOCTEST_REQUIRE_EQ(transform.p.y, sweep.c.y);
# DOCTEST_REQUIRE_EQ(transform.q.c, cosf(sweep.a));
# DOCTEST_REQUIRE_EQ(transform.q.s, sinf(sweep.a));
get_transform(sweep, CxxPtr(transformation), 1f0)
@assert(get_x(get_p(transformation)) == get_x(get_c(sweep)))
@assert(get_y(get_p(transformation)) == get_y(get_c(sweep)))
@assert(get_c(get_q(transformation)) == cos(get_a(sweep)))
@assert(get_s(get_q(transformation)) == sin(get_a(sweep)))
