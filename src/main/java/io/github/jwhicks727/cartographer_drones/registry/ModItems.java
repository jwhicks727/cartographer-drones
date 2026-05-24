package io.github.jwhicks727.cartographer_drones.registry;

import io.github.jwhicks727.cartographer_drones.CartographerDrones;
import io.github.jwhicks727.cartographer_drones.block.LaunchStationBlock;
import io.github.jwhicks727.cartographer_drones.item.CartographerDroneItem;
import net.minecraft.core.Registry;
import net.minecraft.core.registries.BuiltInRegistries;
import net.minecraft.resources.Identifier;
import net.minecraft.resources.ResourceKey;
import net.minecraft.world.item.BlockItem;
import net.minecraft.world.item.Item;

public class ModItems {

    // --- Tier 1: Ornithopter ---

    // Craftable drone item — inserted into the Ornithopter Station to launch missions
    public static final CartographerDroneItem ORNITHOPTER_DRONE = register(
        "ornithopter_drone",
        new CartographerDroneItem(new Item.Properties()
            .setId(ResourceKey.create(BuiltInRegistries.ITEM.key(),
                Identifier.fromNamespaceAndPath(CartographerDrones.MOD_ID, "ornithopter_drone"))))
    );

    // Block item for the Ornithopter Station — allows it to be held and placed
    public static final Item ORNITHOPTER_STATION = register(
        "ornithopter_station",
        new BlockItem(ModBlocks.ORNITHOPTER_STATION,
            new Item.Properties()
                .setId(ResourceKey.create(BuiltInRegistries.ITEM.key(),
                    Identifier.fromNamespaceAndPath(CartographerDrones.MOD_ID, "ornithopter_station"))))
    );

    // Generic registration helper — registers item to the game registry and returns it
    private static <T extends Item> T register(String name, T item) {
        ResourceKey<Item> key = ResourceKey.create(
            BuiltInRegistries.ITEM.key(),
            Identifier.fromNamespaceAndPath(CartographerDrones.MOD_ID, name)
        );
        Registry.register(BuiltInRegistries.ITEM, key, item);
        return item;
    }

    // Called from CartographerDrones.onInitialize() to trigger static field registration
    public static void register() {
        CartographerDrones.LOGGER.info("Registering Cartographer Drones items.");
    }
}