package io.github.jwhicks727.cartographer_drones.registry;

import io.github.jwhicks727.cartographer_drones.CartographerDrones;
import io.github.jwhicks727.cartographer_drones.block.entity.LaunchStationBlockEntity;
import net.fabricmc.fabric.api.object.builder.v1.block.entity.FabricBlockEntityTypeBuilder;
import net.minecraft.core.Registry;
import net.minecraft.core.registries.BuiltInRegistries;
import net.minecraft.resources.Identifier;
import net.minecraft.resources.ResourceKey;
import net.minecraft.world.level.block.entity.BlockEntityType;

public class ModBlockEntities {

    public static final BlockEntityType<LaunchStationBlockEntity> LAUNCH_STATION =
        Registry.register(
            BuiltInRegistries.BLOCK_ENTITY_TYPE,
            ResourceKey.create(
                BuiltInRegistries.BLOCK_ENTITY_TYPE.key(),
                Identifier.fromNamespaceAndPath(CartographerDrones.MOD_ID, "launch_station")
            ),
            FabricBlockEntityTypeBuilder.create(LaunchStationBlockEntity::new,
                ModBlocks.LAUNCH_STATION)
                .build()
        );

    public static void register() {
        CartographerDrones.LOGGER.info("Registering Cartographer Drones block entities.");
    }
}