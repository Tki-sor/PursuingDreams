#loader contenttweaker
#priority 5001
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Block;
import mods.contenttweaker.Item;
import mods.contenttweaker.CreativeTab;
import mods.contenttweaker.IItemRightClick;
import mods.contenttweaker.Commands;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;
import mods.contenttweaker.BlockMaterial;
import mods.contenttweaker.SoundType;
import mods.contenttweaker.SoundEvent;
import mods.contenttweaker.MaterialSystem;
import mods.contenttweaker.Material;
import mods.contenttweaker.MaterialPart;
import mods.contenttweaker.Part;
import mods.contenttweaker.PartBuilder;
import mods.contenttweaker.RegisterMaterialPart;
import mods.contenttweaker.PartDataPiece;
import mods.contenttweaker.MaterialPartData;
import mods.contenttweaker.ActionResult;
import crafttweaker.entity.IEntity;
import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.contenttweaker.MutableItemStack;
import mods.contenttweaker.Hand;
import crafttweaker.data.IData;

val tab = mods.contenttweaker.VanillaFactory.createCreativeTab("PD_item", <item:minecraft:stick>);
tab.register();

//定义函数
function ItemBuilder(name as string,maxn as int,glow as bool){
    print("Adding Item : " + name);
    var itemt = VanillaFactory.createItem(name);
    itemt.maxStackSize = maxn;
    itemt.glowing = glow;
    itemt.creativeTab = <creativetab:PD_item>;
    itemt.register();
}

function FluidBuilder(name as string,color as string,temperature as int,viscosity as int,density as int,luminosity as int,isLava as bool){
    print("Adding Fluid : " + name);
    var fluidt = VanillaFactory.createFluid(name,Color.fromHex(color));
    fluidt.temperature = temperature; //default 300
    fluidt.viscosity = viscosity; //default 1000
    fluidt.density = density; //default 1000
    fluidt.luminosity = luminosity; //default 0
    if (isLava) {
    fluidt.material = <blockmaterial:lava>;
    fluidt.stillLocation = "base:fluids/molten";
    fluidt.flowingLocation = "base:fluids/molten_flowing";
    } else {
    fluidt.material = <blockmaterial:water>;
    fluidt.stillLocation = "base:fluids/liquid";
    fluidt.flowingLocation = "base:fluids/liquid_flow";
    }
    fluidt.register();
}

val tabblock = mods.contenttweaker.VanillaFactory.createCreativeTab("PD_block", <item:minecraft:bedrock>);
tabblock.register();

function BlockBuilder(name as string,blockMaterial as BlockMaterial,hardness as float,resistance as float,blockSoundType as SoundType,lightValue as int,gravity as bool,toolClass as string,toolLevel as int,beaconBase as bool){
    print("Adding Block : " + name);
    var blockt = VanillaFactory.createBlock(name,blockMaterial);
    blockt.setBlockHardness(hardness);
    blockt.setBlockResistance(resistance);
    blockt.setBlockSoundType(blockSoundType);
    blockt.setLightValue(lightValue);
    blockt.gravity = gravity;
    blockt.setToolClass(toolClass);
    blockt.setToolLevel(toolLevel);
    blockt.beaconBase = beaconBase;
    blockt.creativeTab = <creativetab:PD_block>;
    blockt.register();
}
//自定义函数用法:
//ItemBuilder(物品ID,最大堆叠数,是否有附魔光芒);
//FluidBuilder(流体ID,颜色,温度,粘度,密度,亮度,是否为岩浆);
//BlockBuilder(方块ID,方块材质,硬度,抗爆等级,放置方块声音,亮度,是否受重力影响,破坏该方块所需工具,所需挖掘等级,是否可作为信标底座);
