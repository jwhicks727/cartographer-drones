package io.github.jwhicks727.cartographer_drones.registry;

import io.github.jwhicks727.cartographer_drones.CartographerDrones;
import io.github.jwhicks727.cartographer_drones.entity.CartographerDroneEntity;
import net.minecraft.core.registries.BuiltInRegistries;
import net.minecraft.core.Registry;
import net.minecraft.resources.ResourceKey;
import net.minecraft.resources.Identifier;
import net.minecraft.world.entity.Entity;
import net.minecraft.world.entity.EntityType;
import net.minecraft.world.entity.MobCategory;

public class ModEntities {

    public static final EntityType<CartographerDroneEntity> CARTOGRAPHER_DRONE = register(
        "cartographer_drone",
        EntityType.Builder.<CartographerDroneEntity>of(CartographerDroneEntity::new, MobCategory.MISC)
            .sized(0.8f, 0.4f)
    );

    private static <T extends Entity> EntityType<T> register(String name, EntityType.Builder<T> builder) {
        ResourceKey<EntityType<?>> key = ResourceKey.create(
            BuiltInRegistries.ENTITY_TYPE.key(),
            Identifier.fromNamespaceAndPath(CartographerDrones.MOD_ID, name)
        );
        return Registry.register(BuiltInRegistries.ENTITY_TYPE, key, builder.build(key));
    }

    public static void register() {
        CartographerDrones.LOGGER.info("Registering Cartographer Drones entities.");
    }
}