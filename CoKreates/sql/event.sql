CREATE TABLE event.tbl_budget_details (
  id uuid NOT NULL,
  expense_code character varying(500),
  expense_head character varying(500),
  estimated_expense double precision,
  justification character varying(500),
  approved_expense double precision,
  budget_justification character varying(1500),
  actual_expense double precision,
  expense_justification character varying(1500),
  bill_attachment character varying(1500),
  type character varying(1500),
  budget_id uuid,
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  is_deleted boolean,
  created_by character varying(100),
  last_modified_by character varying(100)
);

  CREATE TABLE event.tbl_budgets (
  id uuid NOT NULL,
  budget_date timestamp without time zone,
  remarks character varying(500),
  approval_status integer,
  approval_comment character varying(1500),
  event_id uuid,
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  is_deleted boolean,
  created_by character varying(100),
  last_modified_by character varying(100)
);

  CREATE TABLE event.tbl_event_guests (
  id uuid NOT NULL,
  guest_type character varying(500),
  guest_name character varying(500) NOT NULL,
  designation character varying(500),
  organization character varying(500),
  "pictureFile" character varying(500),
  email character varying(500),
  phone_number character varying(500),
  nid character varying(500),
  passport character varying(500),
  arrival_time timestamp without time zone,
  departure_time timestamp without time zone,
  accommodation character varying(500),
  picture_file character varying(500),
  country_id uuid,
  event_id uuid NOT NULL,
  event_role_id uuid NOT NULL,
  status integer,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  is_deleted boolean,
  created_by character varying(100),
  last_modified_by character varying(100),
  notified boolean,
  user_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  guest_employee_id uuid
);

  CREATE TABLE event.tbl_events (
  id uuid NOT NULL,
  title character varying(500) NOT NULL,
  reference_number character varying(500),
  description character varying(500),
  background character varying(500),
  source character varying(500),
  phase character varying(500),
  event_chair_name character varying(500),
  event_chair_employee_id uuid,
  event_reporter_name character varying(500),
  event_reporter_employee_id uuid,
  event_convener_name character varying(500),
  event_convener_employee_id uuid,
  start_date timestamp without time zone,
  end_date timestamp without time zone,
  status integer,
  file_title character varying(500),
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  is_deleted boolean,
  created_by character varying(100),
  last_modified_by character varying(100),
  closing_date timestamp without time zone,
  executive_summary character varying(5000),
  report_title character varying(5000),
  report_description character varying(5000),
  report_file character varying(500),
  finalized_comment character varying(500),
  finalized integer DEFAULT 0,
  cancel integer DEFAULT 0,
  cancel_reason character varying(500),
  event_type_id uuid,
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL
);

  CREATE VIEW event.dashboard AS
SELECT tbl_events.id,
  tbl_events.title,
  tbl_events.description,
  tbl_events.phase,
  tbl_events.background,
  tbl_events.start_date,
  tbl_events.end_date,
  tbl_events.status,
  tbl_events.closing_date,
  tbl_events.executive_summary,
  tbl_events.finalized_comment,
  tbl_events.finalized,
  tbl_events.cancel,
  tbl_events.cancel_reason,
  tbl_events.event_type_id,
  tbl_events.org_id,
  guests.total_guest,
  budgets.total_est_expense,
  budgets.total_actual_expense
