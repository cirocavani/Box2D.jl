# Box2D World Test
#
# https://github.com/erincatto/box2d/blob/v2.4.1/unit-test/world_test.cpp
#

using Box2D

# static bool begin_contact = false;

# class MyContactListener : public b2ContactListener
# {
# public:
# 	void BeginContact(b2Contact* contact)
# 	{
# 		begin_contact = true;
# 	}
# };

begin_contact = Ref(false)
function contact_callback(event, contact)
    if event == BEGIN_CONTACT
        begin_contact[] = true
    end
    nothing
end

# b2World world = b2World(b2Vec2(0.0f, -10.0f));
gravity = Vec2(0f0, -10f0)
world = World(gravity)

# MyContactListener listener;
# world.SetContactListener(&listener);
contact_callback_c = @safe_cfunction(contact_callback, Nothing, (ContactEvent, CxxPtr{Contact}))
listener = ContactListenerAdapter(contact_callback_c)
contact_listener!(world, CxxPtr(listener))

# b2CircleShape circle;
# circle.m_radius = 5.f;
circle = CircleShape()
radius!(circle, 5f0)

# b2BodyDef bodyDef;
# bodyDef.type = b2_dynamicBody;
body_def = BodyDef()
make_dynamic!(body_def)

# b2Body* bodyA = world.CreateBody(&bodyDef);
# b2Body* bodyB = world.CreateBody(&bodyDef);
# bodyA->CreateFixture(&circle, 0.0f);
# bodyB->CreateFixture(&circle, 0.0f);
body_A = create_body(world, CxxPtr(body_def))
body_B = create_body(world, CxxPtr(body_def))
create_fixture(body_A, CxxPtr(circle), 0f0)
create_fixture(body_B, CxxPtr(circle), 0f0)

# bodyA->SetTransform(b2Vec2(0.f, 0.f), 0.f);
# bodyB->SetTransform(b2Vec2(100.f, 0.f), 0.f);
transform!(body_A, Vec2(0f0, 0f0), 0f0)
transform!(body_B, Vec2(100f0, 0f0), 0f0)

# const float timeStep = 1.f / 60.f;
# const int32 velocityIterations = 6;
# const int32 positionIterations = 2;
time_step = 1f0 / 60f0
velocity_iterations = Int32(6)
position_iterations = Int32(2)

# world.Step(timeStep, velocityIterations, positionIterations);
step!(world, time_step, velocity_iterations, position_iterations)

# CHECK(world.GetContactList() == nullptr);
# CHECK(begin_contact == false);
@test begin_contact[] == false

# bodyB->SetTransform(b2Vec2(1.f, 0.f), 0.f);
transform!(body_B, Vec2(1f0, 0f0), 0f0)

# world.Step(timeStep, velocityIterations, positionIterations);
step!(world, time_step, velocity_iterations, position_iterations)

# CHECK(world.GetContactList() != nullptr);
# CHECK(begin_contact == true);
@test begin_contact[] == true
