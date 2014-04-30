firinglogic
===========

Corona SDK snippet for firing projectiles

I always find that firing projectiles can be problematic in Corona, especially when you want those projectiles to register some kind of behavior when they collide with the object in question. 

I've come up with a good way to take care of this, without having a large performance hit. This modularizes the firing code (still requiring the original location of the projectile) and can be used to either a) allow each individual projectile to house Runtime logic for collision/overlapping with other objects, or b) have the other objects (enemies, walls, doors, collectible items) handle the collision logic. 
