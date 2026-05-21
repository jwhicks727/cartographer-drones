package io.github.jwhicks727.cartographer_drones;

import net.fabricmc.api.ModInitializer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import io.github.jwhicks727.cartographer_drones.registry.ModEntities;
import io.github.jwhicks727.cartographer_drones.registry.ModItems;

public class CartographerDrones implements ModInitializer {
	public static final String MOD_ID = "cartographer_drones";

	// This logger is used to write text to the console and the log file.
	// It is considered best practice to use your mod id as the logger's name.
	// That way, it's clear which mod wrote info, warnings, and errors.
	public static final Logger LOGGER = LoggerFactory.getLogger(MOD_ID);

	@Override
	public void onInitialize() {
		// This code runs as soon as Minecraft is in a mod-load-ready state.
		// However, some things (like resources) may still be uninitialized.
		// Proceed with mild caution.
		ModEntities.register();
		ModItems.register();
		CartographerDrones.LOGGER.info("Cartographer Drones initialized.");
		LOGGER.info("Cartographer Drones initialized.");
	}
}