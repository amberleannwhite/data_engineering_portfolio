INSERT INTO realms (name, description) VALUES
('Frostbound Peaks', 'Icy alpine regions'),
('Emerald Wilds', 'Ancient forest realms');

INSERT INTO creatures (name, realm_id, rarity) VALUES
('Snow Leopard', 1, 'Legendary'),
('Moon Lynx', 2, 'Rare');

INSERT INTO abilities (name, element) VALUES
('Frost Cloak', 'Ice'),
('Shadow Step', 'Dark'),
('Emerald Heal', 'Nature');

INSERT INTO creature_abilities VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3);
