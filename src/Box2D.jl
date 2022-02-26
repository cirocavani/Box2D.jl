module Box2D

using Box2D_Julia_jll
using CxxWrap
import Base: position, length

@wrapmodule(libbox2d_julia)

function __init__()
    @initcxx
end

export
    Vec2,
    MassData,
    Shape,
    PolygonShape,
    CircleShape,
    EdgeShape,
    ChainShape,
    FixtureDef,
    Fixture,
    BodyDef,
    Body,
    JointDef,
    DistanceJointDef,
    FrictionJointDef,
    GearJointDef,
    MotorJointDef,
    MouseJointDef,
    PrismaticJointDef,
    PulleyJointDef,
    RevoluteJointDef,
    WeldJointDef,
    WheelJointDef,
    Joint,
    DistanceJoint,
    FrictionJoint,
    GearJoint,
    MotorJoint,
    MouseJoint,
    PrismaticJoint,
    PulleyJoint,
    RevoluteJoint,
    WeldJoint,
    WheelJoint,
    Contact,
    ContactListener,
    ContactListenerAdapter,
    World,
# Vec2
    get_x,
    get_y,
    coordinates!,
    zero!,
    neg,
    plus!,
    minus!,
    scale!,
    length,
    length_squared,
    normalize!,
    is_valid,
    skew,
# MassData
    mass,
    center,
    inertia,
# Shape
    radius!,
    radius,
    compute_mass,
# PolygonShape
    make_box!,
# FixtureDef
    shape!,
    shape,
    density!,
    density,
    friction!,
    friction,
    categorybits!,
    categorybits,
    maskbits!,
    maskbits,
    groupindex!,
    groupindex,
# BodyType
    BodyType,
    STATIC_BODY,
    KINEMATIC_BODY,
    DYNAMIC_BODY,
# BodyDef
    make_static!,
    make_kinematic!,
    make_dynamic!,
    body_type,
    position,
# Body
    create_fixture,
    destroy_fixture,
    get_position,
    get_angle,
    transform!,
# T<:JointDef
    initialize!,
    # length,
    min_length!,
    max_length!,
# Joint
    get_reaction_force,
    get_reaction_torque,
# ContactEvent
    ContactEvent,
    BEGIN_CONTACT,
    END_CONTACT,
# World
    create_body,
    destroy_body,
    create_joint,
    destroy_joint,
    contact_listener!,
    step!,
# CxxWrap
    CxxPtr,
    @safe_cfunction

end # module