FROM ((event.tbl_events
LEFT JOIN ( SELECT tbl_event_guests.event_id,
count(*) AS total_guest
FROM event.tbl_event_guests
GROUP BY tbl_event_guests.event_id) guests ON ((tbl_events.id = guests.event_id)))
LEFT JOIN ( SELECT tbl_budgets.event_id,
  sum(tbl_budget_details.estimated_expense) AS total_est_expense,
  sum(tbl_budget_details.approved_expense) AS total_actual_expense
FROM (event.tbl_budget_details
JOIN event.tbl_budgets ON ((tbl_budgets.id = tbl_budget_details.budget_id)))
GROUP BY tbl_budgets.event_id) budgets ON ((tbl_events.id = budgets.event_id)));

  CREATE TABLE event.databasechangelog (
  id character varying(255) NOT NULL,
  author character varying(255) NOT NULL,
  filename character varying(255) NOT NULL,
  dateexecuted timestamp without time zone NOT NULL,
  orderexecuted integer NOT NULL,
  exectype character varying(10) NOT NULL,
  md5sum character varying(35),
  description character varying(255),
  comments character varying(255),
  tag character varying(255),
  liquibase character varying(20),
  contexts character varying(255),
  labels character varying(255),
  deployment_id character varying(10)
);

  CREATE TABLE event.databasechangeloglock (
  id integer NOT NULL,
  locked boolean NOT NULL,
  lockgranted timestamp without time zone,
  lockedby character varying(255)
);

  CREATE TABLE event.tbl_event_schedules (
  id uuid NOT NULL,
  session_date timestamp without time zone,
  day_no integer,
  session_name character varying(500),
  start_time timestamp without time zone,
  end_time timestamp without time zone,
  topics character varying(500),
  floor_room character varying(500),
  description character varying(500),
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  is_deleted boolean,
  event_id uuid NOT NULL,
  event_venue_id uuid NOT NULL,
  created_by character varying(100),
  last_modified_by character varying(100),
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL,
  conflicted boolean
);

  CREATE TABLE event.tbl_event_venues (
  id uuid NOT NULL,
  from_date timestamp without time zone NOT NULL,
  to_date timestamp without time zone NOT NULL,
  status integer,
  comments character varying(500),
  conditions character varying(500),
  venue_booking_employee_name character varying(500),
  venue_booking_employee_id uuid,
  booking_date timestamp without time zone,
  cost double precision,
  advance double precision,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  is_deleted boolean,
  event_id uuid NOT NULL,
  venue_id uuid NOT NULL,
  created_by character varying(100),
  last_modified_by character varying(100),
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL,
  conflicted boolean
);

  CREATE VIEW event.event_list AS
SELECT sc.event_id AS id,
  bc.title,
  bc.start_date,
  bc.end_date,
  sc.schedule_conflict,
  bc.venue_conflict,
  bc.org_id,
  bc.employee_id,
  bc.user_id,
  bc.status,
  bc.phase,
  bc.finalized,
  bc.cancel
