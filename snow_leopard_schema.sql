
---

# 🧱 schema.sql

```sql
CREATE TABLE realms (
    realm_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT
);

CREATE TABLE creatures (
    creature_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    realm_id INT,
    rarity VARCHAR(50),
    FOREIGN KEY (realm_id) REFERENCES realms(realm_id)
);

CREATE TABLE abilities (
    ability_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    element VARCHAR(50)
);

CREATE TABLE creature_abilities (
    creature_id INT,
    ability_id INT,
    PRIMARY KEY (creature_id, ability_id),
    FOREIGN KEY (creature_id) REFERENCES creatures(creature_id),
    FOREIGN KEY (ability_id) REFERENCES abilities(ability_id)
);
