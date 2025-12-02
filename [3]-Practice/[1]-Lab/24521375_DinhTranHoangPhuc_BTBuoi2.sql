-- Bai nop TH buoi 2 - Lop IT004.Q17.2
-- MSSV: 24521375
-- Ho ten: Dinh Tran Hoang Phuc
-----------------# 2.1 #-----------------
ALTER TABLE BENHNHAN
ADD CONSTRAINT CK_BN_BHYTCHITRA
CHECK (BHYTChiTra BETWEEN 0 AND 0.7);

-----------------# 2.2 #-----------------
ALTER TABLE DONTHUOC
ADD CONSTRAINT CK_DT_TINHTRANGDT
CHECK (TinhTrangDT IN ('Chua thanh toan','Da thanh toan'))

-----------------# 3.1 #-----------------
SELECT BS.MABS, BS.HoTenBS, BN.MaBN, BN.HoTenBN
FROM BACSI BS
JOIN KHAMBENH KB ON BS.MaBS = KB.MaBS
JOIN BENHNHAN BN ON KB.MaBN = BN.MaBN
WHERE BS.ChuyenKhoa = 'Tai-mui-hong'
  AND YEAR(KB.NgayKham) = 2024;

-----------------# 3.2 #-----------------
SELECT DISTINCT BN.MaBN, BN.HoTenBN
FROM BENHNHAN BN
JOIN KHAMBENH KB ON BN.MaBN = KB.MaBN
WHERE YEAR(KB.NgayKham) = 2024
  AND NOT EXISTS (
      SELECT *
      FROM DONTHUOC DT
      WHERE DT.MaKB = KB.MaKB
        AND DT.TinhTrangDT = 'Da thanh toan'
        AND DT.TongTienTT >= 100000
      );