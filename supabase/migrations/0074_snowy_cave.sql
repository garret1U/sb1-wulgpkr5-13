/*
  # Update User Role Assignment Logic
  
  1. Improves handle_new_user() function for role assignment
  2. Implements first-user-admin logic
  3. Adds role validation and indexing
*/

-- Drop existing trigger and function
DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
DROP FUNCTION IF EXISTS handle_new_user();

-- Create new function with proper role assignment
CREATE OR REPLACE FUNCTION handle_new_user() 
RETURNS TRIGGER 
SECURITY DEFINER
SET search_path = public
LANGUAGE plpgsql
AS $$
DECLARE
  user_count INT;
BEGIN
  -- Count existing users
  SELECT COUNT(*) INTO user_count FROM user_profiles;
  
  -- Insert new profile
  INSERT INTO public.user_profiles (
    user_id,
    role,
    email
  ) VALUES (
    NEW.id,
    CASE 
      WHEN user_count = 0 THEN 'admin'  -- First user becomes admin
      ELSE 'viewer'                     -- All other users become viewers
    END,
    NEW.email
  );
  
  RETURN NEW;
END;
$$;

-- Create new trigger
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW
  EXECUTE FUNCTION handle_new_user();

-- Create index for faster role checks if not exists
CREATE INDEX IF NOT EXISTS idx_user_profiles_role_check 
ON user_profiles(user_id, role);

-- Add constraint to ensure valid roles if not exists
DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint 
    WHERE conname = 'user_profiles_role_check'
  ) THEN
    ALTER TABLE user_profiles 
    ADD CONSTRAINT user_profiles_role_check 
    CHECK (role IN ('admin', 'viewer'));
  END IF;
END $$;