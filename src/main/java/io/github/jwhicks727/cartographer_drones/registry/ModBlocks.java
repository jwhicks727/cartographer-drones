package io.github.jwhicks727.cartographer_drones.registry;

import io.github.jwhicks727.cartographer_drones.CartographerDrones;
import io.github.jwhicks727.cartographer_drones.block.LaunchStationBlock;
import net.minecraft.core.Registry;
import net.minecraft.core.registries.BuiltInRegistries;
import net.minecraft.resources.Identifier;
import net.minecraft.resources.ResourceKey;
import net.minecraft.world.level.block.Block;
import net.minecraft.world.level.block.SoundType;
import net.minecraft.world.level.block.state.BlockBehaviour;

public class ModBlocks {

    // --- Tier 1: Ornithopter ---

    // The Ornithopter Station — Tier 1 fixed launch block
    // Strength 3.5 (harder than wood, softer than iron), metal sound, non-opaque for model rendering
    public static final LaunchStationBlock ORNITHOPTER_STATION = register(
    "ornithopter_station",
    new LaunchStationBlock(BlockBehaviour.Properties.of()
        .strength(3.5f)
        .sound(SoundType.WOOD)
        .noOcclusion()
        .setId(ResourceKey.create(
            BuiltInRegistries.BLOCK.key(),
            Identifier.fromNamespaceAndPath(CartographerDrones.MOD_ID, "ornithopter_station"))))
);

    // Generic registration helper — registers block to the game registry and returns it
    private static <T extends Block> T register(String name, T block) {
        ResourceKey<Block> key = ResourceKey.create(
            BuiltInRegistries.BLOCK.key(),
            Identifier.fromNamespaceAndPath(CartographerDrones.MOD_ID, name)
        );
        Registry.register(BuiltInRegistries.BLOCK, key, block);
        return block;
    }

    // Called from CartographerDrones.onInitialize() to trigger static field registration
    public static void register() {
        CartographerDrones.LOGGER.info("Registering Cartographer Drones blocks.");
    }
}