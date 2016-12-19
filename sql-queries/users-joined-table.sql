SELECT * from users
JOIN relationships on relationships.user_id = users.id
JOIN relative_types on relative_types.id = relationships.relative_id;