FROM (( SELECT t.event_id,
  sum(t.cnt_conflict) AS schedule_conflict
FROM ( SELECT v.event_id,
  CASE
WHEN ((s.session_date < v.from_date) OR (s.session_date > v.to_date)) THEN count(*)
ELSE (0)::bigint
END AS cnt_conflict
FROM (event.tbl_event_venues v
LEFT JOIN event.tbl_event_schedules s ON (((v.id = s.event_venue_id) AND ((s.session_date < v.from_date) OR (s.session_date > v.to_date)))))
GROUP BY v.event_id, s.session_date, v.from_date, v.to_date) t
GROUP BY t.event_id) sc
JOIN ( SELECT t.id AS event_id,
  t.title,
  t.status,
  t.start_date,
  t.end_date,
  t.org_id,
  t.employee_id,
  t.user_id,
  sum(t.cnt_conflict) AS venue_conflict,
  t.phase,
  t.finalized,
  t.cancel
FROM ( SELECT e.id,
  e.title,
  e.status,
  e.start_date,
  e.end_date,
  e.org_id,
  e.employee_id,
  e.user_id,
  e.phase,
  e.finalized,
  e.cancel,
  CASE
WHEN ((v.from_date < e.start_date) OR (v.from_date > e.end_date)) THEN count(*)
ELSE (0)::bigint
END AS cnt_conflict
FROM (event.tbl_events e
LEFT JOIN event.tbl_event_venues v ON (((e.id = v.event_id) AND ((v.from_date < e.start_date) OR (v.from_date > e.end_date)))))
GROUP BY e.id, v.from_date, e.title, e.status, e.start_date, e.end_date, e.org_id, e.employee_id, e.user_id, e.phase, e.finalized, e.cancel) t
GROUP BY t.id, t.title, t.status, t.start_date, t.end_date, t.org_id, t.employee_id, t.user_id, t.phase, t.finalized, t.cancel) bc ON ((bc.event_id = sc.event_id)));

  CREATE TABLE event.tbl_committee_members (
  id uuid NOT NULL,
  committee_id uuid,
  name character varying(500),
  type character varying(500),
  code character varying(500),
  member_employee_id uuid,
  member_employee_name character varying(1500),
  organization_name character varying(500),
  designation character varying(500),
  responsibility character varying(500),
  email character varying(500),
  phone_number character varying(500),
  is_deleted boolean,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  created_by character varying(100),
  last_modified_by character varying(100),
  notified boolean,
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL
);

  CREATE TABLE event.tbl_committees (
  id uuid NOT NULL,
  name character varying(500) NOT NULL,
  code character varying(500),
  event_id uuid,
  description character varying(500),
  responsibilities character varying(500),
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  created_by character varying(100),
  last_modified_by character varying(100),
  is_deleted boolean,
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL
);

  CREATE TABLE event.tbl_concept_notes (
  id uuid NOT NULL,
  title character varying(50) NOT NULL,
  description character varying(1500),
  status integer,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  is_deleted boolean,
  event_id uuid NOT NULL,
  created_by character varying(100),
  last_modified_by character varying(100),
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL
);

  CREATE TABLE event.tbl_event_attendance (
  id uuid NOT NULL,
  present_status boolean,
  comment character varying(2500),
  event_day integer,
  event_guest_id uuid NOT NULL,
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  is_deleted boolean,
  created_by character varying(100),
  last_modified_by character varying(100)
);

  CREATE TABLE event.tbl_event_checklist_details (
  id uuid NOT NULL,
  task character varying(500),
  assigned_to character varying(500),
  due_date_time timestamp without time zone,
  status integer,
  performed_by character varying(500),
  performed_date timestamp without time zone,
  serial integer,
  event_checklist_id uuid,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  created_by character varying(100),
  last_modified_by character varying(100),
  is_deleted boolean,
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL
);

  CREATE TABLE event.tbl_event_checklists (
  id uuid NOT NULL,
  name character varying(500) NOT NULL,
  description character varying(500),
  event_id uuid,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  created_by character varying(100),
  last_modified_by character varying(100),
  is_deleted boolean,
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL
);

  CREATE TABLE event.tbl_event_files (
  id uuid NOT NULL,
  file_title character varying(500),
  file_name character varying(500),
  file_type character varying(500),
  file_link character varying(500),
  event_id uuid,
  attendance_file boolean,
  event_day integer,
  event_date timestamp without time zone
);

  CREATE TABLE event.tbl_event_guest_schedules (
  id uuid NOT NULL,
  index integer,
  topic character varying(500),
  topic_duration_in_hour double precision,
  schedule_date timestamp without time zone,
  start_time timestamp without time zone,
  end_time timestamp without time zone,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  is_deleted boolean,
  created_by character varying(100),
  last_modified_by character varying(100),
  day_no integer,
  event_guest_id uuid,
  event_schedule_id uuid,
  user_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  conflicted boolean
);

  CREATE TABLE event.tbl_event_requisition (
  id uuid NOT NULL,
  requistion_id uuid NOT NULL,
  event_id uuid,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  is_deleted boolean,
  created_by character varying(100),
  last_modified_by character varying(100),
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL
);

  CREATE TABLE event.tbl_event_roles (
  id uuid NOT NULL,
  event_role character varying(50) NOT NULL,
  description character varying(1500),
  status integer,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  is_deleted boolean,
  created_by character varying(100),
  last_modified_by character varying(100),
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL
);

  CREATE TABLE event.tbl_event_sponsors (
  id uuid NOT NULL,
  name character varying(500) NOT NULL,
  type character varying(500) NOT NULL,
  type_of_sponsoring character varying(500) NOT NULL,
  amount double precision,
  check_number character varying(500),
  check_date timestamp without time zone,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  is_deleted boolean,
  event_id uuid NOT NULL,
  sponsor_id uuid NOT NULL,
  created_by character varying(100),
  last_modified_by character varying(100),
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL,
  remarks character varying(1500)
);

  CREATE TABLE event.tbl_event_types (
  id uuid NOT NULL,
  title character varying(500) NOT NULL,
  description character varying(1500),
  status integer,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  is_deleted boolean,
  created_by character varying(100),
  last_modified_by character varying(100),
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL
);

  CREATE TABLE event.tbl_invitations (
  id uuid NOT NULL,
  session_title character varying(500),
  invitation_status character varying(500),
  session_start_date timestamp without time zone,
  session_end_date timestamp without time zone,
  invited_employee_id uuid,
  invited_employee_name character varying(500),
  email_address character varying(500),
  phone_number character varying(500),
  table_reference_id uuid,
  event_id uuid,
  finalized integer,
  comment character varying(500),
  invitation_type character varying(500),
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  is_deleted boolean,
  created_by character varying(100),
  last_modified_by character varying(100),
  organization_name character varying(500)
);

  CREATE TABLE event.tbl_sponsors (
  id uuid NOT NULL,
  sponsor_name character varying(500) NOT NULL,
  organization_name character varying(500),
  phone character varying(500),
  description character varying(500),
  logo_file character varying(500),
  sponsor_file character varying(500),
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  is_deleted boolean,
  created_by character varying(100),
  last_modified_by character varying(100),
  address character varying(100),
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  org_id uuid NOT NULL,
  proxy_user_id uuid,
  contact_person character varying(200)
);

  CREATE TABLE event.tbl_venues (
  id uuid NOT NULL,
  venue_name character varying(500) NOT NULL,
  venue_code character varying(500) NOT NULL,
  venue_type character varying(500) NOT NULL,
  venue_incharge_name character varying(500) NOT NULL,
  venue_incharge_phone character varying(500),
  venue_incharge_employee_id character varying(500),
  area character varying(500),
  capacity integer,
  pictures character varying(500),
  address character varying(500),
  description character varying(500),
  postal_code character varying(500),
  status integer,
  estimated_budget double precision,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  is_deleted boolean,
  created_by character varying(100),
  last_modified_by character varying(100),
  user_id uuid NOT NULL,
  employee_id uuid NOT NULL,
  proxy_user_id uuid,
  org_id uuid NOT NULL
);

  ALTER TABLE ONLY event.tbl_event_roles
