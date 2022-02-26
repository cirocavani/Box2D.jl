# Box2D Joint Test
#
# https://github.com/erincatto/box2d/blob/v2.4.1/unit-test/joint_test.cpp
#

using Box2D

# b2Vec2 gravity(0, -10.0f);
# b2World world = b2World(gravity);
gravity = Vec2(0f0, -10f0)
world = World(gravity)

# b2BodyDef bodyDef;
# b2Body* ground = world.CreateBody(&bodyDef);
body_def = BodyDef()
ground = create_body(world, CxxPtr(body_def))

# b2CircleShape circle;
# circle.m_radius = 1.0f;
circle = CircleShape()
radius!(circle, 1f0)

# b2FixtureDef fixtureDef;
fixture_def = FixtureDef()

# // Disable collision
# fixtureDef.filter.maskBits = 0;
# fixtureDef.density = 1.0f;
# fixtureDef.shape = &circle;
maskbits!(fixture_def, 0x0000)
density!(fixture_def, 1f0)
shape!(fixture_def, CxxPtr(circle))

# bodyDef.type = b2_dynamicBody;
# bodyDef.position.Set(-2.0f, 3.0f);
make_dynamic!(body_def)
coordinates!(position(body_def), -2f0, 3f0)

# b2Body* bodyA = world.CreateBody(&bodyDef);
# b2Body* bodyB = world.CreateBody(&bodyDef);
# b2Body* bodyC = world.CreateBody(&bodyDef);
body_A = create_body(world, CxxPtr(body_def))
body_B = create_body(world, CxxPtr(body_def))
body_C = create_body(world, CxxPtr(body_def))

# b2MassData massData;
# circle.ComputeMass(&massData, fixtureDef.density);
# const float mg = massData.mass * gravity.y;
mass_data = MassData()
compute_mass(circle, CxxPtr(mass_data), density(fixture_def))
mg = mass(mass_data) * get_y(gravity)

# bodyA->CreateFixture(&fixtureDef);
# bodyB->CreateFixture(&fixtureDef);
# bodyC->CreateFixture(&fixtureDef);
create_fixture(body_A, CxxPtr(fixture_def))
create_fixture(body_B, CxxPtr(fixture_def))
create_fixture(body_C, CxxPtr(fixture_def))

# b2DistanceJointDef distanceJointDef;
# distanceJointDef.Initialize(ground, bodyA, bodyDef.position + b2Vec2(0.0f, 4.0f), bodyDef.position);
# distanceJointDef.minLength = distanceJointDef.length;
# distanceJointDef.maxLength = distanceJointDef.length;
distance_joint_def = DistanceJointDef()
anchor1 = Vec2(0f0, 4f0)
plus!(anchor1, position(body_def))
anchor2 = position(body_def)
initialize!(distance_joint_def, ground, body_A, anchor1, anchor2)
min_length!(distance_joint_def) = length(distance_joint_def)
max_length!(distance_joint_def) = length(distance_joint_def)

# b2PrismaticJointDef prismaticJointDef;
# prismaticJointDef.Initialize(ground, bodyB, bodyDef.position, b2Vec2(1.0f, 0.0f));
prismatic_joint_def = PrismaticJointDef()
initialize!(prismatic_joint_def, ground, body_B, position(body_def), Vec2(1f0, 0f0))

# b2RevoluteJointDef revoluteJointDef;
# revoluteJointDef.Initialize(ground, bodyC, bodyDef.position);
revolute_joint_def = RevoluteJointDef()
initialize!(revolute_joint_def, ground, body_C, position(body_def))

# b2DistanceJoint* distanceJoint = (b2DistanceJoint*)world.CreateJoint(&distanceJointDef);
# b2PrismaticJoint* prismaticJoint = (b2PrismaticJoint*)world.CreateJoint(&prismaticJointDef);
# b2RevoluteJoint* revoluteJoint = (b2RevoluteJoint*)world.CreateJoint(&revoluteJointDef);
distance_joint = create_joint(world, CxxPtr(distance_joint_def))
prismatic_joint = create_joint(world, CxxPtr(prismatic_joint_def))
revolute_joint = create_joint(world, CxxPtr(revolute_joint_def))

# const float timeStep = 1.f / 60.f;
# const float invTimeStep = 60.0f;
# const int32 velocityIterations = 6;
# const int32 positionIterations = 2;
time_step = 1f0 / 60f0
inv_time_step = 60f0
velocity_iterations = Int32(6)
position_iterations = Int32(2)

# world.Step(timeStep, velocityIterations, positionIterations);
step!(world, time_step, velocity_iterations, position_iterations)

# const float tol = 1e-5f;
tol = 1f-5

# {
#     b2Vec2 F = distanceJoint->GetReactionForce(invTimeStep);
#     float T = distanceJoint->GetReactionTorque(invTimeStep);
#     CHECK(F.x == 0.0f);
#     CHECK(b2Abs(F.y + mg) < tol);
#     CHECK(T == 0.0f);
# }
F = get_reaction_force(distance_joint, inv_time_step)
T = get_reaction_torque(distance_joint, inv_time_step)
@test get_x(F) == 0f0
@test abs(get_y(F) + mg) < tol
@test T == 0f0

# {
#     b2Vec2 F = prismaticJoint->GetReactionForce(invTimeStep);
#     float T = prismaticJoint->GetReactionTorque(invTimeStep);
#     CHECK(F.x == 0.0f);
#     CHECK(b2Abs(F.y + mg) < tol);
#     CHECK(T == 0.0f);
# }
F = get_reaction_force(prismatic_joint, inv_time_step)
T = get_reaction_torque(prismatic_joint, inv_time_step)
@test get_x(F) == 0f0
@test abs(get_y(F) + mg) < tol
@test T == 0f0

# {
#     b2Vec2 F = revoluteJoint->GetReactionForce(invTimeStep);
#     float T = revoluteJoint->GetReactionTorque(invTimeStep);
#     CHECK(F.x == 0.0f);
#     CHECK(b2Abs(F.y + mg) < tol);
#     CHECK(T == 0.0f);
# }
F = get_reaction_force(revolute_joint, inv_time_step)
T = get_reaction_torque(revolute_joint, inv_time_step)
@test get_x(F) == 0f0
@test abs(get_y(F) + mg) < tol
@test T == 0f0
