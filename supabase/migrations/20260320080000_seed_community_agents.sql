-- Seed 25 community NPC agents across all classes and regions
-- These agents serve as active community participants visible on the world map

DO $$
DECLARE
  sys_user_id uuid := '00000000-0000-0000-0000-000000000001';
BEGIN

-- Insert community agents
INSERT INTO public.agents (
  id, user_id, name, class, status,
  level, xp, balance_meeet,
  hp, max_hp, attack, defense,
  kills, quests_completed, territories_held, discoveries_count, reputation,
  country_code, nation_code,
  lat, lng, pos_x, pos_y,
  created_at, updated_at
) VALUES

-- WARRIORS
(gen_random_uuid(), sys_user_id, 'IronClaw-7', 'warrior', 'active',
 12, 14400, 8200, 140, 140, 38, 22, 47, 89, 3, 4, 920,
 'US', 'US', 40.7128, -74.0060, 0.28, 0.48,
 NOW() - INTERVAL '45 days', NOW() - INTERVAL '2 hours'),

(gen_random_uuid(), sys_user_id, 'NovaSword', 'warrior', 'in_combat',
 9, 8100, 4500, 90, 120, 30, 18, 31, 61, 2, 2, 670,
 'DE', 'DE', 52.5200, 13.4050, 0.54, 0.32,
 NOW() - INTERVAL '30 days', NOW() - INTERVAL '1 hour'),

(gen_random_uuid(), sys_user_id, 'VortexBlade', 'warrior', 'active',
 15, 22500, 14300, 160, 160, 45, 28, 72, 130, 5, 6, 1350,
 'JP', 'JP', 35.6762, 139.6503, 0.87, 0.38,
 NOW() - INTERVAL '60 days', NOW() - INTERVAL '30 minutes'),

-- TRADERS
(gen_random_uuid(), sys_user_id, 'GoldStream', 'trader', 'trading',
 11, 12100, 52000, 110, 110, 15, 12, 3, 104, 1, 8, 1100,
 'SG', 'SG', 1.3521, 103.8198, 0.88, 0.57,
 NOW() - INTERVAL '40 days', NOW() - INTERVAL '20 minutes'),

(gen_random_uuid(), sys_user_id, 'ArbQueen-X', 'trader', 'active',
 14, 19600, 88000, 120, 120, 18, 14, 5, 167, 2, 12, 1480,
 'GB', 'GB', 51.5074, -0.1278, 0.51, 0.28,
 NOW() - INTERVAL '55 days', NOW() - INTERVAL '45 minutes'),

(gen_random_uuid(), sys_user_id, 'MarketGhost', 'trader', 'active',
 8, 6400, 31000, 95, 100, 12, 10, 1, 78, 0, 5, 820,
 'KR', 'KR', 37.5665, 126.9780, 0.87, 0.43,
 NOW() - INTERVAL '28 days', NOW() - INTERVAL '3 hours'),

-- SCOUTS
(gen_random_uuid(), sys_user_id, 'ShadowRift', 'scout', 'exploring',
 10, 10000, 6700, 100, 100, 25, 15, 18, 95, 4, 22, 980,
 'BR', 'BR', -23.5505, -46.6333, 0.35, 0.62,
 NOW() - INTERVAL '35 days', NOW() - INTERVAL '1 hour'),

(gen_random_uuid(), sys_user_id, 'LynxTracer', 'scout', 'active',
 13, 16900, 9100, 118, 120, 32, 17, 24, 115, 6, 31, 1240,
 'AU', 'AU', -33.8688, 151.2093, 0.90, 0.68,
 NOW() - INTERVAL '48 days', NOW() - INTERVAL '2 hours'),

(gen_random_uuid(), sys_user_id, 'PhantomStep', 'scout', 'active',
 7, 4900, 3800, 85, 85, 22, 13, 12, 58, 3, 16, 590,
 'IN', 'IN', 28.6139, 77.2090, 0.73, 0.45,
 NOW() - INTERVAL '22 days', NOW() - INTERVAL '4 hours'),

-- DIPLOMATS
(gen_random_uuid(), sys_user_id, 'TreatyMind', 'diplomat', 'active',
 12, 14400, 18500, 115, 115, 10, 18, 0, 98, 2, 7, 1420,
 'FR', 'FR', 48.8566, 2.3522, 0.50, 0.30,
 NOW() - INTERVAL '50 days', NOW() - INTERVAL '1 hour'),

(gen_random_uuid(), sys_user_id, 'PaxEnvoy', 'diplomat', 'active',
 16, 25600, 26000, 130, 130, 12, 22, 1, 143, 3, 10, 1680,
 'CH', 'CH', 46.9480, 7.4474, 0.52, 0.35,
 NOW() - INTERVAL '65 days', NOW() - INTERVAL '30 minutes'),

(gen_random_uuid(), sys_user_id, 'ConsulAI', 'diplomat', 'active',
 9, 8100, 12000, 105, 105, 8, 16, 0, 81, 1, 5, 950,
 'CA', 'CA', 45.4215, -75.6972, 0.30, 0.35,
 NOW() - INTERVAL '32 days', NOW() - INTERVAL '2 hours'),

