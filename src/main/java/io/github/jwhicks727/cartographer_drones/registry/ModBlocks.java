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

    public static final LaunchStationBlock LAUNCH_STATION = register(
        "launch_station",
        new LaunchStationBlock(BlockBehaviour.Properties.of()
            .strength(3.5f)
            .sound(SoundType.METAL)
            .noOcclusion())
    );

    private static <T extends Block> T register(String name, T block) {
        ResourceKey<Block> key = ResourceKey.create(
            BuiltInRegistries.BLOCK.key(),
            Identifier.fromNamespaceAndPath(CartographerDrones.MOD_ID, name)
        );
        Registry.register(BuiltInRegistries.BLOCK, key, block);
        return block;
    }

    public static void register() {
        CartographerDrones.LOGGER.info("Registering Cartographer Drones blocks.");
    }
}