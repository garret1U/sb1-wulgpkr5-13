/*
  # Update RLS Policies
  
  This migration:
  1. Drops any existing policies
  2. Creates new unified policies for authenticated users
  3. Uses unique policy names to avoid conflicts
*/

-- Drop ALL existing policies first
DROP POLICY IF EXISTS "allow_all_companies" ON companies;
DROP POLICY IF EXISTS "allow_all_locations" ON locations;
DROP POLICY IF EXISTS "allow_all_circuits" ON circuits;
DROP POLICY IF EXISTS "allow_all_proposals" ON proposals;
DROP POLICY IF EXISTS "allow_all_proposal_circuits" ON proposal_circuits;
DROP POLICY IF EXISTS "allow_all_proposal_locations" ON proposal_locations;
DROP POLICY IF EXISTS "allow_all_proposal_monthly_costs" ON proposal_monthly_costs;
DROP POLICY IF EXISTS "allow_all_environment_variables" ON environment_variables;

DROP POLICY IF EXISTS "Enable read access for authenticated users" ON companies;
DROP POLICY IF EXISTS "Enable insert access for authenticated users" ON companies;
DROP POLICY IF EXISTS "Enable update access for authenticated users" ON companies;
DROP POLICY IF EXISTS "Enable delete access for authenticated users" ON companies;

DROP POLICY IF EXISTS "Enable read access for authenticated users" ON locations;
DROP POLICY IF EXISTS "Enable insert access for authenticated users" ON locations;
DROP POLICY IF EXISTS "Enable update access for authenticated users" ON locations;
DROP POLICY IF EXISTS "Enable delete access for authenticated users" ON locations;

DROP POLICY IF EXISTS "Enable read access for authenticated users" ON circuits;
DROP POLICY IF EXISTS "Enable insert access for authenticated users" ON circuits;
DROP POLICY IF EXISTS "Enable update access for authenticated users" ON circuits;
DROP POLICY IF EXISTS "Enable delete access for authenticated users" ON circuits;

DROP POLICY IF EXISTS "Enable read access for authenticated users" ON proposals;
DROP POLICY IF EXISTS "Enable insert access for authenticated users" ON proposals;
DROP POLICY IF EXISTS "Enable update access for authenticated users" ON proposals;
DROP POLICY IF EXISTS "Enable delete access for authenticated users" ON proposals;

-- Create new policies with unique names
CREATE POLICY "companies_full_access_v4"
  ON companies FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "locations_full_access_v4"
  ON locations FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "circuits_full_access_v4"
  ON circuits FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "proposals_full_access_v4"
  ON proposals FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "proposal_circuits_full_access_v4"
  ON proposal_circuits FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "proposal_locations_full_access_v4"
  ON proposal_locations FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "proposal_monthly_costs_full_access_v4"
  ON proposal_monthly_costs FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "environment_variables_full_access_v4"
  ON environment_variables FOR ALL
  TO authenticated
  USING (true)
  WITH CHECK (true);