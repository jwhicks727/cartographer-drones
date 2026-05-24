package io.github.jwhicks727.cartographer_drones.block.entity;

import io.github.jwhicks727.cartographer_drones.registry.ModBlockEntities;
import net.minecraft.core.BlockPos;
import net.minecraft.network.chat.Component;
import net.minecraft.world.MenuProvider;
import net.minecraft.world.SimpleContainer;
import net.minecraft.world.entity.player.Inventory;
import net.minecraft.world.entity.player.Player;
import net.minecraft.world.inventory.AbstractContainerMenu;
import net.minecraft.world.level.block.entity.BlockEntity;
import net.minecraft.world.level.block.state.BlockState;
import net.minecraft.world.level.storage.ValueInput;
import net.minecraft.world.level.storage.ValueOutput;
import org.jetbrains.annotations.Nullable;
import com.mojang.serialization.Codec;

public class LaunchStationBlockEntity extends BlockEntity implements MenuProvider {

    public enum StationState {
        IDLE,
        ACTIVE,
        RETURNING
    }

    private StationState state = StationState.IDLE;
    public final SimpleContainer inventory = new SimpleContainer(1);

    public LaunchStationBlockEntity(BlockPos pos, BlockState state) {
        super(ModBlockEntities.ORNITHOPTER_STATION, pos, state);
    }

    public StationState getStationState() {
        return state;
    }

    public void setStationState(StationState state) {
        this.state = state;
        setChanged();
    }

    @Override
    public Component getDisplayName() {
        return Component.translatable("container.cartographer_drones.launch_station");
    }

    @Nullable
    @Override
    public AbstractContainerMenu createMenu(int syncId, Inventory playerInventory, Player player) {
        return null;
    }

    @Override
    protected void saveAdditional(ValueOutput output) {
        super.saveAdditional(output);
        output.store("StationState", Codec.STRING, state.name());
    }

    @Override
    protected void loadAdditional(ValueInput input) {
        super.loadAdditional(input);
        String stateName = input.read("StationState", Codec.STRING).orElse("IDLE");
        try {
            state = StationState.valueOf(stateName);
        } catch (IllegalArgumentException e) {
            state = StationState.IDLE;
        }
    }
}