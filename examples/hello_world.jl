# Box2D Hello World 
#
# https://github.com/erincatto/box2d/blob/v2.4.1/unit-test/hello_world.cpp
#

using Box2D
import Printf: @printf

# // Define the gravity vector.
# b2Vec2 gravity(0.0f, -10.0f);
gravity = Vec2(0f0, -10f0)

# // Construct a world object, which will hold and simulate the rigid bodies.
# b2World world(gravity);
world = World(gravity)

# // Define the ground body.
# b2BodyDef groundBodyDef;
# groundBodyDef.position.Set(0.0f, -10.0f);
ground_body_def = BodyDef()
coordinates!(position(ground_body_def), 0f0, -10f0)

# // Call the body factory which allocates memory for the ground body
# // from a pool and creates the ground box shape (also from a pool).
# // The body is also added to the world.
# b2Body* groundBody = world.CreateBody(&groundBodyDef);
ground_body = create_body(world, CxxPtr(ground_body_def))

# // Define the ground box shape.
# b2PolygonShape groundBox;
ground_box = PolygonShape()

# // The extents are the half-widths of the box.
# groundBox.SetAsBox(50.0f, 10.0f);
make_box!(ground_box, 50f0, 10f0)

# // Add the ground fixture to the ground body.
# groundBody->CreateFixture(&groundBox, 0.0f);
create_fixture(ground_body, CxxPtr(ground_box), 0f0)

# // Define the dynamic body. We set its position and call the body factory.
# b2BodyDef bodyDef;
# bodyDef.type = b2_dynamicBody;
# bodyDef.position.Set(0.0f, 4.0f);
# b2Body* body = world.CreateBody(&bodyDef);
body_def = BodyDef()
make_dynamic!(body_def)
coordinates!(position(body_def), 0f0, 4f0)
body = create_body(world, CxxPtr(body_def))

# // Define another box shape for our dynamic body.
# b2PolygonShape dynamicBox;
# dynamicBox.SetAsBox(1.0f, 1.0f);
dynamic_box = PolygonShape()
make_box!(dynamic_box, 1f0, 1f0)

# // Define the dynamic body fixture.
# b2FixtureDef fixtureDef;
# fixtureDef.shape = &dynamicBox;
fixture_def = FixtureDef()
shape!(fixture_def, CxxPtr(dynamic_box))

# // Set the box density to be non-zero, so it will be dynamic.
# fixtureDef.density = 1.0f;
density!(fixture_def, 1f0)

# // Override the default friction.
# fixtureDef.friction = 0.3f;
friction!(fixture_def, 0.3f0)

# // Add the shape to the body.
# body->CreateFixture(&fixtureDef);
create_fixture(body, CxxPtr(fixture_def))

# // Prepare for simulation. Typically we use a time step of 1/60 of a
# // second (60Hz) and 10 iterations. This provides a high quality simulation
# // in most game scenarios.
# float timeStep = 1.0f / 60.0f;
# int32 velocityIterations = 6;
# int32 positionIterations = 2;
time_step = 1f0 / 60f0
velocity_iterations = Int32(6)
position_iterations = Int32(2)

# (unused)
# b2Vec2 position = body->GetPosition();
# float angle = body->GetAngle();

# // This is our little game loop.
# for (int32 i = 0; i < 60; ++i)
# {
#     // Instruct the world to perform a single step of simulation.
#     // It is generally best to keep the time step and iterations fixed.
#     world.Step(timeStep, velocityIterations, positionIterations);

#     // Now print the position and angle of the body.
#     position = body->GetPosition();
#     angle = body->GetAngle();

#     printf("%4.2f %4.2f %4.2f\n", position.x, position.y, angle);
# }
for i=0:59
    step!(world, time_step, velocity_iterations, position_iterations)
    body_position = get_position(body)
    body_angle = get_angle(body)
    @printf "%4.2f %4.2f %4.2f\n" get_x(body_position) get_y(body_position) body_angle
end

# // When the world destructor is called, all bodies and joints are freed. This can
# // create orphaned pointers, so be careful about your world management.

# CHECK(b2Abs(position.x) < 0.01f);
# CHECK(b2Abs(position.y - 1.01f) < 0.01f);
# CHECK(b2Abs(angle) < 0.01f);

body_position = get_position(body)
body_angle = get_angle(body)

@assert abs(get_x(body_position)) < 0.01f0
@assert abs(get_y(body_position) - 1.01f0) < 0.01f0
@assert abs(body_angle) < 0.01f0