ADD CONSTRAINT "eventRoleeAndOrgId" UNIQUE (event_role, org_id);


--
  -- TOC entry 3507 (class 2606 OID 34630)
-- Name: tbl_events eventTitleAndOrgId; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_events
ADD CONSTRAINT "eventTitleAndOrgId" UNIQUE (title, org_id);


--
  -- TOC entry 3503 (class 2606 OID 34626)
-- Name: tbl_event_types eventTypeTitleAndOrgId; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_types
ADD CONSTRAINT "eventTypeTitleAndOrgId" UNIQUE (title, org_id);


--
  -- TOC entry 3501 (class 2606 OID 34330)
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.databasechangeloglock
ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
  -- TOC entry 3547 (class 2606 OID 34567)
-- Name: tbl_budget_details pk_tbl_budget_details; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_budget_details
ADD CONSTRAINT pk_tbl_budget_details PRIMARY KEY (id);


--
  -- TOC entry 3545 (class 2606 OID 34554)
-- Name: tbl_budgets pk_tbl_budgets; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_budgets
ADD CONSTRAINT pk_tbl_budgets PRIMARY KEY (id);


--
  -- TOC entry 3521 (class 2606 OID 34402)
-- Name: tbl_committee_members pk_tbl_committee_members; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_committee_members
ADD CONSTRAINT pk_tbl_committee_members PRIMARY KEY (id);


