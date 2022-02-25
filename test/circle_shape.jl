circle_shape = CircleShape()

radius!(circle_shape, 5f0)
@test radius(circle_shape) == 5f0
