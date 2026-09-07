-- Upgrade existing Cloud Mail v3.2 databases to the v3.3 schema.
-- This migration intentionally preserves all existing records.
ALTER TABLE setting ADD COLUMN auto_clean_days INTEGER NOT NULL DEFAULT 0;
ALTER TABLE setting ADD COLUMN auto_clean_exclude TEXT NOT NULL DEFAULT '';
ALTER TABLE setting ADD COLUMN webhook_url TEXT NOT NULL DEFAULT '';
ALTER TABLE setting ADD COLUMN webhook_status INTEGER NOT NULL DEFAULT 1;
ALTER TABLE setting ADD COLUMN webhook_retry INTEGER NOT NULL DEFAULT 0;
ALTER TABLE setting ADD COLUMN webhook_secret TEXT NOT NULL DEFAULT '';

CREATE INDEX IF NOT EXISTS idx_email_create_time ON email(create_time);
