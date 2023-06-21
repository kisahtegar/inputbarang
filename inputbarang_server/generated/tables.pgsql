--
-- Class DaftarBarang as table daftar_barang
--

CREATE TABLE "daftar_barang" (
  "id" serial,
  "kode_barang" text NOT NULL,
  "nama_barang" text NOT NULL,
  "jenis_barang" text NOT NULL
);

ALTER TABLE ONLY "daftar_barang"
  ADD CONSTRAINT daftar_barang_pkey PRIMARY KEY (id);


--
-- Class Supplier as table supplier
--

CREATE TABLE "supplier" (
  "id" serial,
  "kode_supplier" text NOT NULL,
  "nama_supplier" text NOT NULL,
  "alamat_supplier" text NOT NULL,
  "telepon_supplier" text NOT NULL
);

ALTER TABLE ONLY "supplier"
  ADD CONSTRAINT supplier_pkey PRIMARY KEY (id);


--
-- Class Transaksi as table transaksi
--

CREATE TABLE "transaksi" (
  "id" serial,
  "supplierId" integer NOT NULL,
  "tanggal_transaksi" timestamp without time zone NOT NULL
);

ALTER TABLE ONLY "transaksi"
  ADD CONSTRAINT transaksi_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "transaksi"
  ADD CONSTRAINT transaksi_fk_0
    FOREIGN KEY("supplierId")
      REFERENCES supplier(id)
        ON DELETE CASCADE;

--
-- Class DaftarPembelian as table daftar_pembelian
--

CREATE TABLE "daftar_pembelian" (
  "id" serial,
  "transaksiId" integer NOT NULL,
  "daftarBarangId" integer NOT NULL,
  "kode_pembelian" text NOT NULL,
  "jumlah" integer NOT NULL,
  "harga_barang" integer NOT NULL
);

ALTER TABLE ONLY "daftar_pembelian"
  ADD CONSTRAINT daftar_pembelian_pkey PRIMARY KEY (id);

ALTER TABLE ONLY "daftar_pembelian"
  ADD CONSTRAINT daftar_pembelian_fk_0
    FOREIGN KEY("transaksiId")
      REFERENCES transaksi(id)
        ON DELETE CASCADE;
ALTER TABLE ONLY "daftar_pembelian"
  ADD CONSTRAINT daftar_pembelian_fk_1
    FOREIGN KEY("daftarBarangId")
      REFERENCES daftar_barang(id)
        ON DELETE CASCADE;

