CREATE TABLE meeting.tbl_attachment (
  id uuid NOT NULL,
  file_id character varying(100) NOT NULL,
  file_name character varying(100) NOT NULL,
  external_meeting_id uuid NOT NULL,
  is_delete boolean NOT NULL
);

CREATE TABLE meeting.tbl_budget_heads (
  id uuid NOT NULL,
  head_name character varying(255) NOT NULL,
  head_code character varying(255) NOT NULL,
  status boolean DEFAULT true NOT NULL,
  is_deleted boolean DEFAULT false NOT NULL
);

CREATE TABLE meeting.tbl_external_meeting (
  id uuid NOT NULL,
  office_name character varying(100) NOT NULL,
  meeting_reference character varying(100) NOT NULL,
  meeting_title character varying(100) NOT NULL,
  meeting_type character varying(100) NOT NULL,
  meeting_room character varying(100),
  meeting_chairperson character varying(100),
  meeting_date date NOT NULL,
  start_time time without time zone,
  end_time time without time zone,
  employee_id uuid NOT NULL,
  is_delete boolean NOT NULL
);

  CREATE TABLE meeting.tbl_meeting_agendas (
  id uuid NOT NULL,
  meeting_id uuid NOT NULL,
  agenda character varying(255) NOT NULL,
  is_deleted boolean NOT NULL
);

  CREATE TABLE meeting.tbl_meeting_attachments (
  id uuid NOT NULL,
  meeting_id uuid NOT NULL,
  office_id uuid NOT NULL,
  type character varying(50) NOT NULL,
  file_title character varying(255),
  file_id character varying(255),
  file_path character varying(255),
  is_deleted boolean NOT NULL,
  created_on date,
  created_by uuid
);

  CREATE TABLE meeting.tbl_meeting_budgets (
  id uuid NOT NULL,
  meeting_id uuid NOT NULL,
  budget_id uuid NOT NULL,
  estimated_budget double precision NOT NULL,
  accepted_budget double precision,
  expenses double precision,
  justification character varying(1000),
  expenses_justification character varying(1000),
  comments character varying(1000),
  fiscal_year uuid,
  is_deleted boolean DEFAULT false NOT NULL
);

  CREATE TABLE meeting.tbl_meeting_comments (
  id uuid NOT NULL,
  comment text,
  type character varying(50),
  employee_id uuid,
  meeting_id uuid NOT NULL,
  comment_date date,
  is_deleted boolean NOT NULL,
  is_chair boolean NOT NULL
);

  CREATE TABLE meeting.tbl_meeting_committee_members (
  id uuid NOT NULL,
  committee_id uuid NOT NULL,
  employee_id uuid,
  designation character varying(100),
  name character varying(100) NOT NULL,
  member_type character varying NOT NULL,
  org_name character varying(100),
  office_id uuid,
  status integer,
  is_deleted boolean NOT NULL,
  role_in_meeting character varying(20)
);

  CREATE TABLE meeting.tbl_meeting_committees (
  id uuid NOT NULL,
  committee_code character varying(50) NOT NULL,
  committee_name character varying(50) NOT NULL,
  meeting_type uuid NOT NULL,
  short_description character varying(50),
  office_id uuid,
  is_deleted boolean NOT NULL,
  created_by uuid,
  created_on date
);

  CREATE TABLE meeting.tbl_meeting_decisions (
  id uuid NOT NULL,
  meeting_id uuid,
  agenda_id uuid,
  speakers text,
  discussion character varying(500),
  decision character varying(500),
  decision_file character varying(500),
  is_deleted boolean,
  org_id uuid
);

  CREATE TABLE meeting.tbl_meeting_invitation (
  id uuid NOT NULL,
  employee_id uuid,
  meeting_id uuid NOT NULL,
  is_owner boolean NOT NULL,
  is_nominated boolean NOT NULL,
  is_invited boolean NOT NULL,
  is_attend boolean NOT NULL,
  status character varying(50) NOT NULL,
  remarks character varying(1000),
  office_id uuid,
  guest_type character varying(255) NOT NULL,
  name character varying(255),
  office character varying(255),
  designation character varying(255),
  mobile_no character varying(25),
  email character varying(100),
  passport_no character varying(100),
  country_name character varying(100),
  is_deleted boolean NOT NULL,
  nominated_by character varying(100),
  is_acknowledged boolean NOT NULL,
  honorarium double precision DEFAULT 0,
  tax_deduction double precision DEFAULT 0,
  attendee_type_code integer,
  role_name character varying(200),
  honorium_given boolean
);

  CREATE TABLE meeting.tbl_meeting_item_requisitions (
  id uuid NOT NULL,
  meeting_id uuid NOT NULL,
  item_requisition_id uuid NOT NULL,
  office_id uuid,
  status character varying(100)
);

  CREATE TABLE meeting.tbl_meeting_notes (
  id uuid NOT NULL,
  meeting_id uuid NOT NULL,
  agenda_id uuid NOT NULL,
  office_id uuid NOT NULL,
  speaker character varying(255),
  note text,
  is_deleted boolean NOT NULL
);

  CREATE TABLE meeting.tbl_meeting_resolution_files (
  id uuid NOT NULL,
  resolution_id uuid NOT NULL,
  file_id uuid,
  file_name character varying(200)
);

  CREATE TABLE meeting.tbl_meeting_resolutions (
  id uuid NOT NULL,
  meeting_id uuid NOT NULL,
  prepared_by uuid,
  create_date date NOT NULL,
  approve_date date,
  approved_by uuid,
  status character varying(20),
  office_id uuid,
  resolution character varying(5000),
  remarks character varying(500),
  is_deleted boolean NOT NULL
);

  CREATE TABLE meeting.tbl_meeting_room_bookings (
  id uuid NOT NULL,
  meeting_room_id uuid,
  meeting_id uuid NOT NULL,
  booked_by uuid,
  booking_date date,
  responsed_by uuid,
  response_date date,
  status character varying(50),
  remarks character varying(50)
);

  CREATE TABLE meeting.tbl_meeting_rooms (
  id uuid NOT NULL,
  code character varying(50) NOT NULL,
  name character varying(100) NOT NULL,
  office_id uuid,
  floor_no character varying(50),
  room_no character varying(50),
  capacity character varying(50),
  building_address character varying(100),
  is_deleted boolean NOT NULL,
  created_by uuid,
  created_on date
);

  CREATE TABLE meeting.tbl_meeting_types (
  id uuid NOT NULL,
  meeting_type character varying(50) NOT NULL,
  office_id uuid NOT NULL,
  employee_id uuid,
  frequency character varying(50),
  short_description character varying(255) NOT NULL,
  is_deleted boolean NOT NULL,
  created_by uuid,
  created_on date
);

  CREATE TABLE meeting.tbl_meetings (
  id uuid NOT NULL,
  title character varying(255) NOT NULL,
  meeting_type_id uuid NOT NULL,
  meeting_room_id uuid NOT NULL,
  meeting_commitee_id uuid,
  office_id uuid NOT NULL,
  parent_id uuid,
  employee_id uuid NOT NULL,
  is_protocol_handled boolean NOT NULL,
  reference character varying(255),
  meeting_chairperson uuid,
  meeting_date date,
  start_time time without time zone,
  end_time time without time zone,
  estimated_budget double precision,
  meeting_status character varying(100),
  reason text,
  is_deleted boolean NOT NULL,
  project_id uuid,
  created_by uuid,
  created_on date,
  enothi_reference character varying(500),
  previous_meeting_reference uuid,
  meeting_background text
);

  CREATE TABLE meeting.tbl_tax_setups (
  id uuid NOT NULL,
  tax_rate double precision,
  comment character varying(500),
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  employee_id uuid,
  org_id uuid,
  user_id uuid,
  proxy_user_id uuid
);

  CREATE TABLE meeting.tbl_template_files (
  id uuid NOT NULL,
  office_id character varying(100),
  file_title character varying(100) NOT NULL,
  file_id character varying(100) NOT NULL,
  upload_date date,
  uploaded_by character varying(100),
  is_delete boolean NOT NULL
);

  ALTER TABLE ONLY meeting.tbl_meeting_resolutions