--
  -- TOC entry 3519 (class 2606 OID 34389)
-- Name: tbl_committees pk_tbl_committees; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_committees
ADD CONSTRAINT pk_tbl_committees PRIMARY KEY (id);


--
  -- TOC entry 3523 (class 2606 OID 34415)
-- Name: tbl_concept_notes pk_tbl_concept_notes; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_concept_notes
ADD CONSTRAINT pk_tbl_concept_notes PRIMARY KEY (id);


--
  -- TOC entry 3549 (class 2606 OID 34580)
-- Name: tbl_event_attendance pk_tbl_event_attendance; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_attendance
ADD CONSTRAINT pk_tbl_event_attendance PRIMARY KEY (id);


--
  -- TOC entry 3535 (class 2606 OID 34469)
-- Name: tbl_event_checklist_details pk_tbl_event_checklist_details; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_checklist_details
ADD CONSTRAINT pk_tbl_event_checklist_details PRIMARY KEY (id);


--
  -- TOC entry 3533 (class 2606 OID 34456)
-- Name: tbl_event_checklists pk_tbl_event_checklists; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_checklists
ADD CONSTRAINT pk_tbl_event_checklists PRIMARY KEY (id);


--
  -- TOC entry 3551 (class 2606 OID 34593)
-- Name: tbl_event_files pk_tbl_event_files; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_files
ADD CONSTRAINT pk_tbl_event_files PRIMARY KEY (id);


--
  -- TOC entry 3543 (class 2606 OID 34536)
-- Name: tbl_event_guest_schedules pk_tbl_event_guest_schedules; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_guest_schedules
ADD CONSTRAINT pk_tbl_event_guest_schedules PRIMARY KEY (id);


--
  -- TOC entry 3541 (class 2606 OID 34518)
-- Name: tbl_event_guests pk_tbl_event_guests; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_guests
ADD CONSTRAINT pk_tbl_event_guests PRIMARY KEY (id);


--
  -- TOC entry 3555 (class 2606 OID 34611)
-- Name: tbl_event_requisition pk_tbl_event_requisition; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_requisition
ADD CONSTRAINT pk_tbl_event_requisition PRIMARY KEY (id);


--
  -- TOC entry 3513 (class 2606 OID 34369)
-- Name: tbl_event_roles pk_tbl_event_roles; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_roles
ADD CONSTRAINT pk_tbl_event_roles PRIMARY KEY (id);


--
  -- TOC entry 3539 (class 2606 OID 34500)
-- Name: tbl_event_schedules pk_tbl_event_schedules; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_schedules
ADD CONSTRAINT pk_tbl_event_schedules PRIMARY KEY (id);


--
  -- TOC entry 3525 (class 2606 OID 34428)
-- Name: tbl_event_sponsors pk_tbl_event_sponsors; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_sponsors
ADD CONSTRAINT pk_tbl_event_sponsors PRIMARY KEY (id);


--
  -- TOC entry 3505 (class 2606 OID 34344)
-- Name: tbl_event_types pk_tbl_event_types; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_types
ADD CONSTRAINT pk_tbl_event_types PRIMARY KEY (id);


--
  -- TOC entry 3537 (class 2606 OID 34482)
-- Name: tbl_event_venues pk_tbl_event_venues; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_venues
ADD CONSTRAINT pk_tbl_event_venues PRIMARY KEY (id);


--
  -- TOC entry 3509 (class 2606 OID 34356)
-- Name: tbl_events pk_tbl_events; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_events
ADD CONSTRAINT pk_tbl_events PRIMARY KEY (id);


