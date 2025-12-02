-- Bai nop TH buoi 3 - Lop IT004.Q17.2
-- MSSV: 24521375
-- Ho ten: Dinh Tran Hoang Phuc
-----------------# 3.3 #-----------------
SELECT DT.MaDT, DT.MaKB
FROM DONTHUOC DT
WHERE YEAR(DT.NgayCapThuoc) = 2024
  AND DT.TinhTrangDT = 'Da thanh toan'
  AND NOT EXISTS (
      SELECT 1
      FROM CHITIETDT CT
      JOIN THUOC T ON CT.MaThuoc = T.MaThuoc
      WHERE CT.MaDT = DT.MaDT
          AND T.LoaiThuoc <> 'Thuoc di ung'
  );

-----------------# 3.4 #-----------------
SELECT BN.MaBN, BN.HoTenBN, COUNT(DT.MaDT) AS SoLuongDonThuoc
FROM BENHNHAN BN
JOIN KHAMBENH KB ON BN.MaBN = KB.MaBN
JOIN DONTHUOC DT ON KB.MaKB = DT.MaKB
WHERE BN.SoBHYT IS NULL
    AND YEAR(DT.NgayCapThuoc) = 2024
    AND DT.TinhTrangDT = 'Da thanh toan'
GROUP BY BN.MaBN, BN.HoTenBN;

-----------------# 3.5 #-----------------
SELECT BN.MaBN, BN.HoTenBN
FROM BENHNHAN BN
JOIN KHAMBENH KB ON BN.MaBN = KB.MaBN
JOIN DONTHUOC DT ON KB.MaKB = DT.MaKB
WHERE YEAR(DT.NgayCapThuoc) = 2024
GROUP BY BN.MaBN, BN.HoTenBN
HAVING 
    COUNT(KB.MaKB) = (
        SELECT MIN(SL)
        FROM (
            SELECT MaBN, COUNT(MaKB) AS SL
            FROM KHAMBENH
            GROUP BY MaBN
        ) AS TMP
    )
    AND SUM(DT.TongTienTT) < 100000;