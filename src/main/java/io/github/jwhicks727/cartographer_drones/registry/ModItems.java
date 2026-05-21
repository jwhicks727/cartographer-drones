package io.github.jwhicks727.cartographer_drones.registry;

import io.github.jwhicks727.cartographer_drones.CartographerDrones;
import io.github.jwhicks727.cartographer_drones.item.CartographerDroneItem;
import net.minecraft.core.Registry;
import net.minecraft.core.registries.BuiltInRegistries;
import net.minecraft.resources.Identifier;
import net.minecraft.resources.ResourceKey;
import net.minecraft.world.item.Item;

public class ModItems {

    public static final CartographerDroneItem CARTOGRAPHER_DRONE = register(
        "cartographer_drone",
        new CartographerDroneItem(new Item.Properties()
            .setId(ResourceKey.create(BuiltInRegistries.ITEM.key(),
                Identifier.fromNamespaceAndPath(CartographerDrones.MOD_ID, "cartographer_drone"))))
    );

    private static <T extends Item> T register(String name, T item) {
        ResourceKey<Item> key = ResourceKey.create(
            BuiltInRegistries.ITEM.key(),
            Identifier.fromNamespaceAndPath(CartographerDrones.MOD_ID, name)
        );
        Registry.register(BuiltInRegistries.ITEM, key, item);
        return item;
    }

    public static void register() {
        CartographerDrones.LOGGER.info("Registering Cartographer Drones items.");
    }
}