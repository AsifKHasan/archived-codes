CREATE TABLE user_management.authorities (
  id integer NOT NULL,
  name character varying(50) NOT NULL,
  endpoint character varying(250) NOT NULL,
  method character varying(10) NOT NULL,
  service character varying(10) NOT NULL
);

  CREATE SEQUENCE user_management.authorities_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

  ALTER SEQUENCE user_management.authorities_id_seq OWNED BY user_management.authorities.id;


--
  -- Name: authority_authority_mappings; Type: TABLE; Schema: user_management; Owner: postgres
--

  CREATE TABLE user_management.authority_authority_mappings (
  id integer NOT NULL,
  parent_id integer NOT NULL,
  child_id integer NOT NULL
);

  CREATE SEQUENCE user_management.authority_authority_mappings_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

  ALTER SEQUENCE user_management.authority_authority_mappings_id_seq OWNED BY user_management.authority_authority_mappings.id;

  CREATE TABLE user_management.role_authority_mappings (
  id uuid NOT NULL,
  role_id uuid NOT NULL,
  authority_id integer NOT NULL
);

  CREATE TABLE user_management.roles (
  id uuid NOT NULL,
  created_on timestamp without time zone DEFAULT now() NOT NULL,
  created_by uuid,
  updated_on timestamp without time zone,
  description text,
  name character varying(50) NOT NULL,
  updated_by uuid,
  organisation_id uuid NOT NULL
);

  CREATE TABLE user_management.tmp_authority_authority_mappings (
  id integer NOT NULL,
  authority_parent character varying(50) NOT NULL,
  service_parent character varying(10) NOT NULL,
  authority_child character varying(50) NOT NULL,
  service_child character varying(10) NOT NULL
);

  CREATE SEQUENCE user_management.tmp_authority_authority_mappings_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

  ALTER SEQUENCE user_management.tmp_authority_authority_mappings_id_seq OWNED BY user_management.tmp_authority_authority_mappings.id;


--
  -- Name: user_role_mappings; Type: TABLE; Schema: user_management; Owner: postgres
--

  CREATE TABLE user_management.user_role_mappings (
  id uuid NOT NULL,
  user_id uuid NOT NULL,
  role_id uuid NOT NULL
);

  CREATE TABLE user_management.users (
  id uuid NOT NULL,
  login_name character varying(50) NOT NULL,
  profile_id uuid NOT NULL,
  organisation_id uuid NOT NULL,
  is_default_password boolean DEFAULT true NOT NULL,
  is_active boolean DEFAULT true NOT NULL,
  is_deleted boolean DEFAULT false NOT NULL,
  created_on timestamp without time zone DEFAULT now() NOT NULL,
  active_from timestamp without time zone DEFAULT now() NOT NULL,
  active_to timestamp without time zone DEFAULT (now() + '1 year'::interval) NOT NULL,
  created_by uuid,
  updated_on timestamp without time zone,
  updated_by uuid,
  password character varying(256) NOT NULL
);

  ALTER TABLE ONLY user_management.authorities ALTER COLUMN id SET DEFAULT nextval('user_management.authorities_id_seq'::regclass);


--
  -- Name: authority_authority_mappings id; Type: DEFAULT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.authority_authority_mappings ALTER COLUMN id SET DEFAULT nextval('user_management.authority_authority_mappings_id_seq'::regclass);


--
  -- Name: tmp_authority_authority_mappings id; Type: DEFAULT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.tmp_authority_authority_mappings ALTER COLUMN id SET DEFAULT nextval('user_management.tmp_authority_authority_mappings_id_seq'::regclass);


--
  -- Name: authorities authorities_endpoint_method_service_key; Type: CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.authorities
ADD CONSTRAINT authorities_endpoint_method_service_key UNIQUE (endpoint, method, service);


--
  -- Name: authorities authorities_name_service_key; Type: CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.authorities
ADD CONSTRAINT authorities_name_service_key UNIQUE (name, service);


--
  -- Name: authority_authority_mappings authority_authority_mappings_parent_id_child_id_key; Type: CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.authority_authority_mappings
ADD CONSTRAINT authority_authority_mappings_parent_id_child_id_key UNIQUE (parent_id, child_id);


