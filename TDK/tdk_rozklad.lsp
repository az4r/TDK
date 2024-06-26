(defun c:tdk_rozklad( / *error* )
  (defun *error* ( tdk_przyczyna_bledu )
    (command)(command)
    (command "_layer" "_S" tdk_aktualna_warstwa "")
    (princ)
  )
  (setq tdk_aktualna_warstwa (getvar "CLAYER"))
  (command "_layer" "_S" "0" "")
  (setq tdk_rozklad_p1 (getpoint "\nWskaz punkt poczatkowy rozkladu: "))
  (setq tdk_rozklad_p2 (getpoint tdk_rozklad_p1 "\nWskaz punkt koncowy rozkladu: "))
  (command "_dimaligned" tdk_rozklad_p1 tdk_rozklad_p2 "_T" " " tdk_rozklad_p2)
  ;;(vlax-put-property (vlax-ename->vla-object (entlast)) 'Arrowhead1Type 0)
  ;;(vlax-put-property (vlax-ename->vla-object (entlast)) 'Arrowhead2Type 0)
  ;;(vlax-put-property (vlax-ename->vla-object (entlast)) 'ExtLine1Suppress -1)
  ;;(vlax-put-property (vlax-ename->vla-object (entlast)) 'ExtLine2Suppress -1)
  ;(vlax-put-property (vlax-ename->vla-object (entlast)) 'ExtensionLineExtend 0)
  (command "_layer" "_S" tdk_aktualna_warstwa "")
  (princ)
)