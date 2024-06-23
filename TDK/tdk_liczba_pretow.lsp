(defun c:tdk_liczba_pretow ()
  (setq tdk_aktualna_liczba_pretow_rozstaw "150")
  (setq tdk_liczba_pretow_p1 (getpoint "\nWskaz poczatkowy punkt rozkladu"))
  (setq tdk_liczba_pretow_p2 (getpoint tdk_liczba_pretow_p1 "\nWskaz koncowy punkt rozkladu"))  
  
  (setq tdk_liczba_pretow_rozstaw (getstring (strcat "\nPodaj rozstaw pretow (mm): <" tdk_aktualna_liczba_pretow_rozstaw ">")))
  (if (equal tdk_liczba_pretow_rozstaw "")
      (setq tdk_liczba_pretow_rozstaw tdk_aktualna_liczba_pretow_rozstaw)
      (princ)
  )
  (setq tdk_aktualna_liczba_pretow_rozstaw tdk_liczba_pretow_rozstaw)
  
  (setq tdk_liczba_pretow_odleglosc (* (distance tdk_liczba_pretow_p1 tdk_liczba_pretow_p2) 1000))
  (setq tdk_liczba_pretow_wynik (rtos ((lambda ( tdk_liczba_pretow_licznik ) (cond ((equal 0.0 tdk_liczba_pretow_licznik 1e-8) (+ (/ tdk_liczba_pretow_odleglosc (atoi tdk_liczba_pretow_rozstaw)) 1)) ((< (+ (/ tdk_liczba_pretow_odleglosc (atoi tdk_liczba_pretow_rozstaw)) 1) 0) (- (+ (/ tdk_liczba_pretow_odleglosc (atoi tdk_liczba_pretow_rozstaw)) 1) tdk_liczba_pretow_licznik)) ((+ (+ (/ tdk_liczba_pretow_odleglosc (atoi tdk_liczba_pretow_rozstaw)) 1) (- 1 tdk_liczba_pretow_licznik))))) (rem (+ (/ tdk_liczba_pretow_odleglosc (atoi tdk_liczba_pretow_rozstaw)) 1) 1)) 2 0))
  (setq tdk_liczba_pretow_dlugosc_rozkladu (rtos (/ (*(- (atof tdk_liczba_pretow_wynik) 1) (atof tdk_liczba_pretow_rozstaw)) 1000) 2 4))
  (princ (strcat "Liczba pretow w rozkladzie wynosi: " tdk_liczba_pretow_wynik "\nWymagana dlugosc rozkladu dla tej liczby pretow wynosi: " tdk_liczba_pretow_dlugosc_rozkladu "m"))
  (alert (strcat "Liczba pretow w rozkladzie wynosi: " tdk_liczba_pretow_wynik "\nWymagana dlugosc rozkladu dla tej liczby pretow wynosi: " tdk_liczba_pretow_dlugosc_rozkladu "m"))
  (princ)
)