-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NPC: qm15 (???)
-- Spawns Pantokrator
-- @pos ? ? ? 253
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/status");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17813918) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(WARPED_IRON_GIANT_NAIL) and player:hasKeyItem(DENTED_CHARIOT_SHIELD)) then
            player:startEvent(1020, WARPED_IRON_GIANT_NAIL, DENTED_CHARIOT_SHIELD); -- Ask if player wants to use KIs
        else
            player:startEvent(1025, WARPED_IRON_GIANT_NAIL, DENTED_CHARIOT_SHIELD); -- Do not ask, because player is missing at least 1.
        end
    end
]]
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 1020 and option == 1) then
        SpawnMob(17813918):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(WARPED_IRON_GIANT_NAIL);
        player:delKeyItem(DENTED_CHARIOT_SHIELD);
    end
end;