ADD CONSTRAINT "compositKey" UNIQUE (meeting_id);


--
  -- TOC entry 1985 (class 2606 OID 37686)
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.databasechangeloglock
ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
  -- TOC entry 1981 (class 2606 OID 29483)
-- Name: tbl_attachment pk_tbl_attachment; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_attachment
ADD CONSTRAINT pk_tbl_attachment PRIMARY KEY (id);


--
  -- TOC entry 1987 (class 2606 OID 37696)
-- Name: tbl_budget_heads pk_tbl_budget_heads; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_budget_heads
ADD CONSTRAINT pk_tbl_budget_heads PRIMARY KEY (id);


--
  -- TOC entry 1977 (class 2606 OID 29476)
-- Name: tbl_external_meeting pk_tbl_external_meeting; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_external_meeting
ADD CONSTRAINT pk_tbl_external_meeting PRIMARY KEY (id);


--
  -- TOC entry 1956 (class 2606 OID 29383)
-- Name: tbl_meeting_agendas pk_tbl_meeting_agendas; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_agendas
ADD CONSTRAINT pk_tbl_meeting_agendas PRIMARY KEY (id);


--
  -- TOC entry 1959 (class 2606 OID 29396)
-- Name: tbl_meeting_attachments pk_tbl_meeting_attachments; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_attachments
ADD CONSTRAINT pk_tbl_meeting_attachments PRIMARY KEY (id);


