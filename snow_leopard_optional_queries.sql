UNIQUE CREATURE ABILITIES COUNT:
> SELECT
->   a.ability_name,
->   a.element,
->   COUNT(*) AS creatures_with_ability
-> FROM creature_abilities ca
-> JOIN abilities a ON a.ability_id = ca.ability_id
-> GROUP BY a.ability_id
-> ORDER BY creatures_with_ability DESC, a.ability_name;

RESULT:
+----------------+---------+------------------------+
| ability_name   | element | creatures_with_ability |
+----------------+---------+------------------------+
| Frost Aura     | Ice     |                      1 |
| Molten Breath  | Fire    |                      1 |
| Moonlight Heal | Nature  |                      1 |
| Starstep Dash  | Storm   |                      1 |
| Veilwalk       | Shadow  |                      1 |
+----------------+---------+------------------------+

CREATURE PROFILES (realm + ability count):
SELECT
  c.creature_id,
  c.name,
  c.species,
  r.name AS realm,
  COUNT(ca.ability_id) AS ability_count,
  ROUND(AVG(ca.acquired_level), 2) AS avg_ability_level
FROM creatures c
LEFT JOIN realms r ON c.realm_id = r.realm_id
LEFT JOIN creature_abilities ca ON ca.creature_id = c.creature_id
GROUP BY c.creature_id, r.name
ORDER BY ability_count DESC, avg_ability_level DESC;

RESULT:
+-------------+------------+---------------+---------------------+---------------+-------------------+
| creature_id | name       | species       | realm               | ability_count | avg_ability_level |
+-------------+------------+---------------+---------------------+---------------+-------------------+
|           1 | Aurora     | Snow Leopard  | Frostpeak Mountains |             2 |              4.50 |
|           2 | Cinderwing | Dragon        | Emberglow Caverns   |             1 |              8.00 |
|           4 | Nyx        | Shadow Lynx   | Frostpeak Mountains |             1 |              7.00 |
|           3 | Sylphria   | Forest Sprite | Moonpetal Forest    |             1 |              5.00 |
+-------------+------------+---------------+---------------------+---------------+-------------------+

MOST COMMON ABILITIES:
SELECT
  a.ability_name,
  a.element,
  COUNT(*) AS creatures_with_ability
FROM creature_abilities ca
JOIN abilities a ON a.ability_id = ca.ability_id
GROUP BY a.ability_id
ORDER BY creatures_with_ability DESC, a.ability_name;

RESULT:
+----------------+---------+------------------------+
| ability_name   | element | creatures_with_ability |
+----------------+---------+------------------------+
| Frost Aura     | Ice     |                      1 |
| Molten Breath  | Fire    |                      1 |
| Moonlight Heal | Nature  |                      1 |
| Starstep Dash  | Storm   |                      1 |
| Veilwalk       | Shadow  |                      1 |
+----------------+---------+------------------------+

  ## Further Options ##

  -- View all creatures with their realms
SELECT c.name AS creature, r.name AS realm
FROM creatures c
JOIN realms r ON c.realm_id = r.realm_id;

-- List creature abilities
SELECT c.name AS creature, a.name AS ability
FROM creatures c
JOIN creature_abilities ca ON c.creature_id = ca.creature_id
JOIN abilities a ON ca.ability_id = a.ability_id;

-- Count creatures per realm
SELECT r.name, COUNT(c.creature_id) AS creature_count
FROM realms r
LEFT JOIN creatures c ON r.realm_id = c.realm_id
GROUP BY r.name;

ETC.