--
  -- TOC entry 3553 (class 2606 OID 34606)
-- Name: tbl_invitations pk_tbl_invitations; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_invitations
ADD CONSTRAINT pk_tbl_invitations PRIMARY KEY (id);


--
  -- TOC entry 3515 (class 2606 OID 34379)
-- Name: tbl_sponsors pk_tbl_sponsors; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_sponsors
ADD CONSTRAINT pk_tbl_sponsors PRIMARY KEY (id);


--
  -- TOC entry 3527 (class 2606 OID 34446)
-- Name: tbl_venues pk_tbl_venues; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_venues
ADD CONSTRAINT pk_tbl_venues PRIMARY KEY (id);


--
  -- TOC entry 3517 (class 2606 OID 34624)
-- Name: tbl_sponsors sponsorNameAndOrgId; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_sponsors
ADD CONSTRAINT "sponsorNameAndOrgId" UNIQUE (sponsor_name, org_id);


--
  -- TOC entry 3557 (class 2606 OID 34613)
-- Name: tbl_event_requisition tbl_event_requisition_requistion_id_key; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_requisition
ADD CONSTRAINT tbl_event_requisition_requistion_id_key UNIQUE (requistion_id);


--
  -- TOC entry 3529 (class 2606 OID 34622)
-- Name: tbl_venues venueCodeAndOrgId; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_venues
ADD CONSTRAINT "venueCodeAndOrgId" UNIQUE (venue_code, org_id);


--
  -- TOC entry 3531 (class 2606 OID 34620)
-- Name: tbl_venues venueNameAndOrgId; Type: CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_venues
ADD CONSTRAINT "venueNameAndOrgId" UNIQUE (venue_name, org_id);


--
  -- TOC entry 3565 (class 2606 OID 34470)
-- Name: tbl_event_checklist_details details_checklist; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_checklist_details
ADD CONSTRAINT details_checklist FOREIGN KEY (event_checklist_id) REFERENCES event.tbl_event_checklists(id);


--
  -- TOC entry 3575 (class 2606 OID 34568)
-- Name: tbl_budget_details fk_budget_budget_details; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_budget_details
ADD CONSTRAINT fk_budget_budget_details FOREIGN KEY (budget_id) REFERENCES event.tbl_budgets(id);


--
  -- TOC entry 3574 (class 2606 OID 34555)
-- Name: tbl_budgets fk_budget_event; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_budgets
ADD CONSTRAINT fk_budget_event FOREIGN KEY (event_id) REFERENCES event.tbl_events(id);


--
  -- TOC entry 3559 (class 2606 OID 34390)
-- Name: tbl_committees fk_committee_event; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_committees
ADD CONSTRAINT fk_committee_event FOREIGN KEY (event_id) REFERENCES event.tbl_events(id);


--
  -- TOC entry 3564 (class 2606 OID 34457)
-- Name: tbl_event_checklists fk_committee_event; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_checklists
ADD CONSTRAINT fk_committee_event FOREIGN KEY (event_id) REFERENCES event.tbl_events(id);


--
  -- TOC entry 3576 (class 2606 OID 34581)
-- Name: tbl_event_attendance fk_event_attendence; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_attendance
ADD CONSTRAINT fk_event_attendence FOREIGN KEY (event_guest_id) REFERENCES event.tbl_event_guests(id);


--
  -- TOC entry 3577 (class 2606 OID 34594)
-- Name: tbl_event_files fk_event_file; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_files
ADD CONSTRAINT fk_event_file FOREIGN KEY (event_id) REFERENCES event.tbl_events(id);


--
  -- TOC entry 3570 (class 2606 OID 34519)
-- Name: tbl_event_guests fk_event_guest_role; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_guests
ADD CONSTRAINT fk_event_guest_role FOREIGN KEY (event_role_id) REFERENCES event.tbl_event_roles(id);


