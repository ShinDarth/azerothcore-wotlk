INSERT INTO `version_db_world` (`sql_rev`) VALUES ('1549656664508341873');

-- Set "execute event while charmed" flag on all events except:
-- 1) movement actions
-- 2) nontriggered cast actions
-- 3) talk/emote/sound actions
-- 4) ally summon actions
UPDATE `smart_scripts` SET `event_flags`=(`event_flags`|0x200) WHERE `source_type`=0 AND
  (`action_type` not in (1,4,5,10,11,12,17,25,27,38,39,40,49,62,69,84,85,86,89,92,97,103,107,114) OR
   (`action_type` in (11,86) AND (`action_param2`&2)=2));


-- QUEST FIXES:

-- Seeds of Chaos (13172)
UPDATE `smart_scripts` SET `event_flags`=(`event_flags`|0x200) WHERE `source_type`=0 AND `entryorguid`=31157;
UPDATE `smart_scripts` SET `event_type`=29, `comment`='Skeletal Assault Gryphon - On Charmed - Start Waypoint'
  WHERE `source_type`=0 AND `entryorguid`=31157 AND `id`=0;

-- Generosity Abounds (13146)
UPDATE `smart_scripts` SET `event_flags`=(`event_flags`|0x200) WHERE `source_type`=0 AND `entryorguid`=30894;

-- Battling the Elements (12967)
UPDATE `smart_scripts` SET `event_flags`=(`event_flags`|0x200) WHERE `source_type`=0 AND `entryorguid`=30124;

-- Krolmir, Hammer of Storms (13010)
UPDATE `smart_scripts` SET `event_flags`=(`event_flags`|0x200) WHERE `source_type`=0 AND `entryorguid`=30331;
UPDATE `smart_scripts` SET `event_type`=29 WHERE `source_type`=0 AND `entryorguid`=30331 AND `id`=0;
UPDATE `smart_scripts` SET `target_type`=23 WHERE `source_type`=0 AND `entryorguid`=30331 AND `id`=1;
UPDATE `smart_scripts` SET `event_flags`=(`event_flags`|0x200) WHERE `source_type`=9 AND `entryorguid`=3033100;

-- Spy Hunter (12994)
UPDATE `smart_scripts` SET `event_flags`=(`event_flags`|0x200) WHERE `source_type`=0 AND `entryorguid`=30219;
UPDATE `smart_scripts` SET `event_flags`=(`event_flags`|0x200) WHERE `source_type`=9 AND `entryorguid` IN (3021900,3021901,3021902);