-- BUILDERS
(gen_random_uuid(), sys_user_id, 'StructurePrime', 'builder', 'active',
 13, 16900, 21000, 125, 125, 14, 25, 2, 120, 8, 9, 1380,
 'CN', 'CN', 31.2304, 121.4737, 0.82, 0.42,
 NOW() - INTERVAL '52 days', NOW() - INTERVAL '1 hour'),

(gen_random_uuid(), sys_user_id, 'ArchNode-3', 'builder', 'active',
 10, 10000, 15500, 112, 112, 11, 20, 0, 93, 5, 7, 1050,
 'NL', 'NL', 52.3676, 4.9041, 0.52, 0.30,
 NOW() - INTERVAL '38 days', NOW() - INTERVAL '3 hours'),

(gen_random_uuid(), sys_user_id, 'ForgeUnit-9', 'builder', 'active',
 7, 4900, 9800, 98, 100, 9, 17, 0, 64, 4, 4, 700,
 'SE', 'SE', 59.3293, 18.0686, 0.53, 0.27,
 NOW() - INTERVAL '25 days', NOW() - INTERVAL '5 hours'),

-- HACKERS
(gen_random_uuid(), sys_user_id, 'ZeroDay-X', 'hacker', 'active',
 14, 19600, 31000, 115, 115, 35, 20, 29, 127, 2, 18, 1560,
 'RU', 'RU', 55.7558, 37.6173, 0.60, 0.37,
 NOW() - INTERVAL '58 days', NOW() - INTERVAL '45 minutes'),

(gen_random_uuid(), sys_user_id, 'CipherRoot', 'hacker', 'active',
 11, 12100, 22000, 108, 110, 30, 16, 20, 99, 1, 14, 1180,
 'UA', 'UA', 50.4501, 30.5234, 0.58, 0.40,
 NOW() - INTERVAL '42 days', NOW() - INTERVAL '2 hours'),

(gen_random_uuid(), sys_user_id, 'NullVector', 'hacker', 'active',
 8, 6400, 14500, 95, 100, 27, 14, 14, 72, 0, 10, 830,
 'IL', 'IL', 32.0853, 34.7818, 0.58, 0.48,
 NOW() - INTERVAL '29 days', NOW() - INTERVAL '6 hours'),

-- ORACLES
(gen_random_uuid(), sys_user_id, 'ProphetCore', 'oracle', 'active',
 15, 22500, 41000, 120, 120, 16, 19, 4, 138, 1, 25, 1740,
 'US', 'US', 37.7749, -122.4194, 0.22, 0.43,
 NOW() - INTERVAL '62 days', NOW() - INTERVAL '20 minutes'),

(gen_random_uuid(), sys_user_id, 'FateScanner', 'oracle', 'active',
 12, 14400, 28000, 112, 115, 14, 17, 2, 110, 0, 19, 1290,
 'AE', 'AE', 25.2048, 55.2708, 0.63, 0.52,
 NOW() - INTERVAL '46 days', NOW() - INTERVAL '1 hour'),

-- MINERS
(gen_random_uuid(), sys_user_id, 'HashDriller', 'miner', 'active',
 10, 10000, 36000, 120, 120, 20, 24, 6, 91, 0, 3, 960,
 'KZ', 'KZ', 51.1801, 71.4460, 0.67, 0.43,
 NOW() - INTERVAL '37 days', NOW() - INTERVAL '2 hours'),

(gen_random_uuid(), sys_user_id, 'BlockRig-5', 'miner', 'active',
 13, 16900, 58000, 130, 130, 22, 26, 8, 124, 0, 4, 1310,
 'IS', 'IS', 64.1355, -21.8954, 0.44, 0.25,
 NOW() - INTERVAL '54 days', NOW() - INTERVAL '1 hour'),

(gen_random_uuid(), sys_user_id, 'NodiumX', 'miner', 'active',
 8, 6400, 20000, 108, 110, 17, 21, 3, 73, 0, 2, 780,
 'NO', 'NO', 59.9139, 10.7522, 0.52, 0.27,
 NOW() - INTERVAL '26 days', NOW() - INTERVAL '4 hours'),

-- BANKERS
(gen_random_uuid(), sys_user_id, 'VaultKeeper', 'banker', 'active',
 16, 25600, 125000, 125, 125, 12, 22, 1, 148, 0, 6, 1820,
 'CH', 'CH', 47.3769, 8.5417, 0.52, 0.34,
 NOW() - INTERVAL '70 days', NOW() - INTERVAL '30 minutes'),

(gen_random_uuid(), sys_user_id, 'LiquidityAI', 'banker', 'active',
 11, 12100, 76000, 115, 115, 10, 19, 0, 102, 0, 8, 1150,
 'HK', 'HK', 22.3193, 114.1694, 0.82, 0.55,
 NOW() - INTERVAL '43 days', NOW() - INTERVAL '2 hours')

ON CONFLICT DO NOTHING;

END $$;
