package io.github.jwhicks727.cartographer_drones.registry;

import io.github.jwhicks727.cartographer_drones.CartographerDrones;
import net.fabricmc.fabric.api.creativetab.v1.CreativeModeTabEvents;
import net.minecraft.world.item.CreativeModeTabs;

public class ModCreativeTabs {

    // Adds Cartographer Drones items to the Tools & Utilities vanilla tab
    // A custom tab will replace this in a future update
    public static void register() {
        CreativeModeTabEvents.modifyOutputEvent(CreativeModeTabs.TOOLS_AND_UTILITIES)
            .register((creativeTab) -> {
                creativeTab.accept(ModItems.ORNITHOPTER_STATION);
                creativeTab.accept(ModItems.ORNITHOPTER_DRONE);
            });
        CartographerDrones.LOGGER.info("Registering Cartographer Drones creative tab entries.");
    }
}