--
  -- TOC entry 3578 (class 2606 OID 34614)
-- Name: tbl_event_requisition fk_event_requisition; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_requisition
ADD CONSTRAINT fk_event_requisition FOREIGN KEY (event_id) REFERENCES event.tbl_events(id);


--
  -- TOC entry 3573 (class 2606 OID 34542)
-- Name: tbl_event_guest_schedules fk_event_schedule_id_event_guest; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_guest_schedules
ADD CONSTRAINT fk_event_schedule_id_event_guest FOREIGN KEY (event_schedule_id) REFERENCES event.tbl_event_schedules(id);


--
  -- TOC entry 3571 (class 2606 OID 34524)
-- Name: tbl_event_guests fk_eventguest_event; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_guests
ADD CONSTRAINT fk_eventguest_event FOREIGN KEY (event_id) REFERENCES event.tbl_events(id);


--
  -- TOC entry 3572 (class 2606 OID 34537)
-- Name: tbl_event_guest_schedules fk_guest_event_schedule_id; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_guest_schedules
ADD CONSTRAINT fk_guest_event_schedule_id FOREIGN KEY (event_guest_id) REFERENCES event.tbl_event_guests(id);


--
  -- TOC entry 3560 (class 2606 OID 34403)
-- Name: tbl_committee_members fk_member_committee; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_committee_members
ADD CONSTRAINT fk_member_committee FOREIGN KEY (committee_id) REFERENCES event.tbl_committees(id);


--
  -- TOC entry 3561 (class 2606 OID 34416)
-- Name: tbl_concept_notes fk_note_event; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_concept_notes
ADD CONSTRAINT fk_note_event FOREIGN KEY (event_id) REFERENCES event.tbl_events(id);


--
  -- TOC entry 3568 (class 2606 OID 34501)
-- Name: tbl_event_schedules fk_schedule_event; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_schedules
ADD CONSTRAINT fk_schedule_event FOREIGN KEY (event_id) REFERENCES event.tbl_events(id);


--
  -- TOC entry 3569 (class 2606 OID 34506)
-- Name: tbl_event_schedules fk_schedule_venue; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_schedules
ADD CONSTRAINT fk_schedule_venue FOREIGN KEY (event_venue_id) REFERENCES event.tbl_event_venues(id);


--
  -- TOC entry 3562 (class 2606 OID 34429)
-- Name: tbl_event_sponsors fk_sponsor_event; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_sponsors
ADD CONSTRAINT fk_sponsor_event FOREIGN KEY (event_id) REFERENCES event.tbl_events(id);


--
  -- TOC entry 3563 (class 2606 OID 34434)
-- Name: tbl_event_sponsors fk_sponsors_sponsor; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_sponsors
ADD CONSTRAINT fk_sponsors_sponsor FOREIGN KEY (sponsor_id) REFERENCES event.tbl_sponsors(id);


--
  -- TOC entry 3558 (class 2606 OID 34357)
-- Name: tbl_events fk_type_event; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_events
ADD CONSTRAINT fk_type_event FOREIGN KEY (event_type_id) REFERENCES event.tbl_event_types(id);


--
  -- TOC entry 3566 (class 2606 OID 34483)
-- Name: tbl_event_venues fk_venue_event; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_venues
ADD CONSTRAINT fk_venue_event FOREIGN KEY (event_id) REFERENCES event.tbl_events(id);


--
  -- TOC entry 3567 (class 2606 OID 34488)
-- Name: tbl_event_venues fk_venues_venue; Type: FK CONSTRAINT; Schema: event; Owner: postgres
--

  ALTER TABLE ONLY event.tbl_event_venues
ADD CONSTRAINT fk_venues_venue FOREIGN KEY (venue_id) REFERENCES event.tbl_venues(id);


-- Completed on 2018-11-08 18:31:39

--
  -- PostgreSQL database dump complete
--