--
  -- Name: authorities pk_authorities; Type: CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.authorities
ADD CONSTRAINT pk_authorities PRIMARY KEY (id);


--
  -- Name: authority_authority_mappings pk_authority_authority_mappings; Type: CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.authority_authority_mappings
ADD CONSTRAINT pk_authority_authority_mappings PRIMARY KEY (id);


--
  -- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.databasechangeloglock
ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
  -- Name: role_authority_mappings pk_role_authority_mappings; Type: CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.role_authority_mappings
ADD CONSTRAINT pk_role_authority_mappings PRIMARY KEY (id);


--
  -- Name: roles pk_roles; Type: CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.roles
ADD CONSTRAINT pk_roles PRIMARY KEY (id);


--
  -- Name: tmp_authority_authority_mappings pk_tmp_authority_authority_mappings; Type: CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.tmp_authority_authority_mappings
ADD CONSTRAINT pk_tmp_authority_authority_mappings PRIMARY KEY (id);


--
  -- Name: user_role_mappings pk_user_role_mappings; Type: CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.user_role_mappings
ADD CONSTRAINT pk_user_role_mappings PRIMARY KEY (id);


--
  -- Name: users pk_users; Type: CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.users
ADD CONSTRAINT pk_users PRIMARY KEY (id);


--
  -- Name: role_authority_mappings role_authority_mappings_role_id_authority_id_key; Type: CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.role_authority_mappings
ADD CONSTRAINT role_authority_mappings_role_id_authority_id_key UNIQUE (role_id, authority_id);


--
  -- Name: roles roles_name_organisation_id_key; Type: CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.roles
ADD CONSTRAINT roles_name_organisation_id_key UNIQUE (name, organisation_id);


--
  -- Name: tmp_authority_authority_mappings tmp_authority_authority_mappi_authority_parent_service_pare_key; Type: CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.tmp_authority_authority_mappings
ADD CONSTRAINT tmp_authority_authority_mappi_authority_parent_service_pare_key UNIQUE (authority_parent, service_parent, authority_child, service_child);


--
  -- Name: user_role_mappings user_role_mappings_user_id_role_id_key; Type: CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.user_role_mappings
ADD CONSTRAINT user_role_mappings_user_id_role_id_key UNIQUE (user_id, role_id);


--
  -- Name: users users_login_name_key; Type: CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.users
ADD CONSTRAINT users_login_name_key UNIQUE (login_name);


--
  -- Name: authority_authority_mappings fk_aam_child; Type: FK CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.authority_authority_mappings
ADD CONSTRAINT fk_aam_child FOREIGN KEY (child_id) REFERENCES user_management.authorities(id) ON DELETE CASCADE;


--
  -- Name: authority_authority_mappings fk_aam_parent; Type: FK CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.authority_authority_mappings
ADD CONSTRAINT fk_aam_parent FOREIGN KEY (parent_id) REFERENCES user_management.authorities(id) ON DELETE CASCADE;


--
  -- Name: role_authority_mappings fk_ram_authority; Type: FK CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.role_authority_mappings
ADD CONSTRAINT fk_ram_authority FOREIGN KEY (authority_id) REFERENCES user_management.authorities(id) ON DELETE CASCADE;


--
  -- Name: role_authority_mappings fk_ram_role; Type: FK CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.role_authority_mappings
ADD CONSTRAINT fk_ram_role FOREIGN KEY (role_id) REFERENCES user_management.roles(id) ON DELETE CASCADE;


--
  -- Name: user_role_mappings fk_urm_role; Type: FK CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.user_role_mappings
ADD CONSTRAINT fk_urm_role FOREIGN KEY (role_id) REFERENCES user_management.roles(id) ON DELETE CASCADE;


--
  -- Name: user_role_mappings fk_urm_user; Type: FK CONSTRAINT; Schema: user_management; Owner: postgres
--

  ALTER TABLE ONLY user_management.user_role_mappings
ADD CONSTRAINT fk_urm_user FOREIGN KEY (user_id) REFERENCES user_management.users(id) ON DELETE CASCADE;


--
  -- PostgreSQL database dump complete
--