--
  -- TOC entry 1989 (class 2606 OID 37705)
-- Name: tbl_meeting_budgets pk_tbl_meeting_budgets; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_budgets
ADD CONSTRAINT pk_tbl_meeting_budgets PRIMARY KEY (id);


--
  -- TOC entry 1996 (class 2606 OID 37752)
-- Name: tbl_meeting_comments pk_tbl_meeting_comments; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_comments
ADD CONSTRAINT pk_tbl_meeting_comments PRIMARY KEY (id);


--
  -- TOC entry 1939 (class 2606 OID 29324)
-- Name: tbl_meeting_committee_members pk_tbl_meeting_committee_members; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_committee_members
ADD CONSTRAINT pk_tbl_meeting_committee_members PRIMARY KEY (id);


--
  -- TOC entry 1933 (class 2606 OID 29307)
-- Name: tbl_meeting_committees pk_tbl_meeting_committees; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_committees
ADD CONSTRAINT pk_tbl_meeting_committees PRIMARY KEY (id);


--
  -- TOC entry 1991 (class 2606 OID 37723)
-- Name: tbl_meeting_decisions pk_tbl_meeting_decisions; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_decisions
ADD CONSTRAINT pk_tbl_meeting_decisions PRIMARY KEY (id);


--
  -- TOC entry 1952 (class 2606 OID 29371)
-- Name: tbl_meeting_invitation pk_tbl_meeting_invitation; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_invitation
ADD CONSTRAINT pk_tbl_meeting_invitation PRIMARY KEY (id);


--
  -- TOC entry 1983 (class 2606 OID 29488)
-- Name: tbl_meeting_item_requisitions pk_tbl_meeting_item_requisitions; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_item_requisitions
ADD CONSTRAINT pk_tbl_meeting_item_requisitions PRIMARY KEY (id);


--
  -- TOC entry 1963 (class 2606 OID 29411)
-- Name: tbl_meeting_notes pk_tbl_meeting_notes; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_notes
ADD CONSTRAINT pk_tbl_meeting_notes PRIMARY KEY (id);


