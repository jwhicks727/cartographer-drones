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

    // --- Tier 1: Ornithopter ---

    // BlockEntity type for the Ornithopter Station — handles GUI, state, and drone slot
    public static final BlockEntityType<LaunchStationBlockEntity> ORNITHOPTER_STATION =
        Registry.register(
            BuiltInRegistries.BLOCK_ENTITY_TYPE,
            ResourceKey.create(
                BuiltInRegistries.BLOCK_ENTITY_TYPE.key(),
                Identifier.fromNamespaceAndPath(CartographerDrones.MOD_ID, "ornithopter_station")
            ),
            FabricBlockEntityTypeBuilder.create(LaunchStationBlockEntity::new,
                ModBlocks.ORNITHOPTER_STATION)
                .build()
        );

    // Called from CartographerDrones.onInitialize() to trigger static field registration
    public static void register() {
        CartographerDrones.LOGGER.info("Registering Cartographer Drones block entities.");
    }
}