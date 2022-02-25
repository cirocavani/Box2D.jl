gravity = Vec2(0f0, -10f0)
world = World(gravity)

function contact_callback(event, contact)
    @show(event)
    @show(contact)
    nothing
end

contact_callback_c = @safe_cfunction(contact_callback, Nothing, (ContactEvent, CxxPtr{Contact}))
listener = ContactListenerAdapter(contact_callback_c)

contact_listener!(world, CxxPtr(listener))