--
  -- TOC entry 1971 (class 2606 OID 29456)
-- Name: tbl_meeting_resolution_files pk_tbl_meeting_resolution_files; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_resolution_files
ADD CONSTRAINT pk_tbl_meeting_resolution_files PRIMARY KEY (id);


--
  -- TOC entry 1969 (class 2606 OID 29444)
-- Name: tbl_meeting_resolutions pk_tbl_meeting_resolutions; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_resolutions
ADD CONSTRAINT pk_tbl_meeting_resolutions PRIMARY KEY (id);


--
  -- TOC entry 1965 (class 2606 OID 29426)
-- Name: tbl_meeting_room_bookings pk_tbl_meeting_room_bookings; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_room_bookings
ADD CONSTRAINT pk_tbl_meeting_room_bookings PRIMARY KEY (id);


--
  -- TOC entry 1941 (class 2606 OID 29334)
-- Name: tbl_meeting_rooms pk_tbl_meeting_rooms; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_rooms
ADD CONSTRAINT pk_tbl_meeting_rooms PRIMARY KEY (id);


--
  -- TOC entry 1929 (class 2606 OID 29300)
-- Name: tbl_meeting_types pk_tbl_meeting_types; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_types
ADD CONSTRAINT pk_tbl_meeting_types PRIMARY KEY (id);


--
  -- TOC entry 1949 (class 2606 OID 29348)
-- Name: tbl_meetings pk_tbl_meetings; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meetings
ADD CONSTRAINT pk_tbl_meetings PRIMARY KEY (id);


--
  -- TOC entry 1994 (class 2606 OID 37731)
-- Name: tbl_tax_setups pk_tbl_tax_setups; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_tax_setups
ADD CONSTRAINT pk_tbl_tax_setups PRIMARY KEY (id);


--
  -- TOC entry 1973 (class 2606 OID 29466)
-- Name: tbl_template_files pk_tbl_template_files; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_template_files
ADD CONSTRAINT pk_tbl_template_files PRIMARY KEY (id);


--
  -- TOC entry 1979 (class 2606 OID 29478)
-- Name: tbl_external_meeting tbl_external_meeting_meeting_date_office_name_meeting_title_key; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_external_meeting
ADD CONSTRAINT tbl_external_meeting_meeting_date_office_name_meeting_title_key UNIQUE (meeting_date, office_name, meeting_title, employee_id);


--
  -- TOC entry 1961 (class 2606 OID 29403)
-- Name: tbl_meeting_attachments tbl_meeting_attachments_meeting_id_type_file_id_key; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_attachments
ADD CONSTRAINT tbl_meeting_attachments_meeting_id_type_file_id_key UNIQUE (meeting_id, type, file_id);


--
  -- TOC entry 1935 (class 2606 OID 29309)
-- Name: tbl_meeting_committees tbl_meeting_committees_committee_code_key; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_committees
ADD CONSTRAINT tbl_meeting_committees_committee_code_key UNIQUE (committee_code);


--
  -- TOC entry 1937 (class 2606 OID 29316)
-- Name: tbl_meeting_committees tbl_meeting_committees_committee_code_office_id_key; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_committees
ADD CONSTRAINT tbl_meeting_committees_committee_code_office_id_key UNIQUE (committee_code, office_id);


--
  -- TOC entry 1954 (class 2606 OID 29378)
-- Name: tbl_meeting_invitation tbl_meeting_invitation_employee_id_meeting_id_key; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_invitation
ADD CONSTRAINT tbl_meeting_invitation_employee_id_meeting_id_key UNIQUE (employee_id, meeting_id);


--
  -- TOC entry 1943 (class 2606 OID 29338)
-- Name: tbl_meeting_rooms tbl_meeting_rooms_code_key; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_rooms
ADD CONSTRAINT tbl_meeting_rooms_code_key UNIQUE (code);


--
  -- TOC entry 1945 (class 2606 OID 29340)
