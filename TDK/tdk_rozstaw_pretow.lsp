(defun c:tdk_rozstaw_pretow()
  (setq tdk_rozstaw_pretow_aktualna_liczba_pretow "1")
  (setq tdk_rozstaw_pretow_p1 (getpoint "\nWskaz poczatkowy punkt rozkladu"))
  (setq tdk_rozstaw_pretow_p2 (getpoint tdk_rozstaw_pretow_p1 "\nWskaz koncowy punkt rozkladu"))
  
  (setq tdk_rozstaw_pretow_liczba_pretow (getstring (strcat "\nPodaj ilosc pretow: <" tdk_rozstaw_pretow_aktualna_liczba_pretow ">")))
  (if (equal tdk_rozstaw_pretow_liczba_pretow "")
      (setq tdk_rozstaw_pretow_liczba_pretow tdk_rozstaw_pretow_aktualna_liczba_pretow)
      (princ)
  )
  (setq tdk_rozstaw_pretow_aktualna_liczba_pretow tdk_rozstaw_pretow_liczba_pretow)
  
  (setq tdk_rozstaw_pretow_odleglosc (* (distance tdk_rozstaw_pretow_p1 tdk_rozstaw_pretow_p2) 1000))
  (setq tdk_rozstaw_pretow_rozstaw (* 5 (fix (+ (/ (/ tdk_rozstaw_pretow_odleglosc (- (atoi tdk_rozstaw_pretow_liczba_pretow) 1)) 5) 0.0001))))
  (princ (strcat "Rozstaw pretow w rozkladzie wynosi: " (rtos (/ (float tdk_rozstaw_pretow_rozstaw) 10) 2 1) "cm"))
  (alert (strcat "Rozstaw pretow w rozkladzie wynosi: " (rtos (/ (float tdk_rozstaw_pretow_rozstaw) 10) 2 1) "cm"))
  (princ)
)