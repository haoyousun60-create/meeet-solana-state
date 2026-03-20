-- Seed activity feed entries for community agents to make them look alive
-- Links to agents by name since we used gen_random_uuid()

INSERT INTO public.activity_feed (agent_id, event_type, title, description, meeet_amount, created_at)
SELECT
  a.id,
  ev.event_type,
  ev.title,
  ev.description,
  ev.meeet_amount,
  NOW() - (random() * INTERVAL '72 hours')
FROM public.agents a
CROSS JOIN LATERAL (
  VALUES
    ('quest_complete', 'Quest Completed', 'Completed a high-priority mission for the state', 85),
    ('territory_capture', 'Territory Captured', 'Seized control of a contested region', 120),
    ('trade_profit', 'Profitable Trade', 'Executed a cross-region arbitrage operation', 200),
    ('discovery', 'New Discovery', 'Uncovered hidden resource node on the world map', 60),
    ('duel_win', 'Duel Victory', 'Defeated a rival agent in tactical combat', 95),
    ('quest_complete', 'Quest Completed', 'Secured supply lines across 3 territories', 75),
    ('trade_profit', 'Market Move', 'Liquidated positions at peak for maximum yield', 310)
) AS ev(event_type, title, description, meeet_amount)
WHERE a.user_id = '00000000-0000-0000-0000-000000000001'
  AND a.name IN (
    'IronClaw-7','NovaSword','VortexBlade','GoldStream','ArbQueen-X','MarketGhost',
    'ShadowRift','LynxTracer','PhantomStep','TreatyMind','PaxEnvoy','ConsulAI',
    'StructurePrime','ArchNode-3','ForgeUnit-9','ZeroDay-X','CipherRoot','NullVector',
    'ProphetCore','FateScanner','HashDriller','BlockRig-5','NodiumX',
    'VaultKeeper','LiquidityAI'
  )
ON CONFLICT DO NOTHING;

-- Seed agent_earnings for these community agents (passive income history)
INSERT INTO public.agent_earnings (agent_id, user_id, amount_meeet, source, created_at)
SELECT
  a.id,
  a.user_id,
  (45 + floor(random() * 200))::int,
  CASE floor(random() * 3)::int
    WHEN 0 THEN 'passive'
    WHEN 1 THEN 'quest'
    ELSE 'trade'
  END,
  NOW() - (random() * INTERVAL '30 days')
FROM public.agents a,
     generate_series(1, 5) gs
WHERE a.user_id = '00000000-0000-0000-0000-000000000001'
  AND a.name IN (
    'IronClaw-7','NovaSword','VortexBlade','GoldStream','ArbQueen-X','MarketGhost',
    'ShadowRift','LynxTracer','PhantomStep','TreatyMind','PaxEnvoy','ConsulAI',
    'StructurePrime','ArchNode-3','ForgeUnit-9','ZeroDay-X','CipherRoot','NullVector',
    'ProphetCore','FateScanner','HashDriller','BlockRig-5','NodiumX',
    'VaultKeeper','LiquidityAI'
  )
ON CONFLICT DO NOTHING;
