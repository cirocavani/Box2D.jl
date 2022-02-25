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
    Shape,
    PolygonShape,
    CircleShape,
    FixtureDef,
    Fixture,
    BodyDef,
    Body,
    JointDef,
    Joint,
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
# Shape
    radius!,
    radius,
# PolygonShape
    make_box!,
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
    set_transform,
# FixtureDef
    shape!,
    shape,
    density!,
    density,
    friction!,
    friction,
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