-- Name: tbl_meeting_rooms tbl_meeting_rooms_code_office_id_key; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_rooms
ADD CONSTRAINT tbl_meeting_rooms_code_office_id_key UNIQUE (code, office_id);


--
  -- TOC entry 1947 (class 2606 OID 29336)
-- Name: tbl_meeting_rooms tbl_meeting_rooms_name_key; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_rooms
ADD CONSTRAINT tbl_meeting_rooms_name_key UNIQUE (name);


--
  -- TOC entry 1931 (class 2606 OID 29302)
-- Name: tbl_meeting_types tbl_meeting_types_meeting_type_office_id_key; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_types
ADD CONSTRAINT tbl_meeting_types_meeting_type_office_id_key UNIQUE (meeting_type, office_id);


--
  -- TOC entry 1975 (class 2606 OID 29468)
-- Name: tbl_template_files tbl_template_files_file_title_office_id_key; Type: CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_template_files
ADD CONSTRAINT tbl_template_files_file_title_office_id_key UNIQUE (file_title, office_id);


--
  -- TOC entry 1957 (class 1259 OID 45887)
-- Name: tbl_meeting_agenda_gin_index; Type: INDEX; Schema: meeting; Owner: postgres
--

  CREATE INDEX tbl_meeting_agenda_gin_index ON meeting.tbl_meeting_agendas USING gin (to_tsvector('english'::regconfig, (COALESCE(agenda, ''::character varying))::text)) WITH (fastupdate='on');


--
  -- TOC entry 1992 (class 1259 OID 45888)
-- Name: tbl_meeting_decision_gin_index; Type: INDEX; Schema: meeting; Owner: postgres
--

  CREATE INDEX tbl_meeting_decision_gin_index ON meeting.tbl_meeting_decisions USING gin (to_tsvector('english'::regconfig, (((COALESCE(discussion, ''::character varying))::text || ' '::text) || (COALESCE(decision, ''::character varying))::text))) WITH (fastupdate='on');


--
  -- TOC entry 1950 (class 1259 OID 45886)
-- Name: tbl_meeting_gin_index; Type: INDEX; Schema: meeting; Owner: postgres
--

  CREATE INDEX tbl_meeting_gin_index ON meeting.tbl_meetings USING gin (to_tsvector('english'::regconfig, (((((COALESCE(title, ''::character varying))::text || ' '::text) || (COALESCE(reference, ''::character varying))::text) || ' '::text) || COALESCE(meeting_background, ''::text)))) WITH (fastupdate='on');


--
  -- TOC entry 2003 (class 2606 OID 29384)
-- Name: tbl_meeting_agendas fk_agenda_meetings; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_agendas
ADD CONSTRAINT fk_agenda_meetings FOREIGN KEY (meeting_id) REFERENCES meeting.tbl_meetings(id);


--
  -- TOC entry 2004 (class 2606 OID 29397)
-- Name: tbl_meeting_attachments fk_attachment_meetings; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_attachments
ADD CONSTRAINT fk_attachment_meetings FOREIGN KEY (meeting_id) REFERENCES meeting.tbl_meetings(id);


--
  -- TOC entry 2007 (class 2606 OID 29427)
-- Name: tbl_meeting_room_bookings fk_booking_meeting; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_room_bookings
ADD CONSTRAINT fk_booking_meeting FOREIGN KEY (meeting_id) REFERENCES meeting.tbl_meetings(id);


--
  -- TOC entry 2008 (class 2606 OID 29432)
-- Name: tbl_meeting_room_bookings fk_booking_meeting_room; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_room_bookings
ADD CONSTRAINT fk_booking_meeting_room FOREIGN KEY (meeting_room_id) REFERENCES meeting.tbl_meeting_rooms(id);


--
  -- TOC entry 2012 (class 2606 OID 37711)
