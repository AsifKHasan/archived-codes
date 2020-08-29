CREATE TABLE inventory.tbl_attribute_setup (
  as_id uuid NOT NULL,
  cat_id uuid,
  att_name character varying(100),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_attribute_value_setup (
  avs_id uuid NOT NULL,
  as_id uuid NOT NULL,
  att_value character varying(100) NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_categories (
  category_id uuid NOT NULL,
  cat_name character varying(50) NOT NULL,
  cat_description character varying(250) NOT NULL,
  status boolean NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  is_trackable boolean NOT NULL,
  accounts_category character varying(20) NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_committee (
  committee_id uuid NOT NULL,
  ct_id uuid NOT NULL,
  authorised_by uuid NOT NULL,
  approved_by uuid NOT NULL,
  committee_name character varying(100) NOT NULL,
  min_no_member character varying(50) NOT NULL,
  max_no_member character varying(50) NOT NULL,
  forming_date timestamp without time zone NOT NULL,
  purpose character varying(200),
  comments character varying(200),
  status boolean NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_committee_details (
  qcd_id uuid NOT NULL,
  committee_id uuid NOT NULL,
  emp_id uuid NOT NULL,
  emp_roles character varying(200) NOT NULL,
  comments character varying(200),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_committee_type (
  ct_id uuid,
  ct_name character varying(100) NOT NULL,
  ct_ref_no character varying(100) NOT NULL,
  status boolean NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  owned_by uuid NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_common_attachment (
  common_attachment_id uuid NOT NULL,
  file_title character varying(255) NOT NULL,
  file_id character varying(255) NOT NULL,
  file_path character varying(255) NOT NULL,
  transaction_type character varying(50) NOT NULL,
  transaction_id uuid NOT NULL,
  owned_by uuid NOT NULL,
  employee_id uuid,
  org_id uuid,
  created_date timestamp without time zone,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_damage_item_details (
  did_id uuid NOT NULL,
  damage_item_requisition_id uuid NOT NULL,
  item_id uuid NOT NULL,
  unit_id uuid NOT NULL,
  damage_qty integer NOT NULL,
  committee_approved_qty integer,
  approved_qty integer,
  committee_item_approval boolean,
  item_approval boolean,
  committee_comments character varying(200),
  approval_comments character varying(200),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_damage_requisition (
  damage_item_requisition_id uuid NOT NULL,
  initiated_by uuid NOT NULL,
  store_id uuid NOT NULL,
  committee_id uuid,
  committee_comments character varying(250),
  damage_ref_no character varying(50),
  damage_requisition_date timestamp without time zone NOT NULL,
  damage_justification character varying(200),
  approved_by uuid,
  approval_date timestamp without time zone,
  approval_comments character varying(250),
  status character varying(50) NOT NULL,
  is_complete boolean NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_direct_stock_in (
  dsi_id uuid NOT NULL,
  store_id uuid NOT NULL,
  item_id uuid NOT NULL,
  unit_id uuid NOT NULL,
  opening_qty integer NOT NULL,
  item_rate double precision,
  comments character varying(200),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  approved_by uuid NOT NULL,
  approval_date timestamp without time zone NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_direct_stock_out (
  dso_id uuid NOT NULL,
  store_id uuid NOT NULL,
  item_id uuid NOT NULL,
  unit_id uuid NOT NULL,
  opening_qty integer NOT NULL,
  item_rate double precision,
  comments character varying(200),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  approved_by uuid NOT NULL,
  approval_date timestamp without time zone NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_donation_handover_details (
  dhd_id uuid NOT NULL,
  item_donation_handover_id uuid NOT NULL,
  item_id uuid NOT NULL,
  unit_id uuid NOT NULL,
  received_qty integer NOT NULL,
  accepted_qty integer,
  item_approval boolean,
  comments character varying(200),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_gate_pass (
  id uuid NOT NULL,
  gate_pass_ref character varying(100) NOT NULL,
  office_id uuid NOT NULL,
  gate_pass_date date NOT NULL,
  store_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  employee_name character varying(100) NOT NULL,
  remarks character varying(200),
  owned_by uuid NOT NULL,
  created_date date NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_gate_pass_file (
  id uuid NOT NULL,
  file_name character varying(100) NOT NULL,
  file_id character varying(150) NOT NULL,
  upload_date date NOT NULL,
  gate_pass_id uuid NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_gate_pass_item (
  id uuid NOT NULL,
  item_id uuid NOT NULL,
  quantity integer NOT NULL,
  unit_id uuid NOT NULL,
  gate_pass_id uuid NOT NULL,
  created_date date NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_item_donation_handover (
  item_donation_handover_id uuid NOT NULL,
  item_donation_handover_ref_no character varying(50),
  received_by_id uuid NOT NULL,
  store_id uuid NOT NULL,
  donor_id uuid,
  project_id uuid,
  handover_donation_tag character varying(30) NOT NULL,
  receiving_date timestamp without time zone NOT NULL,
  purpose character varying(200),
  approved_committee uuid,
  committee_comments character varying(200),
  approval_date timestamp without time zone,
  status character varying(50) NOT NULL,
  is_complete boolean NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_item_in_out (
  item_in_out_id uuid NOT NULL,
  item_id uuid NOT NULL,
  item_category_id uuid,
  item_unit_id uuid,
  in_qty integer,
  out_qty integer,
  created_date date,
  transaction_type character varying(50),
  transaction_id uuid,
  store_id uuid,
  fiscal_year_id uuid,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_item_issue_receive (
  item_issue_receive_id uuid NOT NULL,
  item_requisition_id uuid NOT NULL,
  issued_to uuid NOT NULL,
  issued_by uuid NOT NULL,
  issue_receive_ref_no character varying(50) NOT NULL,
  store_id uuid NOT NULL,
  iir_date timestamp without time zone NOT NULL,
  remarks character varying(200),
  received_by uuid NOT NULL,
  issued_date timestamp without time zone NOT NULL,
  status character varying(50) NOT NULL,
  is_complete boolean NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_item_issue_receive_details (
  iird_id uuid NOT NULL,
  item_issue_receive_id uuid NOT NULL,
  item_id uuid NOT NULL,
  unit_id uuid NOT NULL,
  approved_qty integer NOT NULL,
  issued_qty integer NOT NULL,
  return_qty integer NOT NULL,
  item_issued boolean NOT NULL,
  comments character varying(200),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_item_issue_return (
  item_issue_return_id uuid NOT NULL,
  item_requisition_id uuid NOT NULL,
  item_issue_receive_id uuid NOT NULL,
  accepted_by uuid,
  returned_by uuid,
  issue_return_ref_no character varying(50) NOT NULL,
  store_id uuid NOT NULL,
  return_date timestamp without time zone NOT NULL,
  remarks character varying(200),
  status character varying(50) NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_item_issue_return_details (
  item_issue_return_details_id uuid NOT NULL,
  item_issue_return_id uuid NOT NULL,
  item_id uuid NOT NULL,
  unit_id uuid NOT NULL,
  approved_qty integer NOT NULL,
  issued_qty integer NOT NULL,
  return_qty integer NOT NULL,
  comments character varying(200),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_item_receive (
  id uuid NOT NULL,
  reference_number character varying(100),
  text character varying(100),
  porder_number character varying(100),
  purchase_date date,
  purchase_type character varying(500),
  gorder_number character varying(500),
  invoice_number character varying(500),
  chalan_number character varying(500),
  remarks character varying(500),
  committee_comment character varying(500),
  receiving_date date,
  status integer,
  fiscal_year_id uuid,
  committee_id uuid,
  is_deleted boolean DEFAULT false,
  vendor_id uuid,
  store_id uuid,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL
);

  CREATE TABLE inventory.tbl_item_receive_details (
  id uuid NOT NULL,
  quantity integer,
  accepted_quantity integer,
  comment character varying(500),
  item_id uuid,
  receiving_unit_id uuid,
  category_id uuid,
  item_receive_id uuid,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  user_id uuid,
  employee_id uuid,
  proxy_user_id uuid,
  org_id uuid,
  rate double precision
);

  CREATE TABLE inventory.tbl_item_requisition (
  item_requisition_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  store_id uuid NOT NULL,
  project_id uuid,
  event_id uuid,
  meeting_id uuid,
  requisition_ref_no character varying(50),
  requisition_date timestamp without time zone NOT NULL,
  remarks character varying(200),
  approved_by uuid NOT NULL,
  approval_date timestamp without time zone NOT NULL,
  status character varying(50) NOT NULL,
  is_complete boolean NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid
);

  CREATE TABLE inventory.tbl_item_requisition_details (
  ird_id uuid NOT NULL,
  ir_id uuid NOT NULL,
  item_id uuid NOT NULL,
  unit_id uuid NOT NULL,
  required_qty integer NOT NULL,
  approved_qty integer NOT NULL,
  item_approval boolean NOT NULL,
  comments character varying(200),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_item_setup (
  item_id uuid NOT NULL,
  cat_id uuid NOT NULL,
  unit_id uuid NOT NULL,
  store_id uuid,
  itspec_id uuid,
  item_name character varying(100) NOT NULL,
  item_code character varying(100) NOT NULL,
  depreciation_rate double precision,
  maintanance_cost double precision,
  hscode character varying(100),
  sub_ledger_account_code integer,
  maintain_as character varying(50) NOT NULL,
  storing_temperature double precision,
  storing_temperature_unit uuid,
  life_time double precision,
  life_time_unit uuid,
  item_status boolean NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_item_specification (
  item_spec_id uuid NOT NULL,
  item_id uuid NOT NULL,
  spec_name character varying(100) NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_item_specification_details (
  item_spec_details_id uuid,
  item_spec_id uuid NOT NULL,
  avs_id uuid NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_item_stock (
  item_stock_id uuid NOT NULL,
  item_id uuid,
  opening_qty integer NOT NULL,
  current_qty integer NOT NULL,
  damage_qty integer NOT NULL,
  stock_date timestamp without time zone,
  store_id uuid,
  fiscal_year_id uuid,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_item_stock_history (
  id integer NOT NULL,
  item_id uuid,
  store_id uuid,
  opening_qty integer NOT NULL,
  current_qty integer NOT NULL,
  damage_qty integer NOT NULL,
  stock_date timestamp without time zone NOT NULL,
  history_date timestamp without time zone NOT NULL,
  fiscal_year_id uuid
);

  CREATE SEQUENCE inventory.tbl_item_stock_history_id_seq
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

  ALTER SEQUENCE inventory.tbl_item_stock_history_id_seq OWNED BY inventory.tbl_item_stock_history.id;


--
  -- Name: tbl_item_transfer; Type: TABLE; Schema: inventory; Owner: postgres
--

  CREATE TABLE inventory.tbl_item_transfer (
  item_transfer_id uuid NOT NULL,
  transfer_type_id character varying(50),
  store_ref_id uuid,
  donor_ref_id uuid,
  project_ref_id uuid,
  to_store_id uuid,
  authorised_by_id uuid,
  committee_id uuid,
  committee_comments character varying(250),
  transfer_ref_no character varying(50),
  transfer_date timestamp without time zone NOT NULL,
  remarks character varying(200),
  approved_by uuid,
  approval_date timestamp without time zone,
  transfer_tag character varying(50),
  status character varying(50) NOT NULL,
  is_complete boolean NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_item_transfer_details (
  transfer_detail_id uuid NOT NULL,
  item_transfer_id uuid NOT NULL,
  item_id uuid,
  unit_id uuid,
  category_id uuid,
  transfer_qty integer,
  accepted_qty integer,
  approved_qty integer,
  item_approval boolean,
  comments character varying(200),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_opening_stock (
  os_id uuid NOT NULL,
  store_id uuid NOT NULL,
  item_id uuid NOT NULL,
  unit_id uuid NOT NULL,
  opening_qty integer NOT NULL,
  item_rate double precision,
  comments character varying(200),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_parent_unit (
  parent_id uuid NOT NULL,
  parent_name character varying(50) NOT NULL,
  status boolean NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_physical_inventory (
  physical_inventory_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  store_id uuid NOT NULL,
  project_id uuid,
  reference_no character varying(50),
  investigating_officer_id uuid,
  inspection_date timestamp without time zone,
  remarks character varying(200),
  approved_by uuid,
  approval_date timestamp without time zone,
  status character varying(50),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  fiscal_year_id uuid
);

  CREATE TABLE inventory.tbl_physical_inventory_details (
  physical_inventory_details_id uuid NOT NULL,
  physical_inventory_id uuid NOT NULL,
  item_id uuid NOT NULL,
  unit_id uuid NOT NULL,
  physical_qty integer NOT NULL,
  inventory_qty integer NOT NULL,
  approved_qty integer NOT NULL,
  comments character varying(200),
  owned_by uuid NOT NULL,
  org_id uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_purchase_requisition (
  purchase_requisition_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  store_id uuid NOT NULL,
  purchase_requisition_ref_no character varying(50),
  purchase_requisition_date timestamp without time zone NOT NULL,
  remarks character varying(200),
  approved_by uuid NOT NULL,
  approval_date timestamp without time zone NOT NULL,
  status character varying(50) NOT NULL,
  is_complete boolean NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid
);

  CREATE TABLE inventory.tbl_purchase_requisition_details (
  prd_id uuid NOT NULL,
  pr_id uuid NOT NULL,
  item_id uuid NOT NULL,
  unit_id uuid NOT NULL,
  required_qty integer NOT NULL,
  approved_qty integer NOT NULL,
  item_approval boolean NOT NULL,
  comments character varying(200),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_reorder_level (
  reorderlevel_id uuid NOT NULL,
  store_id uuid NOT NULL,
  item_id uuid NOT NULL,
  cat_id uuid NOT NULL,
  unit_id uuid NOT NULL,
  reorder_level integer NOT NULL,
  low_level integer NOT NULL,
  high_level integer,
  remarks character varying(200),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_store (
  store_id uuid NOT NULL,
  organisation_id uuid NOT NULL,
  store_in_charge uuid NOT NULL,
  store_keeper uuid NOT NULL,
  store_name character varying(100) NOT NULL,
  store_location character varying(100) NOT NULL,
  store_code character varying(100) NOT NULL,
  store_status boolean NOT NULL,
  opening_date timestamp without time zone NOT NULL,
  comment character varying(50),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid,
  project_id uuid
);

  CREATE TABLE inventory.tbl_store_item_issue_receive (
  store_item_issue_receive_id uuid NOT NULL,
  store_item_requisition_id uuid NOT NULL,
  store_keeper_id uuid NOT NULL,
  store_incharge_id uuid NOT NULL,
  from_store_id uuid,
  to_store_id uuid,
  issue_receive_ref_no character varying(50),
  issued_date timestamp without time zone NOT NULL,
  remarks character varying(200),
  issued_by uuid,
  status character varying(50) NOT NULL,
  is_complete boolean NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_store_item_issue_receive_details (
  siird_id uuid NOT NULL,
  siir_id uuid NOT NULL,
  item_id uuid NOT NULL,
  unit_id uuid NOT NULL,
  issued_qty integer NOT NULL,
  previous_issued_qty integer,
  approved_qty integer NOT NULL,
  item_approval boolean NOT NULL,
  comments character varying(200),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_store_item_requisition (
  store_item_requisition_id uuid NOT NULL,
  store_keeper_id uuid NOT NULL,
  store_incharge_id uuid NOT NULL,
  from_store_id uuid,
  to_store_id uuid,
  requisition_ref_no character varying(50),
  requisition_date timestamp without time zone NOT NULL,
  remarks character varying(200),
  approved_by uuid,
  approval_date timestamp without time zone,
  status character varying(50) NOT NULL,
  is_complete boolean NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_store_item_requisition_details (
  sird_id uuid NOT NULL,
  sir_id uuid NOT NULL,
  item_id uuid NOT NULL,
  unit_id uuid NOT NULL,
  required_qty integer NOT NULL,
  approved_qty integer NOT NULL,
  item_approval boolean NOT NULL,
  comments character varying(200),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_store_item_transfer (
  store_item_transfer_id uuid NOT NULL,
  store_keeper_id uuid NOT NULL,
  store_incharge_id uuid NOT NULL,
  from_store_id uuid,
  to_store_id uuid,
  transfer_ref_no character varying(50),
  transfer_date timestamp without time zone NOT NULL,
  transfer_status character varying(50),
  remarks character varying(200),
  approved_by uuid,
  approval_date timestamp without time zone,
  received_by uuid,
  received_date timestamp without time zone,
  status character varying(50) NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_store_item_transfer_details (
  store_item_transfer_details_id uuid NOT NULL,
  store_item_transfer_id uuid NOT NULL,
  item_id uuid NOT NULL,
  unit_id uuid NOT NULL,
  transfer_qty integer NOT NULL,
  approved_qty integer NOT NULL,
  received_qty integer NOT NULL,
  comments character varying(200),
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE inventory.tbl_transfer_type (
  tt_id uuid NOT NULL,
  tt_name character varying(100) NOT NULL,
  comment character varying(100),
  status boolean NOT NULL,
  referance_no character varying(100) NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE TABLE inventory.tbl_unit (
  unit_id uuid NOT NULL,
  unit_name character varying(100) NOT NULL,
  unit_code character varying(50) NOT NULL,
  parent_unit uuid,
  status boolean NOT NULL,
  conversion_rate character varying(50) NOT NULL,
  owned_by uuid NOT NULL,
  created_date timestamp without time zone NOT NULL,
  is_deleted boolean NOT NULL,
  org_id uuid,
  employee_id uuid
);

  CREATE VIEW inventory.view_item_opening_stock AS
SELECT tbl_item_setup.item_id,
  tbl_item_setup.item_name,
  tbl_categories.category_id,
  tbl_categories.cat_name,
  tbl_unit.unit_id,
  tbl_unit.unit_name,
  tbl_store.store_id,
  tbl_store.store_name
FROM ((((inventory.tbl_item_setup
JOIN inventory.tbl_opening_stock ON ((tbl_opening_stock.item_id = tbl_item_setup.item_id)))
JOIN inventory.tbl_categories ON ((tbl_categories.category_id = tbl_item_setup.cat_id)))
JOIN inventory.tbl_unit ON ((tbl_unit.unit_id = tbl_item_setup.unit_id)))
JOIN inventory.tbl_store ON ((tbl_store.store_id = tbl_opening_stock.store_id)));

  ALTER TABLE ONLY inventory.tbl_item_stock_history ALTER COLUMN id SET DEFAULT nextval('inventory.tbl_item_stock_history_id_seq'::regclass);


--
  -- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.databasechangeloglock
ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
  -- Name: tbl_attribute_setup pk_tbl_attribute_setup; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_attribute_setup
ADD CONSTRAINT pk_tbl_attribute_setup PRIMARY KEY (as_id);


--
  -- Name: tbl_attribute_value_setup pk_tbl_attribute_value_setup; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_attribute_value_setup
ADD CONSTRAINT pk_tbl_attribute_value_setup PRIMARY KEY (avs_id);


--
  -- Name: tbl_categories pk_tbl_categories; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_categories
ADD CONSTRAINT pk_tbl_categories PRIMARY KEY (category_id);


--
  -- Name: tbl_committee pk_tbl_committee; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_committee
ADD CONSTRAINT pk_tbl_committee PRIMARY KEY (committee_id);


--
  -- Name: tbl_committee_details pk_tbl_committee_details; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_committee_details
ADD CONSTRAINT pk_tbl_committee_details PRIMARY KEY (qcd_id);


--
  -- Name: tbl_common_attachment pk_tbl_common_attachment; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_common_attachment
ADD CONSTRAINT pk_tbl_common_attachment PRIMARY KEY (common_attachment_id);


--
  -- Name: tbl_damage_item_details pk_tbl_damage_item_details; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_damage_item_details
ADD CONSTRAINT pk_tbl_damage_item_details PRIMARY KEY (did_id);


--
  -- Name: tbl_damage_requisition pk_tbl_damage_requisition; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_damage_requisition
ADD CONSTRAINT pk_tbl_damage_requisition PRIMARY KEY (damage_item_requisition_id);


--
  -- Name: tbl_direct_stock_in pk_tbl_direct_stock_in; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_direct_stock_in
ADD CONSTRAINT pk_tbl_direct_stock_in PRIMARY KEY (dsi_id);


--
  -- Name: tbl_direct_stock_out pk_tbl_direct_stock_out; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_direct_stock_out
ADD CONSTRAINT pk_tbl_direct_stock_out PRIMARY KEY (dso_id);


--
  -- Name: tbl_donation_handover_details pk_tbl_donation_handover_details; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_donation_handover_details
ADD CONSTRAINT pk_tbl_donation_handover_details PRIMARY KEY (dhd_id);


--
  -- Name: tbl_gate_pass pk_tbl_gate_pass; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_gate_pass
ADD CONSTRAINT pk_tbl_gate_pass PRIMARY KEY (id);


--
  -- Name: tbl_gate_pass_file pk_tbl_gate_pass_file; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_gate_pass_file
ADD CONSTRAINT pk_tbl_gate_pass_file PRIMARY KEY (id);


--
  -- Name: tbl_gate_pass_item pk_tbl_gate_pass_item; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_gate_pass_item
ADD CONSTRAINT pk_tbl_gate_pass_item PRIMARY KEY (id);


--
  -- Name: tbl_item_donation_handover pk_tbl_item_donation_handover; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_donation_handover
ADD CONSTRAINT pk_tbl_item_donation_handover PRIMARY KEY (item_donation_handover_id);


--
  -- Name: tbl_item_in_out pk_tbl_item_in_out; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_in_out
ADD CONSTRAINT pk_tbl_item_in_out PRIMARY KEY (item_in_out_id);


--
  -- Name: tbl_item_issue_receive pk_tbl_item_issue_receive; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_issue_receive
ADD CONSTRAINT pk_tbl_item_issue_receive PRIMARY KEY (item_issue_receive_id);


--
  -- Name: tbl_item_issue_receive_details pk_tbl_item_issue_receive_details; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_issue_receive_details
ADD CONSTRAINT pk_tbl_item_issue_receive_details PRIMARY KEY (iird_id);


--
  -- Name: tbl_item_issue_return pk_tbl_item_issue_return; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_issue_return
ADD CONSTRAINT pk_tbl_item_issue_return PRIMARY KEY (item_issue_return_id);


--
  -- Name: tbl_item_issue_return_details pk_tbl_item_issue_return_details; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_issue_return_details
ADD CONSTRAINT pk_tbl_item_issue_return_details PRIMARY KEY (item_issue_return_details_id);


--
  -- Name: tbl_item_receive pk_tbl_item_receive; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_receive
ADD CONSTRAINT pk_tbl_item_receive PRIMARY KEY (id);


--
  -- Name: tbl_item_receive_details pk_tbl_item_receive_details; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_receive_details
ADD CONSTRAINT pk_tbl_item_receive_details PRIMARY KEY (id);


--
  -- Name: tbl_item_requisition pk_tbl_item_requisition; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_requisition
ADD CONSTRAINT pk_tbl_item_requisition PRIMARY KEY (item_requisition_id);


--
  -- Name: tbl_item_requisition_details pk_tbl_item_requisition_details; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_requisition_details
ADD CONSTRAINT pk_tbl_item_requisition_details PRIMARY KEY (ird_id);


--
  -- Name: tbl_item_setup pk_tbl_item_setup; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_setup
ADD CONSTRAINT pk_tbl_item_setup PRIMARY KEY (item_id);


--
  -- Name: tbl_item_specification pk_tbl_item_specification; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_specification
ADD CONSTRAINT pk_tbl_item_specification PRIMARY KEY (item_spec_id);


--
  -- Name: tbl_item_stock pk_tbl_item_stock; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_stock
ADD CONSTRAINT pk_tbl_item_stock PRIMARY KEY (item_stock_id);


--
  -- Name: tbl_item_stock_history pk_tbl_item_stock_history; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_stock_history
ADD CONSTRAINT pk_tbl_item_stock_history PRIMARY KEY (id);


--
  -- Name: tbl_item_transfer pk_tbl_item_transfer; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_transfer
ADD CONSTRAINT pk_tbl_item_transfer PRIMARY KEY (item_transfer_id);


--
  -- Name: tbl_item_transfer_details pk_tbl_item_transfer_details; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_transfer_details
ADD CONSTRAINT pk_tbl_item_transfer_details PRIMARY KEY (transfer_detail_id);


--
  -- Name: tbl_opening_stock pk_tbl_opening_stock; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_opening_stock
ADD CONSTRAINT pk_tbl_opening_stock PRIMARY KEY (os_id);


--
  -- Name: tbl_parent_unit pk_tbl_parent_unit; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_parent_unit
ADD CONSTRAINT pk_tbl_parent_unit PRIMARY KEY (parent_id);


--
  -- Name: tbl_physical_inventory pk_tbl_physical_inventory; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_physical_inventory
ADD CONSTRAINT pk_tbl_physical_inventory PRIMARY KEY (physical_inventory_id);


--
  -- Name: tbl_physical_inventory_details pk_tbl_physical_inventory_details; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_physical_inventory_details
ADD CONSTRAINT pk_tbl_physical_inventory_details PRIMARY KEY (physical_inventory_details_id);


--
  -- Name: tbl_purchase_requisition pk_tbl_purchase_requisition; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_purchase_requisition
ADD CONSTRAINT pk_tbl_purchase_requisition PRIMARY KEY (purchase_requisition_id);


--
  -- Name: tbl_purchase_requisition_details pk_tbl_purchase_requisition_details; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_purchase_requisition_details
ADD CONSTRAINT pk_tbl_purchase_requisition_details PRIMARY KEY (prd_id);


--
  -- Name: tbl_reorder_level pk_tbl_reorder_level; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_reorder_level
ADD CONSTRAINT pk_tbl_reorder_level PRIMARY KEY (reorderlevel_id);


--
  -- Name: tbl_store pk_tbl_store; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_store
ADD CONSTRAINT pk_tbl_store PRIMARY KEY (store_id);


--
  -- Name: tbl_store_item_issue_receive pk_tbl_store_item_issue_receive; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_store_item_issue_receive
ADD CONSTRAINT pk_tbl_store_item_issue_receive PRIMARY KEY (store_item_issue_receive_id);


--
  -- Name: tbl_store_item_issue_receive_details pk_tbl_store_item_issue_receive_details; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_store_item_issue_receive_details
ADD CONSTRAINT pk_tbl_store_item_issue_receive_details PRIMARY KEY (siird_id);


--
  -- Name: tbl_store_item_requisition pk_tbl_store_item_requisition; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_store_item_requisition
ADD CONSTRAINT pk_tbl_store_item_requisition PRIMARY KEY (store_item_requisition_id);


--
  -- Name: tbl_store_item_requisition_details pk_tbl_store_item_requisition_details; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_store_item_requisition_details
ADD CONSTRAINT pk_tbl_store_item_requisition_details PRIMARY KEY (sird_id);


--
  -- Name: tbl_store_item_transfer pk_tbl_store_item_transfer; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_store_item_transfer
ADD CONSTRAINT pk_tbl_store_item_transfer PRIMARY KEY (store_item_transfer_id);


--
  -- Name: tbl_store_item_transfer_details pk_tbl_store_item_transfer_details; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_store_item_transfer_details
ADD CONSTRAINT pk_tbl_store_item_transfer_details PRIMARY KEY (store_item_transfer_details_id);


--
  -- Name: tbl_transfer_type pk_tbl_transfer_type; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_transfer_type
ADD CONSTRAINT pk_tbl_transfer_type PRIMARY KEY (tt_id);


--
  -- Name: tbl_unit pk_tbl_unit; Type: CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_unit
ADD CONSTRAINT pk_tbl_unit PRIMARY KEY (unit_id);


--
  -- Name: tbl_item_receive_details item_receive_details; Type: FK CONSTRAINT; Schema: inventory; Owner: postgres
--

  ALTER TABLE ONLY inventory.tbl_item_receive_details
ADD CONSTRAINT item_receive_details FOREIGN KEY (item_receive_id) REFERENCES inventory.tbl_item_receive(id);


--
  -- PostgreSQL database dump complete
--

