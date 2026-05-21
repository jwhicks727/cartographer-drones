package io.github.jwhicks727.cartographer_drones.entity;

import io.github.jwhicks727.cartographer_drones.CartographerDrones;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.entity.PathfinderMob;
import net.minecraft.world.level.Level;

public class CartographerDroneEntity extends PathfinderMob {

    public enum DroneState {
        IDLE,
        ACTIVE,
        RETURNING
    }

    private DroneState state = DroneState.IDLE;

    public CartographerDroneEntity(EntityType<? extends PathfinderMob> entityType, Level level) {
        super(entityType, level);
    }

    public DroneState getState() {
        return state;
    }

    public void setState(DroneState state) {
        this.state = state;
        CartographerDrones.LOGGER.info("Drone state changed to: " + state);
    }

    @Override
    public void tick() {
        super.tick();
    }
}