-- Name: tbl_meeting_budgets fk_budget_heads; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_budgets
ADD CONSTRAINT fk_budget_heads FOREIGN KEY (budget_id) REFERENCES meeting.tbl_budget_heads(id);


--
  -- TOC entry 2011 (class 2606 OID 37706)
-- Name: tbl_meeting_budgets fk_budget_meetings; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_budgets
ADD CONSTRAINT fk_budget_meetings FOREIGN KEY (meeting_id) REFERENCES meeting.tbl_meetings(id);


--
  -- TOC entry 2013 (class 2606 OID 37753)
-- Name: tbl_meeting_comments fk_comments_meeting; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_comments
ADD CONSTRAINT fk_comments_meeting FOREIGN KEY (meeting_id) REFERENCES meeting.tbl_meetings(id);


--
  -- TOC entry 1997 (class 2606 OID 29310)
-- Name: tbl_meeting_committees fk_committee_meeting_type; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_committees
ADD CONSTRAINT fk_committee_meeting_type FOREIGN KEY (meeting_type) REFERENCES meeting.tbl_meeting_types(id);


--
  -- TOC entry 2002 (class 2606 OID 29372)
-- Name: tbl_meeting_invitation fk_invitation_meetings; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_invitation
ADD CONSTRAINT fk_invitation_meetings FOREIGN KEY (meeting_id) REFERENCES meeting.tbl_meetings(id);


--
  -- TOC entry 1999 (class 2606 OID 29349)
-- Name: tbl_meetings fk_meeting_commitees; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meetings
ADD CONSTRAINT fk_meeting_commitees FOREIGN KEY (meeting_commitee_id) REFERENCES meeting.tbl_meeting_committees(id);


--
  -- TOC entry 1998 (class 2606 OID 29325)
-- Name: tbl_meeting_committee_members fk_meeting_committee; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_committee_members
ADD CONSTRAINT fk_meeting_committee FOREIGN KEY (committee_id) REFERENCES meeting.tbl_meeting_committees(id);


--
  -- TOC entry 2001 (class 2606 OID 29359)
-- Name: tbl_meetings fk_meeting_rooms; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meetings
ADD CONSTRAINT fk_meeting_rooms FOREIGN KEY (meeting_room_id) REFERENCES meeting.tbl_meeting_rooms(id);


--
  -- TOC entry 2000 (class 2606 OID 29354)
-- Name: tbl_meetings fk_meeting_types; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meetings
ADD CONSTRAINT fk_meeting_types FOREIGN KEY (meeting_type_id) REFERENCES meeting.tbl_meeting_types(id);


--
  -- TOC entry 2006 (class 2606 OID 29417)
-- Name: tbl_meeting_notes fk_note_agenda_meetings; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_notes
ADD CONSTRAINT fk_note_agenda_meetings FOREIGN KEY (agenda_id) REFERENCES meeting.tbl_meeting_agendas(id);


--
  -- TOC entry 2005 (class 2606 OID 29412)
-- Name: tbl_meeting_notes fk_note_meetings; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_notes
ADD CONSTRAINT fk_note_meetings FOREIGN KEY (meeting_id) REFERENCES meeting.tbl_meetings(id);


--
  -- TOC entry 2010 (class 2606 OID 29457)
-- Name: tbl_meeting_resolution_files fk_resolution; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_resolution_files
ADD CONSTRAINT fk_resolution FOREIGN KEY (resolution_id) REFERENCES meeting.tbl_meeting_resolutions(id);


--
  -- TOC entry 2009 (class 2606 OID 29445)
-- Name: tbl_meeting_resolutions fk_resolution_meeting; Type: FK CONSTRAINT; Schema: meeting; Owner: postgres
--

  ALTER TABLE ONLY meeting.tbl_meeting_resolutions
ADD CONSTRAINT fk_resolution_meeting FOREIGN KEY (meeting_id) REFERENCES meeting.tbl_meetings(id);


-- Completed on 2018-11-08 18:25:34

--
  -- PostgreSQL database dump complete
--

