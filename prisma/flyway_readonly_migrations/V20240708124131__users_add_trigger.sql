CREATE TRIGGER set_users_updatedAt
    BEFORE UPDATE ON users
    FOR EACH ROW EXECUTE FUNCTION set_updatedAt_column();
