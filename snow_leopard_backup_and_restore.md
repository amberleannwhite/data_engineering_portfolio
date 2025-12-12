💾 backup_restore.md
### Backup

mysqldump -u root -p snow_leopard_codex -r snow_leopard_codex.sql

### Restore to New Database:
CREATE DATABASE snow_leopard_codex_restore;

mysql -u root -p snow_leopard_codex_restore < snow_leopard_codex.sql

### Verification
USE snow_leopard_codex_restore;
SHOW TABLES;
SELECT COUNT(*) FROM creatures;

Notes📝
- mysqldump exports data
- mysql imports data
- Database context matters
- Absolute paths prevent silent failures
