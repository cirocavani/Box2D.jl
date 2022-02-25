fixture_def = FixtureDef()

polygon = PolygonShape()
shape!(fixture_def, CxxPtr(polygon))
@test shape(fixture_def) == CxxPtr(polygon)

density!(fixture_def, 1f0)
@test density(fixture_def) == 1f0

friction!(fixture_def, 0.3f0)
@test friction(fixture_def) == 0.3f0
