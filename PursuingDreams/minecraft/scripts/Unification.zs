#priority 4499

import mods.pyrotech.IroncladAnvil;
import mods.pyrotech.GraniteAnvil;

#燧石碎片 统一为ntp
IroncladAnvil.removeRecipes(<pyrotech:material:10>);
IroncladAnvil.addRecipe("ntp_flint_shard_1", <notreepunching:flint_shard>* 3, 
<minecraft:flint>, 6, "hammer");
GraniteAnvil.addRecipe("ntp_flint_shard_1", <notreepunching:flint_shard>* 3, 
<minecraft:flint>, 6, "hammer");
